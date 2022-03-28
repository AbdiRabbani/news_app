import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/artickel.dart';
import 'package:news_app/screen/detailpage.dart';
import 'package:news_app/utils/utils.dart';

class CarouselWidget extends StatefulWidget {
  final List<Article> articleList;

  CarouselWidget(this.articleList);

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  late List<Widget> imageSlider;

  @override
  void initState() {
    /**
     * disini kita akan membuat widget sendiri bernama imageaSlider, kemudian
     * image slider tersebut akan berisikan list dari articleList untuk mengkonversikan
     * daftar string di atas ke dalam daftar widdget imageSlider, kita dapat menggunakan metode map() 
     * dan toList(). Dengan metode map() kita dapat menggunakan setiap string untuk menghasilkan widget
     * imageSlider baru dan dengan metode toList(), anda dapat mengkonversikan objek itreable yang 
     * di kembalikan oleh metode map() ke dalam ibjek List sebenarnya.
     */
    imageSlider = widget.articleList
        .map((article) => GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(
                      article: article,
                    ),
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.all(10),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          shape: BoxShape.rectangle,
                          image: DecorationImage(
                              image: NetworkImage(article.urlToImage),
                              fit: BoxFit.cover)),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              stops: [
                                0.1,
                                0.9
                              ],
                              colors: [
                                Colors.black.withOpacity(0.8),
                                Colors.white.withOpacity(0.1)
                              ])),
                    ),
                    Positioned(
                      bottom: 30,
                      child: Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        width: 250,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              article.tittle,
                              style: titleArticle.copyWith(fontSize: 12),
                            ),
                            SizedBox(height: 10),
                            Text(
                              article.author,
                              style: authorDateArticleHeadline.copyWith(
                                fontSize: 10,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ))
        .toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider(
        items: imageSlider,
        options: CarouselOptions(
          autoPlay: true,
          viewportFraction: 1
        ),
      ),
    );
  }
}
