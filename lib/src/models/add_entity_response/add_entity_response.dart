import 'package:flutter/material.dart';

/// AddEntityResponse is a generic that also holds a widget
class AddEntityResponse<T> {
  /// The entity that was added
  final T info;

  /// The widget that was added
  final Widget widget;

  /// Constructor
  AddEntityResponse({required this.info, required this.widget});
}
