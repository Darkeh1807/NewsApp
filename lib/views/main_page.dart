import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:new_app/constants/colors.dart';
import 'package:new_app/providers/news_provider.dart';
import 'package:new_app/views/book_mark.dart';
import 'package:new_app/views/business_category_details.dart';
import 'package:new_app/views/education_category_details.dart';
import 'package:new_app/views/entertainment_category_details.dart';
import 'package:new_app/views/sports_category_details.dart';
import 'package:new_app/views/tech_category_details.dart';
import 'package:new_app/widgets/category_card.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 20,
            ),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: AppColors.blueColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Icon(
                Icons.search,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Welcome Elijah Darkeh",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              )
                  .animate(delay: const Duration(seconds: 1))
                  .fadeIn(duration: const Duration(seconds: 2)),
              Text(
                "${DateFormat.jm().format(DateTime.now())} | ${DateFormat.yMMMMd().format(DateTime.now())}",
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'You were reading "Flood in Baglalore"',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15),
              ),
              const Text(
                "Continue reading?",
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.blueColor),
              ),
              const SizedBox(
                height: 80,
              ),
              const Text(
                "Select a Category For Today",
                style: TextStyle(
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => const SportsCategoryDetailPage(),
                    ),
                  );
                },
                child: const CategoryCard(
                  categoryTitle: "Sports",
                  catIcon: "assets/images/football.png",
                ).animate(delay: const Duration(seconds: 1)).slideX(
                      begin: 20,
                      end: 0,
                      duration: const Duration(seconds: 2),
                    ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) =>
                          const TechnologyCategoryDetailPage(),
                    ),
                  );
                },
                child: const CategoryCard(
                  categoryTitle: "Technology",
                  catIcon: "assets/images/technology.png",
                ).animate(delay: const Duration(seconds: 2)).slideX(
                      begin: -20,
                      end: 0,
                      duration: const Duration(seconds: 3),
                    ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) =>
                          const EntertainmentCategoryDetailPage(),
                    ),
                  );
                },
                child: const CategoryCard(
                  categoryTitle: "Entertainment",
                  catIcon: "assets/images/entertainment.png",
                ).animate(delay: const Duration(seconds: 3)).slideX(
                      begin: 20,
                      end: 0,
                      duration: const Duration(seconds: 4),
                    ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => const BusinessCategoryDetailPage(),
                    ),
                  );
                },
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) =>
                            const BusinessCategoryDetailPage(),
                      ),
                    );
                  },
                  child: const CategoryCard(
                    categoryTitle: "Business",
                    catIcon: "assets/images/analytics.png",
                  ).animate(delay: const Duration(seconds: 4)).slideX(
                        begin: -20,
                        end: 0,
                        duration: const Duration(seconds: 5),
                      ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => const EducationCategoryDetailPage(),
                    ),
                  );
                },
                child: const CategoryCard(
                  categoryTitle: "Education",
                  catIcon: "assets/images/education.png",
                ).animate(delay: const Duration(seconds: 5)).slideX(
                      begin: 20,
                      end: 0,
                      duration: const Duration(seconds: 6),
                    ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
      drawer: const Drawer(),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => const BookmarkPage(),
          ),
        );
      }, child: Consumer<NewsProvider>(builder: (context, value, child) {
        final allBookmarkedNews = value.totalNews;
        return Badge(
          label: Text("$allBookmarkedNews"),
          child: const Icon(Icons.bookmark),
        );
      })),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
