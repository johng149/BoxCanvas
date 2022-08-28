import 'package:flutter/material.dart';

Widget outlinedCardMaker(Widget body) {
  return Card(
    shape: const RoundedRectangleBorder(
        side: BorderSide(color: Colors.black),
        borderRadius: BorderRadius.all(Radius.circular(12))),
    child: body,
  );
}
