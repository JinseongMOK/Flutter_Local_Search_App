import 'package:html/parser.dart';

class Info {
  final String title;
  final String link;
  final String category;
  final String description;
  final String telephone;
  final String address;
  final String roadAddress;
  final String mapx;
  final String mapy;

  Info({
    required this.title,
    required this.link,
    required this.category,
    required this.description,
    required this.telephone,
    required this.address,
    required this.roadAddress,
    required this.mapx,
    required this.mapy,
  });

  Info.fromJson(Map<String, dynamic> map)
      : this(
          title: map['title'],
          link: map['link'],
          category: map['category'],
          description: map['description'],
          telephone: map['telephone'],
          address: map['address'],
          roadAddress: map['roadAddress'],
          mapx: map['mapx'],
          mapy: map['mapy'],
        );

  // HTML 태그 제거 헬퍼 메서드
  static String removeHtmlTags(String text) {
    var document = parse(text);
    String parsedString =
        parse(document.body?.text ?? '').documentElement?.text ?? '';
    return parsedString;
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'link': link,
      'category': category,
      'description': description,
      'telephone': telephone,
      'address': address,
      'roadAddress': roadAddress,
      'mapx': mapx,
      'mapy': mapy,
    };
  }
}
