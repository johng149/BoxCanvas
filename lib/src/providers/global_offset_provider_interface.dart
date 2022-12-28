import 'package:box_canvas/src/models/xy_tuple/xy_tuple.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GlobalOffsetNotifier extends StateNotifier<XYTuple> {
  GlobalOffsetNotifier() : super(XYTuple.zero(true));

  ///Sets current offset to given [t], notify listeners
  void setOffset(XYTuple t) {
    state = t;
  }
}
