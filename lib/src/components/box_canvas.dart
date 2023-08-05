import 'package:box_canvas/src/definitions/add_entity_callback_typedef.dart';
import 'package:box_canvas/src/definitions/custom_entity_id_callback.typedef.dart';
import 'package:box_canvas/src/definitions/entity_drag_callback_typedefs.dart';
import 'package:box_canvas/src/models/add_entity_response/add_entity_response.dart';
import 'package:box_canvas/src/providers/add_entity_option.dart';
import 'package:box_canvas/src/providers/entity_body_notifier.dart';
import 'package:box_canvas/src/providers/entity_position_provider.dart';
import 'package:box_canvas/src/providers/global_offset_provider_interface.dart';
import 'package:box_canvas/src/components/canvas_draggable.dart';
import 'package:box_canvas/src/models/entity_position/entity_position.dart';
import 'package:box_canvas/src/models/xy_tuple/xy_tuple.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:uuid/uuid.dart';

///Displays widgets on screen based on data regarding them in given providers
///
///Also, creates [SpeedDial] for adding new widgets based on given [options]
class BoxCanvas<T> extends ConsumerWidget {
  ///When user pans canvas instead of an individual widget, offset stored here
  ///
  ///This is called offset since all widgets will have their positions modified
  ///by the [XYTuple] referenced by the provider
  final StateNotifierProvider<GlobalOffsetNotifier, XYTuple> globalOffset;

  ///Information about the positions of widgets in a Map<String,EntityPosition>
  ///
  ///Note that while a widget is being dragged around, its position in this
  ///provider isn't being updated since that causes too much lag. Only after
  ///the drag completes does the information in the provider update.
  ///
  ///While dragging, the offsets are stored in [CanvasDraggable] state
  final ChangeNotifierProvider<EntityPositionNotifier> entityPositions;

  ///Information about the appearance of the widget on canvas
  ///
  ///It is recommended that these widgets use [GlobalKey]
  final ChangeNotifierProvider<EntityBodyNotifier> entityBodies;

  ///Options to be shown when user clicks button to add widget to canvas
  final List<AddEntityOption<T>> options;

  ///Callback for when entity is added to canvas
  final AddEntityCallback<T>? addEntityCallback;

  ///Callback for entity drag completion
  final EntityDragCallback? onDragEnd;

  ///Callback for entity resize completion
  final EntityResizeCallback? onResizeEnd;

  ///Callback to change how id is assigned to new entities
  final CustomEntityIdCallback<T>? customEntityIdCallback;

  ///Used when creating widgets to given them unique identifier
  final _uid = const Uuid();

  const BoxCanvas(
      {Key? key,
      required this.globalOffset,
      required this.entityPositions,
      required this.entityBodies,
      required this.options,
      this.addEntityCallback,
      this.customEntityIdCallback,
      this.onDragEnd,
      this.onResizeEnd})
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
          ...entities,
          addEntityButton(
              context: context,
              ref: ref,
              entityPositions: entityPositions,
              globalOffset: globalOffset,
              entityBodies: entityBodies,
              constraints: constraints)
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
            onDragEnd: onDragEnd,
            onResizeEnd: onResizeEnd,

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

  // #region for global pan detector
  ///Creates [GestureDetector] that updates [globalOffset] upon dragging
  Widget globalPanDetector(
      {required BuildContext context,
      required WidgetRef ref,
      required BoxConstraints constraints,
      required StateNotifierProvider<GlobalOffsetNotifier, XYTuple>
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
      required StateNotifierProvider<GlobalOffsetNotifier, XYTuple>
          globalOffset}) {
    final dx = details.delta.dx;
    final dy = details.delta.dy;
    final delta =
        XYTuple(x: dx, y: dy, relative: false).toRelative(constraints);
    final currentOffset = ref.read(globalOffset);
    final newOffset = currentOffset.add(other: delta);
    ref.read(globalOffset.notifier).setOffset(newOffset);
  }
  // #endregion

  // #region for add entity button
  ///Button that provides options user for creating entities on canvas
  ///
  ///The options are specified as [options] variable in [BoxCanvas] constructor
  ///and these options are parsed into [SpeedDialChild] objects which uses the
  ///function specified in each option when adding entity to canvas
  ///
  ///It is [Align] to bottomRight of screen
  Widget addEntityButton(
      {required BuildContext context,
      required WidgetRef ref,
      required ChangeNotifierProvider<EntityPositionNotifier> entityPositions,
      required StateNotifierProvider<GlobalOffsetNotifier, XYTuple>
          globalOffset,
      required ChangeNotifierProvider<EntityBodyNotifier> entityBodies,
      required BoxConstraints constraints}) {
    return Align(
      alignment: Alignment.bottomRight,
      child: SpeedDial(
        icon: Icons.add,
        activeIcon: Icons.close,
        children: optionsToSpeedDialChildren(ref: ref, context: context),
      ),
    );
  }

  ///Uses class variable [options] to create list of [SpeedDialChild]
  ///
  ///[context] is passed to label maker function of each option to create
  ///label for their respective [SpeedDialChild]
  List<SpeedDialChild> optionsToSpeedDialChildren(
      {required WidgetRef ref, required BuildContext context}) {
    List<SpeedDialChild> children = [];
    for (final option in options) {
      final label = option.addEntityLabelMaker(context);
      final child = SpeedDialChild(
          child: option.icon,
          label: label,
          onTap: () {
            final entityId = _uid.v4();
            final entity =
                option.addEntityFunction(context: context, id: entityId);
            _addEntityToProviders(ref: ref, id: entityId, response: entity);
          });
      children.add(child);
    }
    return children;
  }

  ///Adds given [response] to providers using given [id]
  ///
  ///The position of the newly added record depends on the current global pan
  ///state, and thus the entity will appear in the upper left hand corner
  ///regardless of how user has globally panned the canvas
  ///
  ///if custom entity id callback is specified, then [id] will be ignored
  ///and the result of the callback will be used as the id instead
  void _addEntityToProviders(
      {required WidgetRef ref,
      required String id,
      required AddEntityResponse<T> response}) {
    //we want entity to always be added on the upper left hand corner, so
    //we need to know where the user has global panned so far to ensure
    //position is correct
    final currentGlobalOffset = ref.read(globalOffset);

    //since we want the new entities to be added in the same position regardless
    //of offset, we need to negate it.
    //
    //For example, if pan to the right, global offset will be positive,
    //but since all new entities should start on the left edge of the screen,
    //we want the negative of offset (which in this example will be negative),
    //this is so when calculating position to render it, this negative of the
    //offset will cancel out the global offset, so is entity on left edge
    final position = currentGlobalOffset.negate();

    //initial size of entity
    final size = XYTuple(x: 0.25, y: 0.25, relative: true);
    final entityPosition =
        EntityPosition(position: position, size: size, relative: true);
    final entity = response.widget;
    if (customEntityIdCallback != null) {
      customEntityIdCallback!
          .call(proposedId: id, position: entityPosition, info: response)
          .then((value) {
        _addEntityToProvidersHelper(
            ref: ref, id: value, response: response, position: entityPosition);
      });
    } else {
      _addEntityToProvidersHelper(
          ref: ref, id: id, response: response, position: entityPosition);
    }
  }

  void _addEntityToProvidersHelper(
      {required WidgetRef ref,
      required String id,
      required AddEntityResponse<T> response,
      required EntityPosition position}) {
    ref.read(entityPositions).upsert(id, position);
    ref.read(entityBodies).set(id, response.widget);
    addEntityCallback?.call(position: position, id: id, info: response.info);
  }
// #endregion
}
