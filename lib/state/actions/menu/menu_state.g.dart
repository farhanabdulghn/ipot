// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getMenuByTableId)
final getMenuByTableIdProvider = GetMenuByTableIdFamily._();

final class GetMenuByTableIdProvider
    extends
        $FunctionalProvider<
          AsyncValue<MenuModel?>,
          MenuModel?,
          FutureOr<MenuModel?>
        >
    with $FutureModifier<MenuModel?>, $FutureProvider<MenuModel?> {
  GetMenuByTableIdProvider._({
    required GetMenuByTableIdFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'getMenuByTableIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getMenuByTableIdHash();

  @override
  String toString() {
    return r'getMenuByTableIdProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<MenuModel?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<MenuModel?> create(Ref ref) {
    final argument = this.argument as String;
    return getMenuByTableId(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is GetMenuByTableIdProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getMenuByTableIdHash() => r'8e7c4934d98f266f1ddd31774e5ed12190e474df';

final class GetMenuByTableIdFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<MenuModel?>, String> {
  GetMenuByTableIdFamily._()
    : super(
        retry: null,
        name: r'getMenuByTableIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GetMenuByTableIdProvider call(String tableId) =>
      GetMenuByTableIdProvider._(argument: tableId, from: this);

  @override
  String toString() => r'getMenuByTableIdProvider';
}
