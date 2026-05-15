// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getOrderStatus)
final getOrderStatusProvider = GetOrderStatusFamily._();

final class GetOrderStatusProvider
    extends
        $FunctionalProvider<
          AsyncValue<OrderModel>,
          OrderModel,
          FutureOr<OrderModel>
        >
    with $FutureModifier<OrderModel>, $FutureProvider<OrderModel> {
  GetOrderStatusProvider._({
    required GetOrderStatusFamily super.from,
    required int? super.argument,
  }) : super(
         retry: null,
         name: r'getOrderStatusProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getOrderStatusHash();

  @override
  String toString() {
    return r'getOrderStatusProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<OrderModel> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<OrderModel> create(Ref ref) {
    final argument = this.argument as int?;
    return getOrderStatus(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is GetOrderStatusProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getOrderStatusHash() => r'42d1b37ea2b44a4289747192cc4e8b10af843c7e';

final class GetOrderStatusFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<OrderModel>, int?> {
  GetOrderStatusFamily._()
    : super(
        retry: null,
        name: r'getOrderStatusProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GetOrderStatusProvider call(int? orderId) =>
      GetOrderStatusProvider._(argument: orderId, from: this);

  @override
  String toString() => r'getOrderStatusProvider';
}
