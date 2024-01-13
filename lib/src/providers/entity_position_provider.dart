import 'package:box_canvas/src/models/entity_position/entity_position.dart';
import 'package:flutter/cupertino.dart';

///Contains only data for determining where and how big entity should be
///
///The data needed to render its insides should be in a different provider
///
///Assumes all [EntityPosition] has [isRelative] as true (see [EntityPosition
///class for more information])
class EntityPositionNotifier extends ChangeNotifier {
  Map<String, EntityPosition> data = {};
  Map<String, EntityPosition> get allData => data;

  Iterable<String> get ids => data.keys;

  Iterable<String> sortedIds() {
    return data.keys.toList()..sort((a, b) => data[a]!.compareTo(data[b]!));
  }

  ///Attempt to read position referred to by [id]
  EntityPosition? accessOpt(String id) {
    return data[id];
  }

  ///Update or inserts [data] with pointer of [id] uniquely referring to it
  ///
  ///Use [notify] parameter to avoid notifying listeners. This should only
  ///be set to false if the function that calls this will notify listeners
  ///(to prevent unnecessary notifications)
  void upsert(String id, EntityPosition data, [bool notify = true]) {
    this.data[id] = data;
    if (notify) {
      notifyListeners();
    }
  }

  ///Removes data referred to by [id] if it exists
  ///
  ///If no such data exists, nothing happens
  ///
  ///Use [notify] parameter to avoid notifying listeners. This should only
  ///be set to false if the function that calls this will notify listeners
  ///(to prevent unnecessary notifications)
  EntityPosition? remove(String id, [bool notify = true]) {
    final removed = data.remove(id);
    if (notify && removed != null) {
      notifyListeners();
    }
    return removed;
  }

  ///Sets position data to given [data] and notifies listeners
  void initialize(Map<String, EntityPosition> data) {
    this.data = data;
    notifyListeners();
  }
}
