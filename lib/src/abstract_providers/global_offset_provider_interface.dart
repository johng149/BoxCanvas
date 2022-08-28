import 'package:box_canvas/src/models/xy_tuple/xy_tuple.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class IGlobalOffsetNotifier extends StateNotifier<XYTuple> {
  IGlobalOffsetNotifier() : super(XYTuple.zero(true));

  void setOffset(XYTuple t);
}
