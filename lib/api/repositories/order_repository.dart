import 'package:ipot/api/api_sever.dart';
import 'package:ipot/extensions/extensions.dart';
import 'package:ipot/models/cart/cart_model.dart';
import 'package:ipot/models/order/order_model.dart';

class OrderRepository {
  final _apiServer = ApiServer.getInstance();

  Future<int?> submitOrder(CartModel cart) async {
    final payload = <String, dynamic>{
      'table_id': cart.tableId,
      'items': cart.items
          .map(
            (e) => {
              'menu_item_id': e.id,
              'quantity': e.qty,
              'customizations': e.customizationGroups
                  ?.expand(
                    (group) =>
                        group.options?.map(
                          (option) => {'option_id': option.id, 'quantity': 1},
                        ) ??
                        [],
                  )
                  .toList(),
            },
          )
          .toList(),
    };

    if (cart.customerNote.hasValue) {
      payload['customer_note'] = cart.customerNote;
    }

    final response = await _apiServer.callService(
      requestType: RequestType.post,
      endPoint: '/orders',
      payload: payload,
    );

    return response.data['orderId'];
  }

  Future<OrderModel> getOrderStatus(int? orderId) async {
    final response = await _apiServer.callService(
      requestType: RequestType.get,
      endPoint: '/orders/$orderId',
    );

    return OrderModel.fromJson(response.data['data']);
  }
}
