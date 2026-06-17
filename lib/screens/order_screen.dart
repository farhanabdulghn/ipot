import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ipot/components/cards/label_avatar.dart';
import 'package:ipot/components/loadings/container_shimmer_load.dart';
import 'package:ipot/extensions/extensions.dart';
import 'package:ipot/l10n/app_localizations.dart';
import 'package:ipot/sections/feedback_section.dart';
import 'package:ipot/state/actions/order/order_state.dart';
import 'package:ipot/state/stores/page_handle/page_handle_notifier.dart';
import 'package:ipot/utils/enums.dart';
import 'package:ipot/utils/functions.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';
import 'package:pusher_client_socket/pusher_client_socket.dart';

class OrderScreen extends ConsumerStatefulWidget {
  const OrderScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OrderScreenState();
}

class _OrderScreenState extends ConsumerState<OrderScreen>
    with TickerProviderStateMixin {
  late AnimationController _stepChangeController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;
  int? _lastStep;

  PusherClient? _pusher;
  Channel? _channel;
  int? _subscribedOrderId;
  bool _pusherInitialized = false;

  void _initPusher(int orderId) {
    if (_pusherInitialized && _subscribedOrderId == orderId) return;

    _disposePusher();

    try {
      _pusher = PusherClient(
        options: PusherOptions(
          key: 'fd8b37673605980ec900',
          cluster: 'ap1',
          authOptions: PusherAuthOptions(''),
        ),
      );

      _channel = _pusher!.subscribe('orders.$orderId');

      _channel!.bind('order.status.updated', (event) {
        if (mounted) ref.invalidate(getOrderStatusProvider);
      });

      _pusher!.connect();

      _subscribedOrderId = orderId;
      _pusherInitialized = true;
    } catch (e) {
      Functions.errorPrint('Pusher init error: $e');
    }
  }

  void _disposePusher() {
    try {
      if (_channel != null && _subscribedOrderId != null) {
        _pusher?.unsubscribe('orders.$_subscribedOrderId');
      }
      _pusher?.disconnect();
    } catch (e) {
      Functions.errorPrint('Pusher dispose error: $e');
    } finally {
      _channel = null;
      _pusher = null;
      _subscribedOrderId = null;
      _pusherInitialized = false;
    }
  }

  Step _buildStep({
    required AppLocalizations l10n,
    required OrderStatus status,
    required int currentStep,
    required AnimationController controller,
  }) {
    final props = status.toProps;

    final isCompleted = currentStep > status.index;
    final isCurrent = currentStep == status.index;
    final isPending = currentStep < status.index;

    final activeColor = isCompleted
        ? props.color ?? Colors.green
        : isCurrent
        ? Colors.blue
        : Colors.grey;

    Widget stepIcon = PhosphorIcon(
      props.duotoneIcon!,
      size: 34,
      color: activeColor,
    );

    if (isCurrent) {
      stepIcon = AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return Transform.scale(scale: _scaleAnimation.value, child: child);
        },
        child: stepIcon,
      );
    }

    return Step(
      content: SizedBox(),
      stepStyle: StepStyle(color: activeColor),
      isActive: !isPending,
      state: isCompleted
          ? StepState.complete
          : isCurrent
          ? StepState.editing
          : StepState.indexed,
      title: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return Opacity(
            opacity: isCurrent
                ? _fadeAnimation.value
                : isCompleted
                ? 1.0
                : 1.0,
            child: child,
          );
        },
        child: Row(
          children: [
            stepIcon,
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 2,
                children: [
                  TweenAnimationBuilder<Color?>(
                    tween: ColorTween(
                      begin: isCurrent ? Colors.grey : activeColor,
                      end: activeColor,
                    ),
                    duration: Duration(milliseconds: 600),
                    builder: (context, color, _) {
                      return Text(
                        props.title(l10n),
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: color,
                        ),
                      );
                    },
                  ),
                  Text(
                    props.subtitle!(l10n),
                    style: TextStyle(
                      fontSize: 12,
                      color: isPending
                          ? Colors.grey.shade500
                          : Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _stepChangeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _scaleAnimation = Tween<double>(begin: 0.85, end: 1.0).animate(
      CurvedAnimation(parent: _stepChangeController, curve: Curves.elasticOut),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _stepChangeController, curve: Curves.easeIn),
    );
  }

  @override
  void dispose() {
    _stepChangeController.dispose();
    _disposePusher();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final pageHandle = ref.watch(pageHandleProvider);
    final orderId = pageHandle.orderId;
    final menuNavigationHeight = pageHandle.menuNavigationHeight;

    Widget body;

    if (orderId == null) {
      body = FeedbackSection.empty(
        title: l10n.orderNoActiveTitle,
        subtitle: l10n.orderNoActiveSubtitle,
        icon: PhosphorIconsRegular.receipt,
      );
    } else {
      final provider = getOrderStatusProvider(orderId);
      final state = ref.watch(provider);

      body = state.when(
        data: (data) {
          _initPusher(orderId);

          final status = data.status ?? OrderStatus.pending;
          final currentStep = status.index;
          if (_lastStep != currentStep) {
            _lastStep = currentStep;
            _stepChangeController.forward(from: 0.0);
          }
          final totalItems =
              data.items?.fold<int>(
                0,
                (total, item) => total + (item.quantity ?? 0),
              ) ??
              0;

          return Column(
            children: [
              Card(
                margin: EdgeInsets.zero,
                shape: RoundedRectangleBorder(),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: data.estimatedTime != null
                        ? MainAxisAlignment.spaceBetween
                        : MainAxisAlignment.center,
                    children: [
                      if (data.estimatedTime != null)
                        Column(
                          spacing: 12,
                          children: [
                            Text(
                              l10n.estimatedTime.toUpperCase(),
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey.shade500,
                              ),
                            ),
                            Text(
                              l10n.estimatedTimeMinutes(data.estimatedTime!),
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      Column(
                        spacing: 12,
                        children: [
                          Text(
                            l10n.orderNumber.toUpperCase(),
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey.shade500,
                            ),
                          ),
                          Text(
                            '#${data.orderId}',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: RefreshIndicator.adaptive(
                  onRefresh: () async => await ref.refresh(provider),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 400),
                          switchInCurve: Curves.easeOutCubic,
                          switchOutCurve: Curves.easeInCubic,
                          transitionBuilder: (child, animation) {
                            return FadeTransition(
                              opacity: animation,
                              child: SlideTransition(
                                position: Tween<Offset>(
                                  begin: const Offset(0, 0.05),
                                  end: Offset.zero,
                                ).animate(animation),
                                child: child,
                              ),
                            );
                          },
                          child: Stepper(
                            key: ValueKey(currentStep),
                            physics: const NeverScrollableScrollPhysics(),
                            currentStep: currentStep,
                            controlsBuilder: (_, _) => const SizedBox(),
                            steps: OrderStatus.values
                                .map(
                                  (status) => _buildStep(
                                    l10n: l10n,
                                    status: status,
                                    currentStep: currentStep,
                                    controller: _stepChangeController,
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                        Card(
                          margin: EdgeInsets.symmetric(horizontal: 24),
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      l10n.yourOrders,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 6,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.black.withValues(
                                          alpha: .05,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          100,
                                        ),
                                      ),
                                      child: Text(
                                        l10n.totalItems(totalItems),
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(color: Colors.black12),
                                Column(
                                  spacing: 8,
                                  children: List.generate(
                                    data.items?.length ?? 0,
                                    (index) {
                                      {
                                        final item = data.items?[index];

                                        final customizations =
                                            item?.customizations
                                                ?.map((e) => e.name)
                                                .whereType<String>()
                                                .join(', ') ??
                                            '';

                                        final customizationPrice =
                                            item?.customizations?.fold<double>(
                                              0,
                                              (total, item) =>
                                                  total +
                                                  ((item.priceModifier ?? 0) *
                                                      (item.quantity ?? 1)),
                                            ) ??
                                            0;

                                        final totalPrice =
                                            ((item?.unitPrice ?? 0) +
                                            customizationPrice);

                                        return Row(
                                          spacing: 20,
                                          children: [
                                            LabelAvatar(url: item?.imageUrl),
                                            Expanded(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                spacing: 20,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    spacing: 14,
                                                    children: [
                                                      Text(
                                                        item?.name ?? '',
                                                        style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                      if (customizations
                                                          .isNotEmpty)
                                                        Text(
                                                          customizations,
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            color: Colors
                                                                .grey
                                                                .shade600,
                                                            fontStyle: FontStyle
                                                                .italic,
                                                          ),
                                                        ),
                                                      Text(
                                                        l10n.price(
                                                          totalPrice
                                                              .toStringAsFixed(
                                                                2,
                                                              ),
                                                        ),
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Colors
                                                              .green
                                                              .shade700,
                                                        ),
                                                      ),
                                                      Divider(
                                                        color: Colors.black12,
                                                      ),
                                                    ],
                                                  ),
                                                  Text(
                                                    l10n.itemQty(
                                                      item?.quantity ?? 0,
                                                    ),
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: menuNavigationHeight + 30),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
        error: (_, _) => FeedbackSection.error(
          title: l10n.orderFailedTitle,
          subtitle: l10n.orderFailedSubtitle,
          icon: PhosphorIconsRegular.warningCircle,
          onTap: () => ref.invalidate(provider),
        ),
        loading: () => SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Card(
                margin: EdgeInsets.zero,
                shape: RoundedRectangleBorder(),
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          ContainerShimmerLoad(width: 110, height: 12),
                          SizedBox(height: 12),
                          ContainerShimmerLoad(width: 80, height: 18),
                        ],
                      ),
                      Column(
                        children: [
                          ContainerShimmerLoad(width: 110, height: 12),
                          SizedBox(height: 12),
                          ContainerShimmerLoad(width: 70, height: 18),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                child: Column(
                  children: List.generate(OrderStatus.values.length, (index) {
                    final isLast = index == OrderStatus.values.length - 1;

                    return IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              ContainerShimmerLoad(
                                width: 34,
                                height: 34,
                                radius: 100,
                              ),
                              if (!isLast)
                                Expanded(
                                  child: Container(
                                    width: 2,
                                    margin: EdgeInsets.symmetric(vertical: 8),
                                    child: ContainerShimmerLoad(radius: 100),
                                  ),
                                ),
                            ],
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 28),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  ContainerShimmerLoad(width: 160, height: 16),
                                  SizedBox(height: 10),
                                  ContainerShimmerLoad(
                                    width: double.infinity,
                                    height: 12,
                                  ),
                                  SizedBox(height: 6),
                                  ContainerShimmerLoad(width: 180, height: 12),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
              Card(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          ContainerShimmerLoad(width: 70, height: 14),
                          ContainerShimmerLoad(width: 110, height: 14),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Divider(color: Colors.black12),
                      const SizedBox(height: 12),
                      Column(
                        children: List.generate(3, (index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const ContainerShimmerLoad(
                                  width: 56,
                                  height: 56,
                                  radius: 14,
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      ContainerShimmerLoad(
                                        width: 140,
                                        height: 16,
                                      ),
                                      SizedBox(height: 12),
                                      ContainerShimmerLoad(
                                        width: 220,
                                        height: 12,
                                      ),
                                      SizedBox(height: 12),
                                      ContainerShimmerLoad(
                                        width: 90,
                                        height: 14,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 12),
                                const ContainerShimmerLoad(
                                  width: 30,
                                  height: 16,
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: menuNavigationHeight + 30),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text(l10n.orderStatusTitle)),
      body: body,
    );
  }
}
