import 'package:box_canvas/src/abstract_providers/entity_body_provider_interface.dart';
import 'package:box_canvas/src/abstract_providers/entity_position_provider_interface.dart';
import 'package:box_canvas/src/abstract_providers/global_offset_provider_interface.dart';
import 'package:box_canvas/src/builders/outlined_card.dart';
import 'package:box_canvas/src/models/entity_position/entity_position.dart';
import 'package:box_canvas/src/models/xy_tuple/xy_tuple.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///Displays given [body] and handles movement and updating coords in providers
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
  double xOffset = 0;
  double yOffset = 0;
  double xSizeOffset = 0;
  double ySizeOffset = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: ((context, ref, child) {
      final globalOffset = ref.watch(widget.globalOffset);
      return _draggable(context: context, ref: ref);
    }));
  }

  ///Creates draggable and resizable card that wraps body in [CanvasDraggable]
  ///
  ///The order in which widgets are nested is as follows:
  ///entityBody -> entityCard -> entityPanGestureDetector
  ///
  ///The entityBody contains the body given to [CanvasDraggable] and a resize
  ///detector
  ///
  ///The entityCard wraps entityBody in a outlined card
  ///
  ///The entityPanGestureDetector allows user to move card around
  Widget _draggable({required BuildContext context, required WidgetRef ref}) {
    final entityBody = Column(
      children: [
        Expanded(child: widget.body),
        Align(
          alignment: Alignment.bottomRight,
          child: Placeholder(), //TODO add size shifter
        )
      ],
    );
    final entityCard = outlinedCardMaker(entityBody);
    //TODO add pan gesture detector
    return entityCard;
  }
}
