import 'package:box_canvas/box_canvas.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GlobalOffsetNotifier extends IGlobalOffsetNotifier {
  @override
  void setOffset(XYTuple t) {
    state = t;
  }
}

final globalOffsetProvider =
    StateNotifierProvider<GlobalOffsetNotifier, XYTuple>((ref) {
  return GlobalOffsetNotifier();
});
