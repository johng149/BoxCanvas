import 'package:box_canvas/src/models/xy_tuple/xy_tuple.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class IGlobalOffsetNotifier extends StateNotifier<XYTuple> {
  IGlobalOffsetNotifier() : super(XYTuple.zero(true));

  ///Sets current offset to given [t], notify listeners
  void setOffset(XYTuple t);
}
