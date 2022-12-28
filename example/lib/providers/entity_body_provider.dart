import 'package:box_canvas/box_canvas.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final entityBodyProvider = ChangeNotifierProvider<EntityBodyNotifier>((ref) {
  return EntityBodyNotifier();
});
