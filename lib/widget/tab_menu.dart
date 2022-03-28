import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/artickel.dart';
import 'package:news_app/service/data_service.dart';

class TabBarMenu extends StatefulWidget {
  final List<Article> article;

  TabBarMenu({required this.article});

  @override
  State<TabBarMenu> createState() => _TabBarMenuState();
}

//kita akan menggunakan SingleTickerProviderStateMixin jika kita mempunyai satu animasi

class _TabBarMenuState extends State<TabBarMenu>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<Tab> myTabs = <Tab>[
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
  void initState() {
    _tabController = TabController(length: myTabs.length, vsync: this);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    News news = News();
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          TabBar(
            tabs: myTabs,
            controller: _tabController,
            labelColor: Colors.deepOrangeAccent,
            unselectedLabelColor: Colors.black,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BubbleTabIndicator(
                indicatorColor: Colors.black,
                indicatorHeight: 30,
                tabBarIndicatorSize: TabBarIndicatorSize.tab),
            isScrollable: true,
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: TabBarView(children: children),
          )
        ],
      ),
    );
  }
}
