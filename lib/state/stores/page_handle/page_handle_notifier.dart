import 'package:ipot/models/page_handle/page_handle_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'page_handle_notifier.g.dart';

@riverpod
class PageHandleNotifier extends _$PageHandleNotifier {
  @override
  PageHandleModel build() {
    return PageHandleModel();
  }

  void setPage(int value) {
    state = state.copyWith(page: value);
  }

  void setShortcut(bool value) {
    state = state.copyWith(shortcut: value);
  }

  void setMenuNavigationHeight(double value) {
    state = state.copyWith(menuNavigationHeight: value);
  }

  void setOrderId(int? value) {
    state = state.copyWith(page: 1, orderId: value);
  }
}
