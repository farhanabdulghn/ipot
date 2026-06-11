// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CartNotifier)
final cartProvider = CartNotifierProvider._();

final class CartNotifierProvider
    extends $NotifierProvider<CartNotifier, CartModel> {
  CartNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cartProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cartNotifierHash();

  @$internal
  @override
  CartNotifier create() => CartNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CartModel value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CartModel>(value),
    );
  }
}

String _$cartNotifierHash() => r'af8b84abe570c56fbd11a06ef303fcf675fcf97f';

abstract class _$CartNotifier extends $Notifier<CartModel> {
  CartModel build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<CartModel, CartModel>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CartModel, CartModel>,
              CartModel,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
