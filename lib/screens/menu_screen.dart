import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ipot/components/cards/label_avatar.dart';
import 'package:ipot/components/cards/menu_item_card.dart';
import 'package:ipot/components/loadings/container_shimmer_load.dart';
import 'package:ipot/extensions/extensions.dart';
import 'package:ipot/l10n/app_localizations.dart';
import 'package:ipot/sections/feedback_section.dart';
import 'package:ipot/sections/modal_detail_menu_section.dart';
import 'package:ipot/state/actions/menu/menu_state.dart';
import 'package:ipot/state/stores/page_handle/page_handle_notifier.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';

class MenuScreen extends ConsumerWidget {
  final String tableId;
  const MenuScreen({super.key, required this.tableId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final menuNavigationHeight = ref.watch(
      pageHandleProvider.select((s) => s.menuNavigationHeight),
    );
    final provider = getMenuByTableIdProvider(tableId);
    final state = ref.watch(provider);

    final padding = EdgeInsets.symmetric(
      horizontal: 20,
    ).copyWith(top: 16, bottom: menuNavigationHeight + 16);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          state.maybeWhen(
            data: (data) => data?.restaurant?.name ?? '',
            orElse: () => '',
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(0.5),
          child: Divider(height: 0.5, color: Colors.grey.shade200),
        ),
      ),
      body: state.when(
        skipLoadingOnRefresh: false,
        data: (data) {
          final items = data?.items;

          if (items.hasNoValue) {
            return FeedbackSection.empty(icon: PhosphorIconsRegular.forkKnife);
          }

          return RefreshIndicator.adaptive(
            onRefresh: () async => await ref.refresh(provider.future),
            child: ListView.separated(
              padding: padding,
              physics: AlwaysScrollableScrollPhysics(),
              itemCount: items!.length,
              separatorBuilder: (_, _) => Divider(color: Colors.grey.shade100),
              itemBuilder: (context, index) {
                final item = items[index];

                return InkWell(
                  onTap: () => showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.white,
                    isScrollControlled: true,
                    useSafeArea: true,
                    builder: (_) => ModalDetailMenuSection(item: item),
                  ),
                  borderRadius: BorderRadius.circular(8),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: MenuItemCard(
                      leading: LabelAvatar(url: item.imageUrl),
                      title: Text(
                        item.name ?? '',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: Colors.black87,
                        ),
                      ),
                      subtitle: item.description?.isNotEmpty == true
                          ? Text(
                              item.description!,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey.shade500,
                                height: 1.4,
                              ),
                            )
                          : null,
                      bottom: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green.shade50,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Text(
                          l10n.price(item.price?.toString() ?? '0'),
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Colors.green.shade700,
                          ),
                        ),
                      ),
                      trailing: Icon(
                        PhosphorIconsRegular.caretRight,
                        color: Colors.grey.shade400,
                        size: 20,
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
        error: (_, _) => FeedbackSection.error(
          onTap: () => ref.invalidate(provider, asReload: true),
        ),
        loading: () => ListView.separated(
          padding: padding,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 6,
          separatorBuilder: (_, _) => Divider(color: Colors.grey.shade100),
          itemBuilder: (_, _) => Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: MenuItemCard(
              leading: LabelAvatar.loading(),
              title: ContainerShimmerLoad(width: 120, height: 14),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 6,
                children: [
                  ContainerShimmerLoad(width: double.infinity, height: 11),
                  ContainerShimmerLoad(width: 160, height: 11),
                ],
              ),
              bottom: ContainerShimmerLoad(width: 60, height: 22),
            ),
          ),
        ),
      ),
    );
  }
}
