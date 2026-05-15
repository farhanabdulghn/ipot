part of 'extensions.dart';

extension ListNullableExtension<T> on List<T>? {
  bool get hasValue => this != null && this!.isNotEmpty;
  bool get hasNoValue => !hasValue;
}
