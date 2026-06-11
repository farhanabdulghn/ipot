// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_handle_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PageHandleNotifier)
final pageHandleProvider = PageHandleNotifierProvider._();

final class PageHandleNotifierProvider
    extends $NotifierProvider<PageHandleNotifier, PageHandleModel> {
  PageHandleNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pageHandleProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pageHandleNotifierHash();

  @$internal
  @override
  PageHandleNotifier create() => PageHandleNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PageHandleModel value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PageHandleModel>(value),
    );
  }
}

String _$pageHandleNotifierHash() =>
    r'767ba8ae0c0a90b4351a49233b69aadf4ec55c2d';

abstract class _$PageHandleNotifier extends $Notifier<PageHandleModel> {
  PageHandleModel build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<PageHandleModel, PageHandleModel>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PageHandleModel, PageHandleModel>,
              PageHandleModel,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
