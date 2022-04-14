import 'package:flutter/material.dart';
import 'package:news_app/model/artickel.dart';
import 'package:news_app/screen/newspage.dart';
import 'package:news_app/service/data_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    News news = News();
    return Scaffold(
      //scaffold = satu layar penuh
      appBar: AppBar(
        leading: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            image: DecorationImage(
              image: NetworkImage(
                'https://pbs.twimg.com/profile_images/1462629035121381384/om0k99Ag_400x400.jpg',
              ),
            ),
          ),
          width: 10,
          margin: EdgeInsets.all(5),
        ),
        title: Text(
          'Good Morning',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.bookmark),
            color: Colors.blue,
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: FutureBuilder(
        future: news.getNews(),
        builder: (context, snapshoot) => snapshoot.data != null
        ? NewsPage(snapshoot.data as List<Article>)
        : Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
