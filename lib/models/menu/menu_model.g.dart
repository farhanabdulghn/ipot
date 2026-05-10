// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MenuModel _$MenuModelFromJson(Map<String, dynamic> json) => _MenuModel(
  restaurant: json['restaurant'] == null
      ? null
      : Restaurant.fromJson(json['restaurant'] as Map<String, dynamic>),
  categories: (json['categories'] as List<dynamic>?)
      ?.map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  items: (json['items'] as List<dynamic>?)
      ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$MenuModelToJson(_MenuModel instance) =>
    <String, dynamic>{
      'restaurant': instance.restaurant,
      'categories': instance.categories,
      'items': instance.items,
    };

_Restaurant _$RestaurantFromJson(Map<String, dynamic> json) => _Restaurant(
  id: json['id'] as String?,
  name: json['name'] as String?,
  tableId: json['tableId'] as String?,
);

Map<String, dynamic> _$RestaurantToJson(_Restaurant instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'tableId': instance.tableId,
    };

_Item _$ItemFromJson(Map<String, dynamic> json) => _Item(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  description: json['description'] as String?,
  price: (json['price'] as num?)?.toDouble(),
  categoryId: (json['categoryId'] as num?)?.toInt(),
  imageUrl: json['imageUrl'] as String?,
  customizationGroups: (json['customizationGroups'] as List<dynamic>?)
      ?.map((e) => CustomizationGroup.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ItemToJson(_Item instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'price': instance.price,
  'categoryId': instance.categoryId,
  'imageUrl': instance.imageUrl,
  'customizationGroups': instance.customizationGroups,
};

_CustomizationGroup _$CustomizationGroupFromJson(Map<String, dynamic> json) =>
    _CustomizationGroup(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      required: json['required'] as bool?,
      maxSelections: (json['maxSelections'] as num?)?.toInt(),
      options: (json['options'] as List<dynamic>?)
          ?.map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CustomizationGroupToJson(_CustomizationGroup instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'required': instance.required,
      'maxSelections': instance.maxSelections,
      'options': instance.options,
    };

_Option _$OptionFromJson(Map<String, dynamic> json) => _Option(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  priceModifier: (json['priceModifier'] as num?)?.toDouble(),
);

Map<String, dynamic> _$OptionToJson(_Option instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'priceModifier': instance.priceModifier,
};
