import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ipot/l10n/app_localizations.dart';

part 'component_props_model.freezed.dart';

@freezed
abstract class ComponentPropsModel with _$ComponentPropsModel {
  const factory ComponentPropsModel({
    String Function(AppLocalizations)? label,
    String? title,
    String? subtitle,
    IconData? regularIcon,
    IconData? fillIcon,
    IconData? duotone,
    Color? color,
  }) = _ComponentPropsModel;
}
