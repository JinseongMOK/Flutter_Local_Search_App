import 'dart:convert';
import 'package:flutter_local_search_app/model/model.dart';
import 'package:http/http.dart' as http;

class MapRepository {
  Future<List<Info>> searchMap(String query) async {
    final client = http.Client();
    final response = await client.get(
        Uri.parse(
            'https://openapi.naver.com/v1/search/local.json?query=$query'),
        headers: {
          'X-Naver-Client-Id': 'yt51L5BAot3rE5unFtNS',
          'X-Naver-Client-Secret': '3IgdJKNpTR',
        });
    // Get 요청 성공 => 200
    // 응답코드가 200일 떄!
    // body 데이터를 jsonDecode 함수를 사용해서 Map으로 변환
    // 응답코드가 200이 아닐 때 빈 리스트 반환

    if (response.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(response.body);
      final List<dynamic> items = map['items'];
      final Iterable<Info> iterable = items.map((e) {
        return Info.fromJson(e);
      });

      final list = iterable.toList();
      return list;
    }
    return [];
  }

  Future<String?> getAddress(double lat, double lon) async {
    const String vworldApiKey =
        '5350F08E-F58F-3E1A-9746-62B0824FC858'; // VWORLD API 키

    try {
      final response = await http.get(Uri.parse(
          'http://api.vworld.kr/req/address?service=address&request=getAddress&version=2.0&crs=epsg:4326&point=$lon,$lat&type=both&format=json&key=$vworldApiKey'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['response']['status'] == 'OK') {
          final result = data['response']['result'][0];
          return result['text']; // 전체 주소 반환
        }
      }
    } catch (e) {
      print('$e');
    }
    return null;
  }
}
