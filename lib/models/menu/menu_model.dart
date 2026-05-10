import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ipot/models/category/category_model.dart';

part 'menu_model.freezed.dart';
part 'menu_model.g.dart';

@freezed
abstract class MenuModel with _$MenuModel {
  const factory MenuModel({
    Restaurant? restaurant,
    List<CategoryModel>? categories,
    List<Item>? items,
  }) = _MenuModel;

  factory MenuModel.fromJson(Map<String, dynamic> json) =>
      _$MenuModelFromJson(json);
}

@freezed
abstract class Restaurant with _$Restaurant {
  const factory Restaurant({String? id, String? name, String? tableId}) =
      _Restaurant;

  factory Restaurant.fromJson(Map<String, dynamic> json) =>
      _$RestaurantFromJson(json);
}

@freezed
abstract class Item with _$Item {
  const factory Item({
    int? id,
    String? name,
    String? description,
    double? price,
    int? categoryId,
    String? imageUrl,
    List<CustomizationGroup>? customizationGroups,
  }) = _Item;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}

@freezed
abstract class CustomizationGroup with _$CustomizationGroup {
  const factory CustomizationGroup({
    int? id,
    String? name,
    bool? required,
    int? maxSelections,
    List<Option>? options,
  }) = _CustomizationGroup;

  factory CustomizationGroup.fromJson(Map<String, dynamic> json) =>
      _$CustomizationGroupFromJson(json);
}

@freezed
abstract class Option with _$Option {
  const factory Option({int? id, String? name, double? priceModifier}) =
      _Option;

  factory Option.fromJson(Map<String, dynamic> json) => _$OptionFromJson(json);
}
