import 'package:box_canvas/box_canvas.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EntityPositionNotifier extends IEntityPositionNotifier {
  Map<String, EntityPosition> data = {};

  @override
  EntityPosition? accessOpt(String id) {
    return data[id];
  }

  @override
  Map<String, EntityPosition> get allData => data;

  @override
  Iterable<String> get ids => data.keys;

  @override
  void initialize(Map<String, EntityPosition> data) {
    this.data = data;
    notifyListeners();
  }

  @override
  void refresh(String id) {
    final removed = remove(id, false);
    if (removed != null) {
      upsert(id, removed);
    }
  }

  @override
  void refreshWithData(String id, EntityPosition data) {
    final removed = remove(id, false);
    if (removed != null) {
      upsert(id, data);
    }
  }

  @override
  EntityPosition? remove(String id, [bool notify = true]) {
    final removed = data.remove(id);
    if (notify && removed != null) {
      notifyListeners();
    }
    return removed;
  }

  @override
  void upsert(String id, EntityPosition data, [bool notify = true]) {
    this.data[id] = data;
    if (notify) {
      notifyListeners();
    }
  }
}

final entityPositionProvider =
    ChangeNotifierProvider<EntityPositionNotifier>((ref) {
  return EntityPositionNotifier();
});
