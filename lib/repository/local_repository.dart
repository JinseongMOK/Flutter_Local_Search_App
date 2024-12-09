import 'dart:convert';

import 'package:flutter_local_search_app/model/model.dart';
import 'package:http/http.dart';

class BookRepository {
  Future<List<Location>> searchBooks(String query) async {
    final client = Client();
    final response = await client.get(
      Uri.parse('https://openapi.naver.com/v1/search/local.json?query=$query'),
      headers: {
        'X-Naver-Client-Id': 'yt51L5BAot3rE5unFtNS',
        'X-Naver-Client-Secret': '3IgdJKNpTR',
      },
    );
    // Get 요청 시 성공 -> 200
    // 응답 코드가 200일 때
    //        body 데이터를 jsonDecode  함수 사용해서 map으로 바꾼 후 List<Book> 으로 반환
    if (response.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(response.body);
      final items = List.from(map['items']);
      final iterable = items.map((e) {
        return Location.fromJson(e);
      });
      final list = iterable.toList();
      return list;
    }
    // 아닐 때 빈 리스트 반환
    return [];
  }
}
