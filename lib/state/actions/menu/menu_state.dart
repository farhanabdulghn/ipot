import 'package:ipot/api/repositories/menu_repository.dart';
import 'package:ipot/models/menu/menu_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'menu_state.g.dart';

@riverpod
Future<MenuModel?> getMenuByTableId(Ref ref, String tableId) {
  return MenuRepository().getMenuByTableId(tableId);
}
