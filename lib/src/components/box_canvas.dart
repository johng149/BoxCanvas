import 'package:box_canvas/src/abstract_providers/add_entity_option.dart';
import 'package:box_canvas/src/abstract_providers/entity_body_provider_interface.dart';
import 'package:box_canvas/src/abstract_providers/entity_position_provider_interface.dart';
import 'package:box_canvas/src/abstract_providers/global_offset_provider_interface.dart';
import 'package:box_canvas/src/components/canvas_draggable.dart';
import 'package:box_canvas/src/models/entity_position/entity_position.dart';
import 'package:box_canvas/src/models/xy_tuple/xy_tuple.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

class BoxCanvas extends ConsumerWidget {
  ///When user pans canvas instead of an individual widget, offset stored here
  ///
  ///This is called offset since all widgets will have their positions modified
  ///by the [XYTuple] referenced by the provider
  final StateNotifierProvider<IGlobalOffsetNotifier, XYTuple> globalOffset;

  ///Information about the positions of widgets in a Map<String,EntityPosition>
  ///
  ///Note that while a widget is being dragged around, its position in this
  ///provider isn't being updated since that causes too much lag. Only after
  ///the drag completes does the information in the provider update.
  ///
  ///While dragging, the offsets are stored in [CanvasDraggable] state
  final ChangeNotifierProvider<IEntityPositionNotifier> entityPositions;

  ///Information about the appearance of the widget on canvas
  ///
  ///It is recommended that these widgets use [GlobalKey]
  final ChangeNotifierProvider<IEntityBodyNotifier> entityBodies;

  ///Options to be shown when user clicks button to add widget to canvas
  final List<AddEntityOption> options;

  ///Used when creating widgets to given them unique identifier
  final _uid = const Uuid();

  const BoxCanvas(
      {Key? key,
      required this.globalOffset,
      required this.entityPositions,
      required this.entityBodies,
      required this.options})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //we use a layout builder so we know what screen size we have to work with
    //this is needed since positions and offsets in providers are relative to
    //the screen size. To use these values, we must first convert them to
    //absolute coordinates using the size of the screen
    return LayoutBuilder(builder: (context, constraints) {
      final entities =
          _entities(context: context, ref: ref, constraints: constraints);

      //we then use a [Stack] so entities are placed in correct location/depth
      //we also use this to place widgets to detect global pan and add button
      return Stack(
        children: [
          globalPanDetector(
              context: context,
              ref: ref,
              constraints: constraints,
              globalOffset: globalOffset),
          ...entities
        ],
      );
    });
  }

  // #region for what widgets should be on canvas and return list of them
  ///Widgets that should be displayed on canvas
  ///
  ///While it does not use [context] directly, it will pass [context] to
  ///the widgets since it may be that their behavior changes depending on it
  ///
  ///[ref] is used to read providers for data such as widget positions and
  ///[constraints] is also used for widget positions by converting relative
  ///positions to absolute positions, along wth determining whether a widget's
  ///position puts it off screen (and thus shouldn't be shown)
  List<Widget> _entities(
      {required BuildContext context,
      required WidgetRef ref,
      required BoxConstraints constraints}) {
    // #region _entities body
    final entities = <Widget>[];
    final positionsNotifier = ref.watch(entityPositions);
    final bodiesNotifier = ref.watch(entityBodies);
    final offset = ref.watch(globalOffset);
    for (final id in positionsNotifier.ids) {
      final pos = positionsNotifier.accessOpt(id);
      final body = bodiesNotifier.accessOpt(id);
      if (_entityVisible(pos: pos, body: body, offset: offset)) {
        entities.add(CanvasDraggable(
            id: id,
            constraints: constraints,
            globalOffset: globalOffset,
            entityPositions: entityPositions,
            entityBodies: entityBodies,

            //we can use null checks here since if [_entitiesVisible] function
            //returned true (and thus allowing us to run this code), it must
            //be that body and pos are not null
            body: body!,
            position: pos!));
      }
    }
    return entities;
    // #endregion
  }

  ///Determines if given widget is visible on the screen
  bool _entityVisible(
      {required EntityPosition? pos,
      required Widget? body,
      required XYTuple offset}) {
    // #region _entityVisible body

    //if position or body not exist, then widget is not visible
    if (pos == null || body == null) {
      return false;
    } else {
      //an entity's width is considered in screen if its right most edge position
      //(calculated using [pos.position.x + pos.size.x]) is at least
      //at the left most edge of the screen (calculated using
      //[-offset.x])
      //AND
      //the entity's left most edge position (calculated using [pos.position.x])
      //is at least at the right most edge of the screen. This is calculated by
      //checking if the position of the left most edge plus the horizontal offset
      //is less than 1. If it is greater than 1, then this means that the
      //left most edge is off the screen to the right
      final entityWidthInScreen = pos.position.x + pos.size.x >= -offset.x &&
          pos.position.x + offset.x <= 1;
      //an entity's height is considered in the screen if its top most edge
      //(calculated using [pos.position.y]) is at least above the bottom edge
      //of the screen. This is calculated by checking if the position of the
      //top plus the vertical offset is less than 1. If it is greater than 1,
      //then this means that the top most edge is below the bottom of the screen
      //AND
      //the entity's bottom edge (calculated using [pos.position.y + pos.size.y])
      //is at least below the top edge of the screen (calculated using
      //[-offset.y])
      final entityHeightInScreen = pos.position.y + offset.y <= 1 &&
          pos.position.y + pos.size.y >= -offset.y;
      return entityWidthInScreen && entityHeightInScreen;
    }
    // #endregion
  }
  // #endregion

  ///Creates [GestureDetector] that updates [globalOffset] upon dragging
  Widget globalPanDetector(
      {required BuildContext context,
      required WidgetRef ref,
      required BoxConstraints constraints,
      required StateNotifierProvider<IGlobalOffsetNotifier, XYTuple>
          globalOffset}) {
    return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onPanUpdate: (details) {
          globalPanUpdate(
              details: details,
              ref: ref,
              constraints: constraints,
              globalOffset: globalOffset);
        });
  }

  ///Turns drag details to relative [XYTuple] then adds it to global offset
  ///
  ///Uses [details] along with [constraints] to create a relative [XYTuple],
  ///then uses [ref] to read data from [globalOffset] and adds the created
  ///[XYTuple] to data and writes it back to [globalOffset] using [ref]
  void globalPanUpdate(
      {required DragUpdateDetails details,
      required WidgetRef ref,
      required BoxConstraints constraints,
      required StateNotifierProvider<IGlobalOffsetNotifier, XYTuple>
          globalOffset}) {
    final dx = details.delta.dx;
    final dy = details.delta.dy;
    final delta =
        XYTuple(x: dx, y: dy, relative: false).toRelative(constraints);
    final currentOffset = ref.read(globalOffset);
    final newOffset = currentOffset.add(other: delta);
    ref.read(globalOffset.notifier).setOffset(newOffset);
  }
}
