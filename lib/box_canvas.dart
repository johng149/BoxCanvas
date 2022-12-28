library box_canvas;

//export 'src/test_component.dart' show TestComponent;

//exports for [AddEntityOption] class, used when constructing Canvas component
export 'src/providers/add_entity_option.dart' show AddEntityOption;

//exports for providers used when constructing Canvas component
//and supporting models
export 'src/models/xy_tuple/xy_tuple.dart' show XYTuple;
export 'src/models/entity_position/entity_position.dart' show EntityPosition;
export 'src/providers/entity_body_notifier.dart' show EntityBodyNotifier;
export 'src/providers/entity_position_provider.dart'
    show EntityPositionNotifier;
export 'src/providers/global_offset_provider_interface.dart'
    show GlobalOffsetNotifier;

//BoxCanvas export
export 'src/components/box_canvas.dart' show BoxCanvas;
