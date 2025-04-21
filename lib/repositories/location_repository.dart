import 'package:dio/dio.dart';
import '../models/location.dart';

class LocationRepository {
  final Dio _dio = Dio();
  final String baseUrl = 'https://openapi.naver.com/v1/search/local.json';
  final String clientId = 'ALbHMP2DgWJTXGUQzcYj';
  final String clientSecret = 'd8eKmNg1qt';

  Future<List<Location>> searchLocation(String query) async {
    try {
      final response = await _dio.get(
        baseUrl,
        queryParameters: {'query': query, 'display': 5},
        options: Options(
          headers: {
            'X-Naver-Client-Id': clientId,
            'X-Naver-Client-Secret': clientSecret,
          },
        ),
      );

      if (response.statusCode == 200) {
        final items = response.data['items'] as List;
        return items.map((item) => Location.fromJson(item)).toList();
      } else {
        throw Exception('검색 결과를 불러오는데 실패했습니다');
      }
    } catch (e) {
      throw Exception('오류가 발생했습니다: $e');
    }
  }
}
