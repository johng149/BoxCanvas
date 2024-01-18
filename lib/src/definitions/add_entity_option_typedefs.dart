import 'package:flutter/material.dart';

///Giving [context] and [id], create [Widget] that will appear on canvas
///
///It is not the responsibility of this function to add the [Widget] it creates
///to the canvas since the only thing it does is produce [Widget] to be added
typedef AddEntityFunction<D> = Widget Function(
    {required BuildContext context, required String id, D? data});

///Giving [info], prime for adding to canvas by potentially getting custom id
///
///it will be given [info] and a proposed [id]
typedef AddEntityPrimer<T> = T Function();

///Function called when making label that is next to button for adding entity
typedef AddEntityLabelMaker = String Function(BuildContext context);
