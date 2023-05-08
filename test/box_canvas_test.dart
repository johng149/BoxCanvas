import 'package:box_canvas/box_canvas.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("XY Tuple", () {
    test("Create and jsonify, then convert back", () {
      final tuple = XYTuple(x: 0, y: 0, relative: true);
      final json = tuple.toJson();
      final tuple2 = XYTuple.fromJson(json);
      expect(tuple2, tuple);
    });
  });

  group("Entity Position", () {
    test("Create and jsonify, then convert back", () {
      final position = XYTuple(x: 0, y: 0, relative: true);
      final size = XYTuple(x: 0, y: 0, relative: true);
      final entityPosition =
          EntityPosition(position: position, size: size, relative: true);
      final json = entityPosition.toJson();
      final entityPosition2 = EntityPosition.fromJson(json);
      expect(entityPosition2, entityPosition);
    });
  });
}
