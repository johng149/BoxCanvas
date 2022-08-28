import 'package:box_canvas/src/abstract_providers/add_entity_option.dart';
import 'package:box_canvas/src/abstract_providers/entity_body_provider_interface.dart';
import 'package:box_canvas/src/abstract_providers/entity_position_provider_interface.dart';
import 'package:box_canvas/src/abstract_providers/global_offset_provider_interface.dart';
import 'package:box_canvas/src/models/xy_tuple/xy_tuple.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BoxCanvas extends ConsumerWidget {
  final StateNotifierProvider<IGlobalOffsetNotifier, XYTuple> globalOffset;
  final ChangeNotifierProvider<IEntityPositionNotifier> entityPositions;
  final ChangeNotifierProvider<IEntityBodyNotifier> entityBodies;
  final List<AddEntityOption> options;

  const BoxCanvas(
      {Key? key,
      required this.globalOffset,
      required this.entityPositions,
      required this.entityBodies,
      required this.options})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
