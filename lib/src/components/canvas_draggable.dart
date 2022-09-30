import 'dart:math';

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
  ///entityBody -> entityCard -> entityPanGestureDetector -> SizedBox
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
          child: _entityResizeDetector(
              context: context, ref: ref), //TODO add size shifter
        )
      ],
    );
    final entityCard = outlinedCardMaker(entityBody);
    final pannableEntity =
        _entityPanDetector(context: context, ref: ref, child: entityCard);
    final absSize = widget.position.size.toAbsolute(widget.constraints);
    final absPos = widget.position.position.toAbsolute(widget.constraints);
    final globalOffset = ref.watch(widget.globalOffset);
    final boxed = SizedBox(
      width: max(absSize.x + xSizeOffset, 32),
      height: max(absSize.y + ySizeOffset, 32),
      child: pannableEntity,
    );
    final positioned = Positioned(
        left: (absPos.x + xOffset) + globalOffset.x,
        top: (absPos.y + yOffset) + globalOffset.y,
        child: boxed);
    return positioned;
  }

  // #region pan detection
  Widget _entityPanDetector(
      {required BuildContext context,
      required WidgetRef ref,
      required Widget child}) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onPanEnd: (details) {
        _panEnd(ref: ref);
      },
      onPanUpdate: (details) {
        _panUpdate(details);
      },
      child: child,
    );
  }

  void _panEnd({required WidgetRef ref}) {
    XYTuple absPos = widget.position.position.toAbsolute(widget.constraints);
    double currentX = absPos.x + xOffset;
    double currentY = absPos.y + yOffset;
    XYTuple relativePos = XYTuple(x: currentX, y: currentY, relative: false)
        .toRelative(widget.constraints);
    final newEntityPos = widget.position.copyWith(position: relativePos);

    ref.read(widget.entityPositions).refreshWithData(widget.id, newEntityPos);
    setState(() {
      xOffset = 0;
      yOffset = 0;
    });
  }

  void _panUpdate(DragUpdateDetails details) {
    setState(() {
      xOffset += details.delta.dx;
      yOffset += details.delta.dy;
    });
  }
// #endregion

  // #region resizing detection
  ///[GestureDetector] that updates size of widget when user drags
  Widget _entityResizeDetector(
      {required BuildContext context, required WidgetRef ref}) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onPanEnd: (details) {
        _resizeEnd(context: context, ref: ref);
      },
      onPanUpdate: (details) {
        _resizeUpdate(details);
      },
      child: const Icon(Icons.drag_handle),
    );
  }

  ///Updates internal state size offsets when resize drag is being updated
  ///
  ///This is because going to the provider each time causes too much lag,
  ///and so this function does not update provider state, to update provider
  ///state, must call [_resizeEnd]
  void _resizeUpdate(DragUpdateDetails details) {
    setState(() {
      xSizeOffset += details.delta.dx;
      ySizeOffset += details.delta.dy;
    });
  }

  ///Updates provider state with current internal offsets and resets offsets
  ///
  ///This should only be called once user has stopped interacting with drag
  ///handle. After that, will accumulate the drag resize into data in providers
  ///and reset the temporary drag size offsets.
  ///
  ///This function does not update internal resize offsets, see [_resizeUpdate]
  void _resizeEnd({required BuildContext context, required WidgetRef ref}) {
    XYTuple absEntitySize = widget.position.size.toAbsolute(widget.constraints);
    final sizeX = absEntitySize.x + xSizeOffset;
    final sizeY = absEntitySize.y + ySizeOffset;
    XYTuple relEntitySize = XYTuple(x: sizeX, y: sizeY, relative: false)
        .ensureGr()
        .toRelative(widget.constraints);
    EntityPosition newPos = widget.position.copyWith(size: relEntitySize);
    ref.read(widget.entityPositions).upsert(widget.id, newPos);
    setState(() {
      xSizeOffset = 0;
      ySizeOffset = 0;
    });
  }
// #endregion
}
