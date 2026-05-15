// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ItemModel _$ItemModelFromJson(Map<String, dynamic> json) => _ItemModel(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  description: json['description'] as String?,
  price: (json['price'] as num?)?.toDouble(),
  categoryId: (json['categoryId'] as num?)?.toInt(),
  imageUrl: json['imageUrl'] as String?,
  customizationGroups: (json['customizationGroups'] as List<dynamic>?)
      ?.map((e) => CustomizationGroup.fromJson(e as Map<String, dynamic>))
      .toList(),
  qty: (json['qty'] as num?)?.toInt(),
);

Map<String, dynamic> _$ItemModelToJson(_ItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'categoryId': instance.categoryId,
      'imageUrl': instance.imageUrl,
      'customizationGroups': instance.customizationGroups,
      'qty': instance.qty,
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
