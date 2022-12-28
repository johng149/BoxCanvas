import 'package:box_canvas/box_canvas.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final entityPositionProvider =
    ChangeNotifierProvider<EntityPositionNotifier>((ref) {
  return EntityPositionNotifier();
});
