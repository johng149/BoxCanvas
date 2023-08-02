import 'package:box_canvas/src/models/add_entity_response/add_entity_response.dart';
import 'package:flutter/material.dart';

///Giving [context] and [id], create [Widget] that will appear on canvas
///
///It is not the responsibility of this function to add the [Widget] it creates
///to the canvas since the only thing it does is produce [Widget] to be added
typedef AddEntityFunction<T> = AddEntityResponse<T> Function(
    {required BuildContext context, required String id});

///Function called when making label that is next to button for adding entity
typedef AddEntityLabelMaker = String Function(BuildContext context);
