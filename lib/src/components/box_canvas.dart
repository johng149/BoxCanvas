import 'package:box_canvas/src/abstract_providers/add_entity_option.dart';
import 'package:box_canvas/src/abstract_providers/entity_body_provider_interface.dart';
import 'package:box_canvas/src/abstract_providers/entity_position_provider_interface.dart';
import 'package:box_canvas/src/abstract_providers/global_offset_provider_interface.dart';
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
    // TODO: implement build
    throw UnimplementedError();
  }
}
