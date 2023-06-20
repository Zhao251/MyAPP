import 'package:flutter/material.dart';
import 'package:train_order_system/component/trainmsg.dart';
import 'package:dio/dio.dart';
import 'package:train_order_system/component/trainmsg.dart';
import 'package:train_order_system/component/bizpart.dart';
import 'package:intl/intl.dart';
import 'package:train_order_system/pages/order_page.dart';
import 'package:train_order_system/request/api.dart';

class RecordPage extends StatefulWidget {
  @override
  _RecordPageState createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> {
  List<Trainpart> trainparts = [];

  @override
  void initState() {
    super.initState();
    getRequestTrain();
  }

  void getRequestTrain() async {
    try {
      Dio dio = Dio();
      String url = "http://192.168.8.1:4523/m1/2714298-0-default/train/1";
      Response response = await dio.get(url);
      var data = response.data;
      print(data);
      print(data['trainpart']['traindest']);

      setState(() {
        trainparts = [
          Trainpart(
            starttime: data['trainpart']['traindpt'].toString(),
            startposition: data['trainpart']['traindep'].toString(),
            train: data['trainpart']['trainid'].toString(),
            totaltime: '8时6分',
            endtime: data['trainpart']['trainarr'].toString(),
            endposition: data['trainpart']['traindest'].toString(),
          ),
        ];
      });
      print(trainparts.length);
    } catch (error) {
      print(error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('车次信息'),
      ),
      body: Container(
        height: 1000,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                physics: AlwaysScrollableScrollPhysics(),
                itemCount: trainparts.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    child: Trainpart(
                      starttime: trainparts[index].starttime,
                      startposition: trainparts[index].startposition,
                      train: trainparts[index].train,
                      totaltime: '',
                      endtime: trainparts[index].endtime,
                      endposition: trainparts[index].endposition,
                    ),
                    onTap: () {
                      if (index >= 0 && index < trainparts.length) {
                        final trainpart = trainparts[index];
                        if (trainpart != null) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OrderPage(trainpart: trainpart),
                            ),
                          );
                        } else {
                          print('Trainpart is null at index $index');
                        }
                      } else {
                        print('Invalid index: $index');
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: RecordPage(),
    );
  }
}
