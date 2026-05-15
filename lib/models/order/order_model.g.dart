// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => _OrderModel(
  orderId: (json['orderId'] as num?)?.toInt(),
  tableId: json['tableId'] as String?,
  status: $enumDecodeNullable(_$OrderStatusEnumMap, json['status']),
  customerNote: json['customerNote'] as String?,
  estimatedTime: (json['estimatedTime'] as num?)?.toInt(),
  items: (json['items'] as List<dynamic>?)
      ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
      .toList(),
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$OrderModelToJson(_OrderModel instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'tableId': instance.tableId,
      'status': _$OrderStatusEnumMap[instance.status],
      'customerNote': instance.customerNote,
      'estimatedTime': instance.estimatedTime,
      'items': instance.items,
      'createdAt': instance.createdAt?.toIso8601String(),
    };

const _$OrderStatusEnumMap = {
  OrderStatus.pending: 'pending',
  OrderStatus.confirmed: 'confirmed',
  OrderStatus.preparing: 'preparing',
  OrderStatus.ready: 'ready',
  OrderStatus.served: 'served',
};

_Item _$ItemFromJson(Map<String, dynamic> json) => _Item(
  menuItemId: (json['menuItemId'] as num?)?.toInt(),
  name: json['name'] as String?,
  imageUrl: json['imageUrl'] as String?,
  quantity: (json['quantity'] as num?)?.toInt(),
  unitPrice: (json['unitPrice'] as num?)?.toDouble(),
  customizations: (json['customizations'] as List<dynamic>?)
      ?.map((e) => Customization.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ItemToJson(_Item instance) => <String, dynamic>{
  'menuItemId': instance.menuItemId,
  'name': instance.name,
  'imageUrl': instance.imageUrl,
  'quantity': instance.quantity,
  'unitPrice': instance.unitPrice,
  'customizations': instance.customizations,
};

_Customization _$CustomizationFromJson(Map<String, dynamic> json) =>
    _Customization(
      optionId: (json['optionId'] as num?)?.toInt(),
      name: json['name'] as String?,
      priceModifier: (json['priceModifier'] as num?)?.toDouble(),
      quantity: (json['quantity'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CustomizationToJson(_Customization instance) =>
    <String, dynamic>{
      'optionId': instance.optionId,
      'name': instance.name,
      'priceModifier': instance.priceModifier,
      'quantity': instance.quantity,
    };
