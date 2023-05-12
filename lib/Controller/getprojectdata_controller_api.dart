import 'package:get/get.dart';

import 'package:dio/dio.dart';
import 'package:shaadi_book/main.dart';

class GetProjectDataController extends GetxController {
  Dio dio = Dio();
  List data = [];

  Future<void> getProjectData({eventId, id}) async {
    final response = await dio.get(
      'https://epiccodez.com/shaadibook/api/get-images-by-event-code-or-category?event_code=$eventId&category=$id',
      options: Options(
        headers: {"Authorization": "Bearer ${dataStorage.read('login_token')}"},
      ),
    );
    if (response.statusCode == 200) {
      final res = response.data;
      print("Response------>${response.data}");
      data = response.data['data'];
      print(data);
    }
  }
}
