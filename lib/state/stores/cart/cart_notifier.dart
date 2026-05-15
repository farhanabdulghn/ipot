import 'package:collection/collection.dart';

import 'package:ipot/models/cart/cart_model.dart';

import 'package:ipot/models/item/item_model.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_notifier.g.dart';

@riverpod
class CartNotifier extends _$CartNotifier {
  bool _isSameCartItem(ItemModel a, ItemModel b) {
    if (a.id != b.id) return false;
    final aGroups = a.customizationGroups ?? [];

    final bGroups = b.customizationGroups ?? [];

    if (aGroups.length != bGroups.length) return false;

    final groupEquals = const DeepCollectionEquality.unordered().equals;

    final aMap = aGroups.map((group) {
      return {
        'groupId': group.id,

        'options': (group.options ?? []).map((e) => e.id).toList()..sort(),
      };
    }).toList();

    final bMap = bGroups.map((group) {
      return {
        'groupId': group.id,

        'options': (group.options ?? []).map((e) => e.id).toList()..sort(),
      };
    }).toList();

    return groupEquals(aMap, bMap);
  }

  @override
  CartModel build() {
    ref.keepAlive();

    return const CartModel();
  }

  void setTableId(String? tableId) {
    state = state.copyWith(tableId: tableId);
  }

  void setCustomerNote(String? note) {
    state = state.copyWith(customerNote: note);
  }

  void addToCart(ItemModel newItem) {
    final items = [...state.items];

    final index = items.indexWhere((item) => _isSameCartItem(item, newItem));

    if (index != -1) {
      final currentItem = items[index];

      items[index] = currentItem.copyWith(
        qty: (currentItem.qty ?? 0) + (newItem.qty ?? 0),
      );

      state = state.copyWith(items: items);

      return;
    }

    state = state.copyWith(items: [...items, newItem]);
  }

  void updateQty({required int? itemId, required int qty}) {
    final items = state.items.map((item) {
      if (item.id == itemId) {
        return item.copyWith(qty: qty);
      }

      return item;
    }).toList();

    state = state.copyWith(items: items);
  }

  void removeFromCart(ItemModel item) {
    final items = state.items.where((e) => !_isSameCartItem(e, item)).toList();

    state = state.copyWith(items: items);
  }

  void clearCart() {
    state = state.copyWith(items: [], customerNote: null);
  }
}
