import 'package:flutter/material.dart';

///Function called when adding entity data (presumably to given providers)
typedef AddEntityFunction = Widget Function(
    {required BuildContext context, required String id});

///Function called when making label that is next to button for adding entity
typedef AddEntityLabelMaker = String Function(BuildContext context);
