import 'package:box_canvas/box_canvas.dart';

/// Function that is called when an entity is added
typedef AddEntityCallback<T> = void Function(
    {required EntityPosition position, required String id, required T info});
