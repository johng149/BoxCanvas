library box_canvas;

//export 'src/test_component.dart' show TestComponent;

//exports for [AddEntityOption] class, used when constructing Canvas component
export 'src/abstract_providers/add_entity_option.dart' show AddEntityOption;

//exports for providers used when constructing Canvas component
export 'src/abstract_providers/entity_body_provider_interface.dart'
    show IEntityBodyNotifier;
export 'src/abstract_providers/entity_position_provider_interface.dart'
    show IEntityPositionNotifier;
export 'src/abstract_providers/global_offset_provider_interface.dart'
    show IGlobalOffsetNotifier;

//BoxCanvas export
export 'src/components/box_canvas.dart' show BoxCanvas;
