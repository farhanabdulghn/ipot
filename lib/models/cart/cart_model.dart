import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ipot/models/item/item_model.dart';

part 'cart_model.freezed.dart';
part 'cart_model.g.dart';

@freezed
abstract class CartModel with _$CartModel {
  const factory CartModel({
    String? tableId,
    @Default([]) List<ItemModel> items,
    String? customerNote,
  }) = _CartModel;

  factory CartModel.fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);
}
