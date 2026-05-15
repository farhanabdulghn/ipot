import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'language_model.freezed.dart';

@freezed
abstract class LanguageModel with _$LanguageModel {
  const factory LanguageModel({
    required Locale locale,
    required String flag,
    required String label,
    required String sublabel,
  }) = _LanguageModel;
}
