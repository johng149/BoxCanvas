import 'package:box_canvas/src/abstract_providers/entity_body_provider_interface.dart';
import 'package:box_canvas/src/abstract_providers/entity_position_provider_interface.dart';
import 'package:box_canvas/src/abstract_providers/global_offset_provider_interface.dart';
import 'package:box_canvas/src/models/entity_position/entity_position.dart';
import 'package:box_canvas/src/models/xy_tuple/xy_tuple.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CanvasDraggable extends StatefulWidget {
  final String id;
  final BoxConstraints constraints;
  final StateNotifierProvider<IGlobalOffsetNotifier, XYTuple> globalOffset;
  final ChangeNotifierProvider<IEntityPositionNotifier> entityPositions;
  final ChangeNotifierProvider<IEntityBodyNotifier> entityBodies;
  final Widget body;
  final EntityPosition position;
  const CanvasDraggable(
      {Key? key,
      required this.id,
      required this.constraints,
      required this.globalOffset,
      required this.entityPositions,
      required this.entityBodies,
      required this.body,
      required this.position})
      : super(key: key);

  @override
  State<CanvasDraggable> createState() => _CanvasDraggableState();
}

class _CanvasDraggableState extends State<CanvasDraggable> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
