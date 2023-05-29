import 'package:flutter/material.dart';
import 'package:new_app/constants/colors.dart';
import 'package:intl/intl.dart';
import 'package:new_app/models/news.dart';
import 'package:new_app/services/http_services.dart';
import 'package:new_app/views/news_detail.dart';
import 'package:new_app/widgets/news_card.dart';
import 'package:new_app/widgets/wait_loader.dart';

class BusinessCategoryDetailPage extends StatefulWidget {
  const BusinessCategoryDetailPage({super.key});

  @override
  State<BusinessCategoryDetailPage> createState() =>
      _BusinessCategoryDetailPageState();
}

class _BusinessCategoryDetailPageState
    extends State<BusinessCategoryDetailPage> {
  List<News>? news;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getBusinessNews();
  }

  getBusinessNews() async {
    if (news == null) {
      final fetchedNews = await HttpHelper().getNews("Business");
      setState(() {
        news = fetchedNews;
        isLoaded = true;
      });
    }
  }

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
              const Text(
                "Business",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                DateFormat.yMMMMd().format(DateTime.now()),
                style: const TextStyle(),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Visibility(
                    visible: isLoaded,
                    replacement: const Center(
                      child: WaitLoader(),
                    ),
                    child: ListView.builder(
                        itemCount: news?.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => NewsDetailPage(
                                      postImage:
                                          news![index].urlToImage.toString(),
                                      postTitle: news![index].title.toString(),
                                      postDetail:
                                          news![index].content.toString(),
                                    ),
                                  ),
                                );
                              },
                              child: NewsCard(
                                newsImg: news![index].urlToImage.toString(),
                                newsTitle: news![index].title.toString(),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
