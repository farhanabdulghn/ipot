import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ipot/models/category/category_model.dart';
import 'package:ipot/models/item/item_model.dart';

part 'menu_model.freezed.dart';
part 'menu_model.g.dart';

@freezed
abstract class MenuModel with _$MenuModel {
  const factory MenuModel({
    Restaurant? restaurant,
    List<CategoryModel>? categories,
    List<ItemModel>? items,
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
