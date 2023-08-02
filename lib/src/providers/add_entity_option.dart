import 'package:box_canvas/src/definitions/add_entity_option_typedefs.dart';
import 'package:flutter/material.dart';

class AddEntityOption<T> {
  AddEntityFunction<T> addEntityFunction;
  AddEntityLabelMaker addEntityLabelMaker;
  Icon icon;

  AddEntityOption(
      {required this.addEntityFunction,
      required this.addEntityLabelMaker,
      required this.icon});
}
