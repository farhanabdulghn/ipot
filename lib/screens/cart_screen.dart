import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ipot/api/repositories/order_repository.dart';
import 'package:ipot/components/buttons/qty_counter.dart';
import 'package:ipot/components/cards/label_avatar.dart';
import 'package:ipot/components/cards/menu_item_card.dart';
import 'package:ipot/components/loadings/loading.dart';
import 'package:ipot/extensions/extensions.dart';
import 'package:ipot/l10n/app_localizations.dart';
import 'package:ipot/models/item/item_model.dart';
import 'package:ipot/sections/dialog_question_section.dart';
import 'package:ipot/sections/modal_note_section.dart';
import 'package:ipot/state/stores/cart/cart_notifier.dart';
import 'package:ipot/state/stores/page_handle/page_handle_notifier.dart';
import 'package:ipot/utils/functions.dart';
import 'package:ipot/utils/styles.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  void _editNote() async {
    final customerNote = ref.read(cartProvider.select((s) => s.customerNote));
    final note = await showModalBottomSheet<String?>(
      context: context,
      backgroundColor: Colors.white,
      builder: (context) => ModalNoteSection(note: customerNote),
    );

    if (note != null) {
      ref.read(cartProvider.notifier).setCustomerNote(note);
    }
  }

  void _checkout() async {
    final l10n = AppLocalizations.of(context)!;
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => DialogQuestionSection(
        content: l10n.checkoutConfirmContent,
        confirmTitle: l10n.checkout,
      ),
    );

    if (confirm == true) {
      if (mounted) Loading(context).start();
      final cart = ref.read(cartProvider);

      try {
        final response = await OrderRepository().submitOrder(cart);

        if (response != null) {
          ref.read(pageHandleProvider.notifier).setOrderId(response);
          ref.read(cartProvider.notifier).clearCart();
        }
      } catch (e) {
        Functions.errorPrint('$e');
        if (mounted) context.showSnackBar(l10n.checkoutFailed);
      } finally {
        if (mounted) Loading(context).stop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final state = ref.watch(cartProvider);
    final items = state.items;
    final menuNavigationHeight = ref.watch(
      pageHandleProvider.select((s) => s.menuNavigationHeight),
    );
    final totalPrice = state.items.fold<double>(
      0,
      (total, item) => total + ((item.price ?? 0) * (item.qty ?? 1)),
    );
    final hasCart = totalPrice > 0;
    final customerNote = state.customerNote;

    final bottom = menuNavigationHeight;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          l10n.cartTableTitle(
            int.tryParse(state.tableId?.replaceFirst('T', '') ?? '') ?? 0,
          ),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24).copyWith(top: 14),
            child: Column(
              children: [
                if (hasCart)
                  GestureDetector(
                    onTap: _editNote,
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        spacing: 18,
                        children: [
                          Text(
                            l10n.customerNote,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey.shade700,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              customerNote.hasValue
                                  ? customerNote!
                                  : l10n.customerNotePlaceholder,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.only(top: 24, bottom: bottom + 40),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index];
                      final Iterable<Option>? options = item.customizationGroups
                          ?.expand((group) => group.options ?? <Option>[]);

                      final subtitleText = options
                          ?.map((option) => option.name)
                          .whereType<String>()
                          .join(', ');

                      return MenuItemCard(
                        leading: LabelAvatar(url: item.imageUrl),
                        title: Text(
                          item.name ?? '',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                        subtitle: subtitleText.hasNoValue
                            ? null
                            : Text(
                                subtitleText!,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey.shade600,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                        bottom: Text(
                          l10n.price(item.price?.toString() ?? '0'),
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            color: Colors.green.shade700,
                          ),
                        ),
                        trailing: QtyCounter(
                          value: item.qty ?? 1,
                          onChanged: (value) {
                            ref
                                .read(cartProvider.notifier)
                                .updateQty(itemId: item.id, qty: value);
                          },
                          onMinReached: () async {
                            final delete = await showDialog<bool>(
                              context: context,
                              builder: (context) => DialogQuestionSection(
                                content: l10n.removeItemContent,
                                confirmTitle: l10n.delete,
                              ),
                            );

                            if (delete == true) {
                              ref
                                  .read(cartProvider.notifier)
                                  .removeFromCart(item);
                            }
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          if (hasCart)
            Positioned(
              left: 0,
              right: 0,
              bottom: bottom,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: Styles.containerShadow,
                ),
                child: Row(
                  spacing: 16,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      spacing: 6,
                      children: [
                        Text(
                          l10n.cartTotal,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade700,
                          ),
                        ),
                        Text(
                          l10n.price(totalPrice.toStringAsFixed(2)),
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            color: Colors.green.shade700,
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      key: const Key('checkout_button'),
                      onPressed: _checkout,
                      child: Text(l10n.checkout),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
