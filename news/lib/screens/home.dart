import 'package:flutter/material.dart';
import 'package:news/api/api.dart';
import 'package:news/utils/category.dart';
import 'package:news/api/article.dart';
import 'package:news/widgets/article_holder.dart';
import 'package:news/widgets/drawer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  NewsApi api = NewsApi();
  var category = NewsCategory.sports;
  var categories = NewsCategory.getCategories();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
          drawer: CustomDrawer(context),
          appBar: AppBar(
            centerTitle: true,
            title: const Text('News App'),
            bottom: const TabBar(
              isScrollable: true,
              indicatorColor: Colors.white,
              indicatorWeight: 5.0,
              tabs: [
                Tab(text: 'Sports', icon: Icon(Icons.sports_cricket)),
                Tab(text: 'Business', icon: Icon(Icons.business)),
                Tab(text: 'Crypto', icon: Icon(Icons.monetization_on)),
                Tab(text: 'Gaming', icon: Icon(Icons.games)),
                Tab(text: 'Political', icon: Icon(Icons.flag)),
                Tab(text: 'India', icon: Icon(Icons.add_location_rounded)),
                Tab(text: 'Weather', icon: Icon(Icons.cloud)),
              ],
            ),
            flexibleSpace: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.purple, Colors.red],
                        begin: Alignment.bottomRight,
                        end: Alignment.topLeft))),
          ),
          body: TabBarView(
            children: [
              buildPage(NewsCategory.sports),
              buildPage(NewsCategory.business),
              buildPage(NewsCategory.crypto),
              buildPage(NewsCategory.gaming),
              buildPage(NewsCategory.political),
              buildPage(NewsCategory.indian),
              buildPage(NewsCategory.weather),
            ],
          )),
    );
  }

  Widget buildPage(String category) {
    return FutureBuilder<List<Article>>(
        future: api.getNews(category: category),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            var articles = snapshot.data ?? [];
            if (articles.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Failed to fetch Data')));
            }
            return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(0.0),
              child: ListView.builder(
                  itemCount: articles.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ArticleHolder(articles[index]);
                  }),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
