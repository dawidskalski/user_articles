import 'package:dio/dio.dart';

class ArticlesRemoteDiodDataSource {
  Future<List<Map<String, dynamic>>?> getArticles() async {
    final response = await Dio().get<List>(
        'https://my-json-server.typicode.com/adamsmaka/json-demo/articles');

    final listDynamic = response.data;
    if (listDynamic == null) {
      return null;
    }

    return listDynamic.map((e) => e as Map<String, dynamic>).toList();
  }
}
