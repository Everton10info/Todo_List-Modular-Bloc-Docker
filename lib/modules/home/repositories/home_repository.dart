import '../../../../shared/core/http_client/app_http_interface.dart';
import '../models/item_model.dart';

class HomeRepository {
  final HttpClientInterface _httpClient;

  HomeRepository(this._httpClient);

  Future createData(String name, bool check) async {
    var response =
        await _httpClient.createHttp(ItemModel(name: name, completed: check));
    return response;
  }

  Future<List<ItemModel>> readData() async {
    List response = await _httpClient.readHttp();
    final result = (response).map((todo) => ItemModel.fromJson(todo)).toList();

    return result;
  }

  Future updateData(String id, String name, bool check) async {
    var response = await _httpClient
        .updateHttp(ItemModel(id: id, name: name, completed: check));
    return response;
  }

  Future deleteData(String id) async {
    var response = await _httpClient.deleteHttp(id);
    return response;
  }
}
