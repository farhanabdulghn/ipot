import 'package:ipot/api/api_sever.dart';
import 'package:ipot/models/menu/menu_model.dart';

class MenuRepository {
  final _apiServer = ApiServer.getInstance();

  Future<MenuModel?> getMenuByTableId(String tableId) async {
    final queryParams = <String, dynamic>{'table_id': tableId};

    final response = await _apiServer.callService(
      requestType: RequestType.get,
      endPoint: '/menu',
      queryParams: queryParams,
    );

    return MenuModel.fromJson(response.data);
  }
}
