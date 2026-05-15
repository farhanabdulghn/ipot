part of 'extensions.dart';

extension StringNullableExtension on String? {
  bool get hasValue => this != null && this!.isNotEmpty;
  bool get hasNoValue => !hasValue;
}
