import 'package:ipot/state/actions/table/table_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

List<Override> scanSuccessOverrides() => [
  checkStatusTableProvider('T001').overrideWith((ref) async => 'T001'),
];

List<Override> scanFailOverrides() => [
  checkStatusTableProvider(
    'INVALID',
  ).overrideWith((ref) async => throw Exception('Table not found')),
];
