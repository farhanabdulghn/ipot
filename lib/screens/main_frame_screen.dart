import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ipot/screens/cart_screen.dart';
import 'package:ipot/screens/menu_screen.dart';
import 'package:ipot/screens/order_screen.dart';
import 'package:ipot/sections/menu_navigation_section.dart';
import 'package:ipot/state/stores/locale/locale_notifier.dart';
import 'package:ipot/state/stores/page_handle/page_handle_notifier.dart';

class MainFrameScreen extends ConsumerStatefulWidget {
  final String tableId;
  const MainFrameScreen({super.key, required this.tableId});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MainFrameScreenState();
}

class _MainFrameScreenState extends ConsumerState<MainFrameScreen> {
  final _pageController = PageController(initialPage: 0, keepPage: true);

  List<Widget> get _pages => [
    MenuScreen(tableId: widget.tableId),
    const OrderScreen(),
    const CartScreen(),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final locale = ref.watch(localeProvider);
    final state = ref.watch(pageHandleProvider);

    ref.listen(pageHandleProvider.select((s) => s.page), (_, next) {
      if (_pageController.hasClients && _pageController.page?.round() != next) {
        ref.read(pageHandleProvider.notifier).setShortcut(true);
        _pageController.animateToPage(
          next,
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
        );
      }
    });

    return Localizations.override(
      context: context,
      locale: locale,
      child: Builder(
        builder: (ctx) => PopScope(
          canPop: state.page == 0,
          onPopInvokedWithResult: (didPop, _) {
            if (!didPop && state.page != 0) {
              ref.read(pageHandleProvider.notifier).setPage(0);
            }
          },
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Stack(
              children: [
                SizedBox.expand(
                  child: PageView.builder(
                    controller: _pageController,
                    physics: const ClampingScrollPhysics(),
                    itemCount: _pages.length,
                    onPageChanged: (page) {
                      if (!state.shortcut && page != state.page) {
                        ref.read(pageHandleProvider.notifier).setPage(page);
                      } else {
                        Future.delayed(
                          const Duration(milliseconds: 450),
                          () => ref
                              .read(pageHandleProvider.notifier)
                              .setShortcut(false),
                        );
                      }
                    },
                    itemBuilder: (_, index) => _pages[index],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: MenuNavigationSection(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
