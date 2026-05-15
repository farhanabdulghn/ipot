// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'table_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(checkStatusTable)
final checkStatusTableProvider = CheckStatusTableFamily._();

final class CheckStatusTableProvider
    extends $FunctionalProvider<AsyncValue<String?>, String?, FutureOr<String?>>
    with $FutureModifier<String?>, $FutureProvider<String?> {
  CheckStatusTableProvider._({
    required CheckStatusTableFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'checkStatusTableProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$checkStatusTableHash();

  @override
  String toString() {
    return r'checkStatusTableProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<String?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<String?> create(Ref ref) {
    final argument = this.argument as String;
    return checkStatusTable(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is CheckStatusTableProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$checkStatusTableHash() => r'79b27387cd9c1a3177238be0267a2f60309e7be4';

final class CheckStatusTableFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<String?>, String> {
  CheckStatusTableFamily._()
    : super(
        retry: null,
        name: r'checkStatusTableProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CheckStatusTableProvider call(String tableId) =>
      CheckStatusTableProvider._(argument: tableId, from: this);

  @override
  String toString() => r'checkStatusTableProvider';
}
