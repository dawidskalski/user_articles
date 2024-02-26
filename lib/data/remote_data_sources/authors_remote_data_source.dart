import 'package:dio/dio.dart';

class AuthorsRemoteDioDataSource {
  Future<List<Map<String, dynamic>>?> getAuthors() async {
    final response = await Dio().get<List>(
        'https://my-json-server.typicode.com/adamsmaka/json-demo/users');

    final listDynamic = response.data;
    if (listDynamic == null) {
      return null;
    }

    return listDynamic.map((e) => e as Map<String, dynamic>).toList();
  }
}
