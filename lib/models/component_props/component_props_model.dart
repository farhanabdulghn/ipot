import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ipot/l10n/app_localizations.dart';

part 'component_props_model.freezed.dart';

@freezed
abstract class ComponentPropsModel with _$ComponentPropsModel {
  const factory ComponentPropsModel({
    required String Function(AppLocalizations) title,
    String Function(AppLocalizations)? subtitle,
    Object? regularIcon,
    Object? fillIcon,
    Object? duotoneIcon,
    Color? color,
  }) = _ComponentPropsModel;
}
