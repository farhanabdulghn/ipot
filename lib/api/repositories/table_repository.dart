import 'package:ipot/api/api_sever.dart';

class TableRepository {
  final _apiServer = ApiServer.getInstance();

  Future<String?> checkStatusTable(String tableId) async {
    final response = await _apiServer.callService(
      requestType: RequestType.get,
      endPoint: '/tables/$tableId/status',
    );

    return response.data['tableId'];
  }
}
