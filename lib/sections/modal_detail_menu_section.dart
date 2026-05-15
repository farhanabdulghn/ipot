import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ipot/components/buttons/app_checkbox.dart';
import 'package:ipot/components/buttons/qty_counter.dart';
import 'package:ipot/components/cards/label_avatar.dart';
import 'package:ipot/l10n/app_localizations.dart';
import 'package:ipot/models/item/item_model.dart';
import 'package:ipot/state/stores/cart/cart_notifier.dart';

class ModalDetailMenuSection extends StatefulWidget {
  final ItemModel? item;
  const ModalDetailMenuSection({super.key, required this.item});

  @override
  State<ModalDetailMenuSection> createState() => _ModalDetailMenuSectionState();
}

class _ModalDetailMenuSectionState extends State<ModalDetailMenuSection> {
  int _qty = 1;
  final Map<int, Set<int>> _selectedOptions = {};

  double get _totalPrice {
    final basePrice = widget.item?.price ?? 0;
    double optionsPrice = 0;
    for (final group in widget.item?.customizationGroups ?? []) {
      final selectedIds = _selectedOptions[group.id] ?? {};
      for (final option in group.options ?? []) {
        if (selectedIds.contains(option.id)) {
          optionsPrice += option.priceModifier ?? 0;
        }
      }
    }
    return (basePrice + optionsPrice) * _qty;
  }

  bool get _canAddToCart {
    for (final group in widget.item?.customizationGroups ?? []) {
      if (!(group.required ?? false)) continue;
      final selected = _selectedOptions[group.id];
      if (selected == null || selected.isEmpty) return false;
    }
    return true;
  }

  void _toggleOption({
    required int groupId,
    required int optionId,
    required bool value,
    required int maxSelections,
  }) {
    setState(() {
      final selected = _selectedOptions[groupId] ?? <int>{};
      if (value) {
        if (maxSelections == 1) {
          selected
            ..clear()
            ..add(optionId);
        } else {
          if (selected.length >= maxSelections) return;
          selected.add(optionId);
        }
      } else {
        selected.remove(optionId);
      }
      _selectedOptions[groupId] = selected;
    });
  }

  ItemModel _cartItem() {
    final groups = widget.item?.customizationGroups ?? [];
    final selectedGroups = groups.map((group) {
      final selectedIds = _selectedOptions[group.id] ?? {};
      final selectedOptions = (group.options ?? [])
          .where((o) => selectedIds.contains(o.id))
          .toList();
      return group.copyWith(options: selectedOptions);
    }).toList();
    return widget.item!.copyWith(
      qty: _qty,
      customizationGroups: selectedGroups,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final item = widget.item;
    final groups = item?.customizationGroups ?? [];

    return SafeArea(
      bottom: true,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 12, bottom: 8),
            child: Container(
              width: 36,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 8, 20, 16),
            child: Row(
              spacing: 14,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LabelAvatar(url: item?.imageUrl, size: 80, radius: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 6,
                    children: [
                      Text(
                        item?.name ?? '',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.black87,
                        ),
                      ),
                      if ((item?.description ?? '').isNotEmpty)
                        Text(
                          item!.description!,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade500,
                            height: 1.4,
                          ),
                        ),
                      SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          QtyCounter(
                            value: _qty,
                            onChanged: (v) => setState(() => _qty = v),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.green.shade50,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Text(
                              '${item?.price}\$',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                color: Colors.green.shade700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          if (groups.isNotEmpty)
            Divider(color: Colors.grey.shade100, height: 1),
          if (groups.isNotEmpty)
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.38,
              ),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: groups.length,
                itemBuilder: (context, gi) {
                  final group = groups[gi];
                  final options = group.options ?? [];
                  final maxSel = group.maxSelections ?? 1;
                  final isRequired = group.required ?? false;

                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 16, 20, 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              group.name ?? '',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.black87,
                              ),
                            ),
                            Row(
                              spacing: 6,
                              children: [
                                Text(
                                  l10n.chooseUpTo(maxSel),
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.grey.shade500,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 3,
                                  ),
                                  decoration: BoxDecoration(
                                    color: isRequired
                                        ? Colors.black87
                                        : Colors.grey.shade100,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Text(
                                    isRequired ? l10n.required : l10n.optional,
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                      color: isRequired
                                          ? Colors.white
                                          : Colors.grey.shade600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      ...List.generate(options.length, (oi) {
                        final option = options[oi];
                        final isSelected =
                            _selectedOptions[group.id]?.contains(option.id) ??
                            false;
                        final isLast = oi == options.length - 1;

                        return InkWell(
                          onTap: () => _toggleOption(
                            groupId: group.id ?? 0,
                            optionId: option.id ?? 0,
                            value: !isSelected,
                            maxSelections: maxSel,
                          ),
                          overlayColor: WidgetStatePropertyAll(
                            Colors.transparent,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 12),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          spacing: 2,
                                          children: [
                                            Text(
                                              option.name ?? '',
                                              style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black87,
                                              ),
                                            ),
                                            if ((option.priceModifier ?? 0) > 0)
                                              Text(
                                                '+${option.priceModifier}\$',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.green.shade600,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                      AppCheckbox(
                                        value: isSelected,
                                        isRadio: maxSel == 1,
                                        onChanged: (v) => _toggleOption(
                                          groupId: group.id ?? 0,
                                          optionId: option.id ?? 0,
                                          value: v,
                                          maxSelections: maxSel,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                if (!isLast)
                                  Divider(
                                    color: Colors.grey.shade100,
                                    height: 1,
                                  ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ],
                  );
                },
              ),
            ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 16, 20, 8),
            child: Consumer(
              builder: (context, ref, _) => SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _canAddToCart
                      ? () {
                          ref
                              .read(cartProvider.notifier)
                              .addToCart(_cartItem());
                          Navigator.pop(context);
                        }
                      : null,
                  child: Text(l10n.addToCart(_totalPrice.toStringAsFixed(2))),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
