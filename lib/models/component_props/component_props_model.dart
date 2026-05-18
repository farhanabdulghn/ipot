import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ipot/l10n/app_localizations.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

part 'component_props_model.freezed.dart';

@freezed
abstract class ComponentPropsModel with _$ComponentPropsModel {
  const factory ComponentPropsModel({
    required String Function(AppLocalizations) title,
    String Function(AppLocalizations)? subtitle,
    required IconData Function(PhosphorIconsStyle) icon,
    Color? color,
  }) = _ComponentPropsModel;
}
