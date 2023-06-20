import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../component/numchange.dart';



class FooddetailPage extends StatelessWidget {
  final String foodname;
  final String description;
  final String foodimagePath;
  final double foodprice;
  final String foodaddr;

  FooddetailPage({
    required this.foodname,
    required this.description,
    required this.foodimagePath,
    required this.foodprice,
    required this.foodaddr,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(242, 242, 242, 1.0),
      appBar: AppBar(
        title: Text('商家详情'),
      ),
      body: Stack(
        children: [
          Expanded(
            child: ListView(
              children: [
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('lib/assets/img/hamburger.jpg'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 16.0),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '套餐: $foodname',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 8.0),
                                      Text(
                                        '价格: $foodprice',
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      SizedBox(height: 8.0),
                                      Text(
                                        '地址: $foodaddr',
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 16.0),
                            Text(
                              '描述:',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              description,
                              style: TextStyle(fontSize: 14.0),
                            ),
                            SizedBox(height: 16.0),


                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => NumberPickerProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '点餐',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FooddetailPage(
        foodname: '',
        description: '',
        foodimagePath: '',
        foodprice: 15.0,
        foodaddr: '',
      ),
    );
  }
}
