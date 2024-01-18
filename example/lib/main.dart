import 'dart:math';

import 'package:box_canvas/box_canvas.dart';
import 'package:example/providers/entity_body_provider.dart';
import 'package:example/providers/entity_position_provider.dart';
import 'package:example/providers/global_offset_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget _addEntityFunction(
      {required BuildContext context, required String id, String? data}) {
    const lowerBound = 2;
    const upperBound = 24;
    final selected = Random().nextInt(upperBound - lowerBound) + lowerBound;
    final widget = ListView(
      key: GlobalKey(),
      children: [
        Text(data ?? "no data"),
        for (int i = 0; i < selected; i++) Text("a" * i),
        Text(selected.toString())
      ],
    );
    return widget;
  }

  String _labelMaker(BuildContext context) {
    return "List";
  }

  /// the add entity callback
  void _addCallback(
      {required EntityPosition position,
      required String id,
      required String info}) {
    // for debugging, will just print the position and id
    print("position: $position, id: $id, with info: $info");
  }

  /// entity drag callback
  void _dragCallback({required String id, required EntityPosition position}) {
    // for debugging, will just print the position and id
    print("position: $position, id: $id");
  }

  /// entity resize callback
  void _resizeCallback({required String id, required EntityPosition position}) {
    // for debugging, will just print the position and id
    print("position: $position, id: $id");

    // also try turning position into json and then back to see if it works
    final json = position.toJson();
    final position2 = EntityPosition.fromJson(json);
    print("position2: $position2");
  }

  Future<CustomEntityIdCallbackResult<String>> _customIdCallback(
      {required String proposedId,
      required EntityPosition position,
      required String info}) {
    final CustomEntityIdCallbackResult<String> result =
        CustomEntityIdCallbackResult(id: "$proposedId NICE!", data: "testing");
    return Future.value(result);
  }

  @override
  Widget build(BuildContext context) {
    List<AddEntityOption<String, String>> options = [
      AddEntityOption<String, String>(
          addEntityFunction: _addEntityFunction,
          addEntityLabelMaker: _labelMaker,
          addEntityPrimer: () => "entity info",
          icon: Icon(Icons.list))
    ];
    return Scaffold(
        appBar: AppBar(title: const Text("Test AppBar")),
        body: BoxCanvas<String, String>(
            globalOffset: globalOffsetProvider,
            entityPositions: entityPositionProvider,
            entityBodies: entityBodyProvider,
            options: options,
            addEntityCallback: _addCallback,
            customEntityIdCallback: _customIdCallback,
            onDragEnd: _dragCallback,
            onResizeEnd: _resizeCallback));
  }
}
