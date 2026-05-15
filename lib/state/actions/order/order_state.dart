import 'package:ipot/api/repositories/order_repository.dart';
import 'package:ipot/models/order/order_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'order_state.g.dart';

@riverpod
Future<OrderModel> getOrderStatus(Ref ref, int? orderId) {
  return OrderRepository().getOrderStatus(orderId);
}
