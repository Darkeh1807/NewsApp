import 'package:flutter/material.dart';
import 'package:new_app/providers/news_provider.dart';
import 'package:new_app/widgets/news_card.dart';
import 'package:provider/provider.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({super.key});

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  var isLoaded = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bookmark"),
        actions: [
          Consumer<NewsProvider>(builder: (context, data, child) {
            return IconButton(
                onPressed: () {
                  data.removeAll();
                },
                icon: const Icon(
                  Icons.delete,
                ));
          })
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
              const Row(
                children: [
                  Text(
                    "NB:",
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Longpress each post to delete",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: Consumer<NewsProvider>(
                          builder: (context, data, child) {
                        return ListView.builder(
                            itemCount: data.totalNews,
                            itemBuilder: (context, index) {
                              final posts = data.news[index];
                              return Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: InkWell(
                                  onLongPress: () {
                                    data.removeNews(posts);
                                  },
                                  child: NewsCard(
                                    newsImg: posts.urlToImage!,
                                    newsTitle: posts.title,
                                  ),
                                ),
                              );
                            });
                      })),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
