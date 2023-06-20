import 'dart:convert';
import 'package:provider/provider.dart';

import '../provider/trainpart_provider.dart';
import '../request/api.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';


// class TrainPartService {
//   final String apiUrl = 'https://example.com/api/trainparts';
//
//   Future<List> getTrainParts() async {
//     final dio = Dio();
//     final response = await dio.get(apiUrl);
//     if (response.statusCode == 200) {
//       final List<dynamic> trainpartData = jsonDecode(response.data);
//       return trainpartData.map((data) => trainpart.fromJson(data)).toList();
//     } else {
//       throw Exception('Failed to load train parts from API');
//     }
//   }
// }

class Trainpart extends StatelessWidget {
  final String starttime;
  final String startposition;
  final String train;
  final String totaltime;
  final String endtime;
  final String endposition;

  const Trainpart({
    required this.starttime,
    required this.startposition,
    required this.train,
    required this.totaltime,
    required this.endtime,
    required this.endposition,
  });

  // factory trainpart.fromJson(Map<String, dynamic> json) {
  //   return trainpart(
  //     starttime: json['starttime'],
  //     startposition: json['startposition'],
  //     train: json['train'],
  //     totaltime: json['totaltime'],
  //     endtime: json['endtime'],
  //     endposition: json['endposition'],
  //   );
  // }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0), // 设置上下间距
      child: GestureDetector(

        child: Container(
          height: 150, // 设置固定高度
          decoration: BoxDecoration(
            color: Colors.white, // 设置白色背景色
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(color: Colors.black), // 修改为右边添加边框
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        startposition.toString(),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        starttime.toString(),
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(color: Colors.black),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        train.toString(),
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 8.0),
                      Icon(Icons.arrow_forward),
                      SizedBox(height: 8.0),
                      Text(
                        '8时6分',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        endposition.toString(),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        endtime.toString(),
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
