import 'package:box_canvas/box_canvas.dart';

/// Function called when entity drag completes
typedef EntityDragCallback = void Function({
  required String id,
  required EntityPosition position,
});

/// Function called when entity resize completes
typedef EntityResizeCallback = void Function({
  required String id,
  required EntityPosition position,
});
