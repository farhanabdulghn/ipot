import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_model.freezed.dart';
part 'item_model.g.dart';

@freezed
abstract class ItemModel with _$ItemModel {
  const factory ItemModel({
    int? id,
    String? name,
    String? description,
    double? price,
    int? categoryId,
    String? imageUrl,
    List<CustomizationGroup>? customizationGroups,
    int? qty,
  }) = _ItemModel;

  factory ItemModel.fromJson(Map<String, dynamic> json) =>
      _$ItemModelFromJson(json);
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
