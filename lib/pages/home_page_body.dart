import 'package:flutter/material.dart';
import 'package:flutter_local_search_app/model/model.dart';
import 'package:flutter_local_search_app/pages/detail_page.dart';
import 'package:flutter_local_search_app/pages/home_view_model.dart';

class HomePageBody extends StatelessWidget {
  final HomeState homeState;

  const HomePageBody({
    super.key,
    required this.homeState,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        itemCount: homeState.info.length,
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemBuilder: (context, index) {
          final guidance = homeState.info[index];
          return item(context, guidance);
        },
      ),
    );
  }

  Widget item(BuildContext context, Info info) {
    try {
      return GestureDetector(
        onTap: () {
          if (info.link.startsWith('https')) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPage(link: info.link),
              ),
            );
          }
        },
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(20.0),
          margin: EdgeInsets.symmetric(horizontal: 20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 1, color: Colors.grey[350]!),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                info.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                info.category,
              ),
              const SizedBox(height: 4),
              Text(
                info.address,
              ),
            ],
          ),
        ),
      );
    } catch (e) {
      print('$e');
      return Container();
    }
  }
}
