import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ipot/utils/enums.dart';

part 'order_model.freezed.dart';
part 'order_model.g.dart';

@freezed
abstract class OrderModel with _$OrderModel {
  const factory OrderModel({
    int? orderId,
    String? tableId,
    OrderStatus? status,
    String? customerNote,
    int? estimatedTime,
    List<Item>? items,
    DateTime? createdAt,
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
}

@freezed
abstract class Item with _$Item {
  const factory Item({
    int? menuItemId,
    String? name,
    String? imageUrl,
    int? quantity,
    double? unitPrice,
    List<Customization>? customizations,
  }) = _Item;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}

@freezed
abstract class Customization with _$Customization {
  const factory Customization({
    int? optionId,
    String? name,
    double? priceModifier,
    int? quantity,
  }) = _Customization;

  factory Customization.fromJson(Map<String, dynamic> json) =>
      _$CustomizationFromJson(json);
}
