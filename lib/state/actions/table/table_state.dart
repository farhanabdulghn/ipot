import 'package:ipot/api/repositories/table_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'table_state.g.dart';

@riverpod
Future<String?> checkStatusTable(Ref ref, String tableId) {
  return TableRepository().checkStatusTable(tableId);
}
