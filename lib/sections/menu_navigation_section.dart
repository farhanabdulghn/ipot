import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ipot/components/cards/notif_counting.dart';
import 'package:ipot/l10n/app_localizations.dart';
import 'package:ipot/models/component_props/component_props_model.dart';
import 'package:ipot/state/stores/cart/cart_notifier.dart';
import 'package:ipot/state/stores/page_handle/page_handle_notifier.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

final _items = [
  ComponentPropsModel(title: (l) => l.navMenu, icon: PhosphorIcons.forkKnife),
  ComponentPropsModel(title: (l) => l.navOrder, icon: PhosphorIcons.receipt),
  ComponentPropsModel(title: (l) => l.navCart, icon: PhosphorIcons.basket),
];

class MenuNavigationSection extends ConsumerStatefulWidget {
  const MenuNavigationSection({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MenuNavigationSectionState();
}

class _MenuNavigationSectionState extends ConsumerState<MenuNavigationSection> {
  final _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final provider = pageHandleProvider;
    final page = ref.watch(provider.select((s) => s.page));
    final cartItems = ref.watch(cartProvider.select((s) => s.items));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final ctx = _key.currentContext;
      if (ctx?.size != null) {
        ref.read(provider.notifier).setMenuNavigationHeight(ctx!.size!.height);
      }
    });

    return Container(
      key: _key,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey.shade100)),
      ),
      child: SafeArea(
        top: false,
        minimum: EdgeInsets.symmetric(horizontal: 8).copyWith(bottom: 4),
        child: Row(
          children: List.generate(_items.length, (index) {
            final item = _items[index];
            final selected = page == index;

            final color = selected ? Colors.black87 : Colors.grey.shade400;

            Widget iconWidget = Padding(
              padding: EdgeInsets.all(4),
              child: PhosphorIcon(
                item.icon(
                  selected
                      ? PhosphorIconsStyle.fill
                      : PhosphorIconsStyle.regular,
                ),
                color: color,
                size: 24,
              ),
            );

            if (index == 2 && cartItems.isNotEmpty) {
              iconWidget = Stack(
                children: [
                  iconWidget,
                  Positioned(
                    top: 0,
                    right: 0,
                    child: NotifCounting(count: cartItems.length),
                  ),
                ],
              );
            }

            return Expanded(
              child: TextButton(
                onPressed: () => ref.read(provider.notifier).setPage(index),
                style: TextButton.styleFrom(
                  overlayColor: Colors.transparent,
                  shape: RoundedRectangleBorder(),
                  padding: EdgeInsets.symmetric(vertical: 8),
                ),
                child: AnimatedDefaultTextStyle(
                  duration: Duration(milliseconds: 200),
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                    color: color,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AnimatedScale(
                        scale: selected ? 1.1 : 1.0,
                        duration: Duration(milliseconds: 200),
                        curve: Curves.easeOutBack,
                        child: iconWidget,
                      ),
                      SizedBox(height: 2),
                      Text(item.title(l10n)),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
