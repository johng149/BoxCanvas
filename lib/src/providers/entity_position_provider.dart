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

  ///Removes data referrred to by [id] and then [upsert] said data with [id]
  ///
  ///If no such data exists, nothing happens.
  ///
  ///The intended use has the assumption that data is being stored as a
  ///[LinkedHashMap] and the purpose of the data is for defining a stack.
  ///By removing and then reinserting the data, the widget that uses the
  ///data should now occur at the top of stack (in other words, last in the
  ///list of widgets in the stack)
  void refresh(String id) {
    final removed = remove(id, false);
    if (removed != null) {
      upsert(id, removed);
    }
  }

  ///Removes data referred to by [id] and then [upsert] given [data] with [id]
  ///
  ///If data referred to by [id] not exist, nothing happens.
  ///
  ///The intended use has the assumption that data is being stored as a
  ///[LinkedHashMap] and the purpose of the data is for defining a stack.
  ///By removing and then reinserting the data, the widget that uses the
  ///data should now occur at the top of stack (in other words, last in the
  ///list of widgets in the stack)
  void refreshWithData(String id, EntityPosition data) {
    final removed = remove(id, false);
    if (removed != null) {
      upsert(id, data);
    }
  }

  ///Sets position data to given [data] and notifies listeners
  void initialize(Map<String, EntityPosition> data) {
    this.data = data;
    notifyListeners();
  }
}
