import 'package:freezed_annotation/freezed_annotation.dart';

part 'page_handle_model.freezed.dart';

@freezed
abstract class PageHandleModel with _$PageHandleModel {
  const factory PageHandleModel({
    @Default(0) int page,
    @Default(false) bool shortcut,
    @Default(0) double menuNavigationHeight,
    int? orderId,
  }) = _PageHandleModel;
}
