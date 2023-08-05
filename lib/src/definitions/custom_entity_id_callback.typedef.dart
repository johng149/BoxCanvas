import 'package:box_canvas/box_canvas.dart';

/// Given an [entityPosition] and [response] return an id
///
/// the [proposedId] is the id that was generated by the canvas
/// as some callbacks may want to use that id
///
/// this is async as it is expected for the callback to interact with
/// backend services to generate the id
///
/// if the resulting id is null, the entity will not be added
typedef CustomEntityIdCallback<T> = Future<String?> Function(
    {required String proposedId,
    required EntityPosition position,
    required AddEntityResponse<T> info});
