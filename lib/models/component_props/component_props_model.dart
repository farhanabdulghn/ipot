import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'component_props_model.freezed.dart';

@freezed
abstract class ComponentPropsModel with _$ComponentPropsModel {
  const factory ComponentPropsModel({
    String? title,
    String? subtitle,
    IconData? regularIcon,
    IconData? fillIcon,
    IconData? duotone,
    Color? color,
  }) = _ComponentPropsModel;
}
