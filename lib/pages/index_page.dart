import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../component/trainmsg.dart';
import '../provider/trainpart_provider.dart';
import 'home_page.dart';
import 'order_page.dart';
import 'person_page.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: '首页',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart),
      label: '订单',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: '我的',
    ),
  ];

  List<Widget> tabBodies = [];
  int currentIndex = 0;
  late Widget currentPage;

  @override
  void initState() {
    super.initState();
    tabBodies = [
      HomePage(),
      OrderPage(trainpart: Trainpart(
        starttime: '起始时间',
        startposition: '起始位置',
        train: '车次',
        totaltime: '总时间',
        endtime: '结束时间',
        endposition: '结束位置',
      )),
      PersonPage(),
    ];
    currentPage = tabBodies[currentIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        items: bottomTabs,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            currentPage = tabBodies[currentIndex];
          });
        },
      ),
      body: ChangeNotifierProvider(
        create: (_) => TrainpartProvider(),
        child: currentPage,
      ),
    );
  }
}
