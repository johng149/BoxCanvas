import 'package:flutter/material.dart';

abstract class IEntityBodyNotifier extends ChangeNotifier {
  Map<String, Widget> get allData;

  ///Attempt to read body referrenced by [id]
  Widget? accessOpt(String id);

  ///Tries to remove [Widget] referenced by given [id] and return it
  ///
  ///If there was a [Widget] at the given [id] and [notify] is true,
  ///will notify all listeners about the change
  Widget? remove(String id, [bool notify = true]);

  ///Sets position at [id] to given [allData]
  ///
  ///If [notify] is true, notify all listeners about the change
  void set(String id, Widget body, [bool notify = true]);

  void initialize(Map<String, Widget> data);
}
