import 'package:box_canvas/box_canvas.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EntityBodyNotifier extends IEntityBodyNotifier {
  Map<String, Widget> data = {};

  @override
  Widget? accessOpt(String id) {
    return data[id];
  }

  @override
  // TODO: implement allData
  Map<String, Widget> get allData => data;

  @override
  void initialize(Map<String, Widget> data) {
    this.data = data;
    notifyListeners();
  }

  @override
  Widget? remove(String id, [bool notify = true]) {
    final removed = data.remove(id);
    if (notify && removed != null) {
      notifyListeners();
    }
    return removed;
  }

  @override
  void set(String id, Widget body, [bool notify = true]) {
    data[id] = body;
    if (notify) {
      notifyListeners();
    }
  }
}

final entityBodyProvider = ChangeNotifierProvider<EntityBodyNotifier>((ref) {
  return EntityBodyNotifier();
});
