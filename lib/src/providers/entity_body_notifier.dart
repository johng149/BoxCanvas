import 'package:flutter/material.dart';

class EntityBodyNotifier extends ChangeNotifier {
  Map<String, Widget> data = {};
  Map<String, Widget> get allData => data;

  ///Attempt to read body referrenced by [id]
  Widget? accessOpt(String id) {
    return data[id];
  }

  ///Tries to remove [Widget] referenced by given [id] and return it
  ///
  ///If there was a [Widget] at the given [id] and [notify] is true,
  ///will notify all listeners about the change
  Widget? remove(String id, [bool notify = true]) {
    final removed = data.remove(id);
    if (notify && removed != null) {
      notifyListeners();
    }
    return removed;
  }

  ///Sets position at [id] to given [allData]
  ///
  ///If [notify] is true, notify all listeners about the change
  void set(String id, Widget body, [bool notify = true]) {
    data[id] = body;
    if (notify) {
      notifyListeners();
    }
  }

  void initialize(Map<String, Widget> data) {
    this.data = data;
    notifyListeners();
  }
}
