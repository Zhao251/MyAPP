import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:train_order_system/component/trainmsg.dart';
import 'package:provider/provider.dart';
import 'package:train_order_system/pages/log_page.dart';
import 'package:train_order_system/pages/home_page.dart';
import 'package:train_order_system/pages/index_page.dart';
import 'package:train_order_system/provider/trainpart_provider.dart';
import './pages/order_page.dart';
import 'component/numchange.dart';


void main() {
  runApp(
    ChangeNotifierProvider<NumberPickerProvider>(
      create: (_) => NumberPickerProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: NumberPickerProvider(),
        ),
      ],
      child: MaterialApp(
        title: '高铁点餐',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.blue),
        home:  LoginPage(),
        routes: {
          '/order': (context) => OrderPage(
            trainpart: Trainpart(
              starttime: '起始时间',
              startposition: '起始位置',
              train: '车次',
              totaltime: '总时间',
              endtime: '结束时间',
              endposition: '结束位置',
            ),
          ),
        },
      ),
    );
  }
}
