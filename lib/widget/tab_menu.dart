import 'package:flutter/material.dart';
import 'package:news_app/model/artickel.dart';

class TabBarMenu extends StatefulWidget {
  final List<Article> article;

  TabBarMenu({required this.article});

  @override
  State<TabBarMenu> createState() => _TabBarMenuState();
}

//kita akan menggunakan SingleTickerProviderStateMixin jika kita mempunyai satu animasi

class _TabBarMenuState extends State<TabBarMenu> with SingleTickerProviderStateMixin{
  late TabController _tabController;
  final List<Tab> myTabs = <Tab> [
    Tab(
      text: 'Business',
    ),
    Tab(
      text: 'Entertaiment',
    ),
    Tab(
      text: 'General',
    ),
    Tab(
      text: 'Health',
    ),
    Tab(
      text: 'Science',
    ),
    Tab(
      text: 'Sports',
    ),
    Tab(
      text: 'Technology',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}