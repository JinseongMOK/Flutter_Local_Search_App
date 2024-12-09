import 'package:flutter/material.dart';
import 'package:flutter_local_search_app/pages/detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            hintText: '검색어를 입력해주세요',
            border: MaterialStateOutlineInputBorder.resolveWith(
              (states) {
                print(states);
                if (states.contains(WidgetState.focused)) {
                  return OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey[300]!),
                  );
                }
                return OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey),
                );
              },
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/Detail_Page');
            },
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                height: 110,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey[300]!),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '삼성 1동 주민센터',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('공공,사회기관>행정복지센터'),
                    Text('서울특별시 강남구 봉은사로 616 삼성1동 주민센터'),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
