import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  final String newsImg;
  final String newsTitle;
  const NewsCard({Key? key, required this.newsImg, required this.newsTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            newsImg,
            width: double.infinity,
            height: 255,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 160,
          left: 13.5,
          child: Card(
            color: Colors.white,
            child: SizedBox(
              height: 80,
              width: 305,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    newsTitle,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
