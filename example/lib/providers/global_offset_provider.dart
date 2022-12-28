import 'package:box_canvas/box_canvas.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final globalOffsetProvider =
    StateNotifierProvider<GlobalOffsetNotifier, XYTuple>((ref) {
  return GlobalOffsetNotifier();
});
