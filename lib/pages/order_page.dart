import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:train_order_system/component/trainmsg.dart';
import 'package:train_order_system/component/bizpart.dart';
import 'package:intl/intl.dart';
import 'package:train_order_system/pages/person_next/order_list_page.dart';
import '../component/numchange.dart';
import '../request/api.dart';
import 'biz_next/buy_car_page.dart';
import 'biz_next/detail_page.dart';
import 'home_next/record_page.dart';
import 'home_page.dart';
import 'package:train_order_system/provider/trainpart_provider.dart';

class CustompartData {
  final int index; // Custompart的索引
  int numberPickerValue; // NumberPicker的值

  CustompartData({required this.index, required this.numberPickerValue});
}

class SelectedCustompart {
  String foodname;
  String description;
  String foodimagePath;
  double foodprice;
  String foodaddr;
  int quantity;
  int numberPickerValue; // 添加数量值属性

  SelectedCustompart({
    required this.foodname,
    required this.description,
    required this.foodimagePath,
    required this.foodprice,
    required this.foodaddr,
    required this.quantity,
    required this.numberPickerValue,
  });

  get minValue => 0;
  get maxValue =>100;
}

class SharedData {
  List<SelectedCustompart> selectedCustomparts;

  SharedData({required this.selectedCustomparts});
}


class OrderPage extends StatefulWidget {
  final Trainpart trainpart;

  OrderPage({required this.trainpart});

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  List<Custompart> customparts = [];
  List<CustompartData> custompartDataList = []; // 存储Custompart和NumberPicker的值的列表
  List<SelectedCustompart> selectedCustomparts = []; // 存储大于0的Custompart组件列表

  @override
  void initState() {
    super.initState();
    getRequestfood();
  }

  void getRequestfood() async {
    try {
      var fooddata = await api.getData(
          'http://192.168.8.1:4523/m1/2714298-0-default/owner/1'); // 获取食物数据的接口调用
      print(fooddata);
      setState(() {
        if (fooddata['foodnum'] != null) {
          List<dynamic> foodNumList = fooddata['foodnum'];
          customparts = foodNumList.map((foodNum) {
            return Custompart(
              foodname: foodNum['foodpart']['foodname'].toString(),
              description: foodNum['foodpart']['foodmsg'].toString(),
              foodimagePath: foodNum['foodpart']['foodpic'].toString(),
              foodprice: foodNum['foodpart']['foodprice'].toDouble(),
              foodaddr: foodNum['foodpart']['foodadd'].toString(),
              minValue: 0,
              maxValue: 100,
            );
          }).toList();
          custompartDataList = List<CustompartData>.generate(
            customparts.length,
                (index) => CustompartData(index: index, numberPickerValue: 0),
          );
        } else {
          // 设置foodpart的默认值
          customparts = [
            Custompart(
              foodname: '默认食物名称',
              description: '默认食物描述',
              foodimagePath: '默认食物图片路径',
              foodprice: 15.00,
              foodaddr: '默认食物地址',
              minValue: 0,
              maxValue: 100,
            ),
          ];
          custompartDataList = [
            CustompartData(index: 0, numberPickerValue: 0)
          ]; // 默认值
        }
      });
    } catch (error) {
      print(error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);
    SharedData sharedData = SharedData(selectedCustomparts: selectedCustomparts);

    return Scaffold(
      backgroundColor: Color.fromRGBO(242, 242, 242, 1.0),
      appBar: AppBar(
        title: Text(
          '订单',
          textAlign: TextAlign.center,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              '当前车次',
              style: TextStyle(fontSize: 20),
            ),
            if (widget.trainpart != null)
              Trainpart(
                starttime: widget.trainpart.starttime,
                startposition: widget.trainpart.startposition,
                train: widget.trainpart.train,
                totaltime: widget.trainpart.totaltime,
                endtime: widget.trainpart.endtime,
                endposition: widget.trainpart.endposition,
              ),
            Text(
              formattedDate,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RecordPage(), // 替换为目标页面的构造函数
                      ),
                    );
                  },// 按钮1的点击事件处理逻辑
                  child: Text('详情'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // 按钮2的点击事件处理逻辑
                  },
                  child: Text('修改'),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: '搜索',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: customparts.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FooddetailPage(
                          foodname: customparts[index].foodname,
                          description: customparts[index].description,
                          foodimagePath: customparts[index].foodimagePath,
                          foodprice: customparts[index].foodprice,
                          foodaddr: customparts[index].foodaddr,
                        ),
                      ),
                    );
                  },
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 25), // 添加底部间距
                            child: Custompart(
                              foodname: customparts[index].foodname,
                              description: customparts[index].description,
                              foodimagePath: customparts[index].foodimagePath,
                              foodprice: customparts[index].foodprice,
                              foodaddr: customparts[index].foodaddr,
                              minValue: 0,
                              maxValue: 10,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.0),
                      Positioned(
                        bottom: 0,
                        right: 8,
                        child: NumberPicker(
                          valueNotifier: ValueNotifier(custompartDataList[index].numberPickerValue),
                          onChanged: (value) {
                            setState(() {
                              custompartDataList[index].numberPickerValue = value;
                              if (value > 0) {
                                if (!selectedCustomparts.any((item) => item.foodname == customparts[index].foodname)) {
                                  selectedCustomparts.add(SelectedCustompart(
                                    foodname: customparts[index].foodname,
                                    description: customparts[index].description,
                                    foodimagePath: customparts[index].foodimagePath,
                                    foodprice: customparts[index].foodprice,
                                    foodaddr: customparts[index].foodaddr,
                                    quantity: 1,
                                    numberPickerValue: value,
                                  ));
                                } else {
                                  SelectedCustompart existingPart = selectedCustomparts.firstWhere((item) => item.foodname == customparts[index].foodname);
                                  existingPart.quantity += 1;
                                  existingPart.numberPickerValue = value;
                                }
                              } else {
                                selectedCustomparts.removeWhere((item) => item.foodname == customparts[index].foodname);
                              }
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),

            SizedBox(height: 16.0),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => OrderListPage(
          //       selectedCustomparts: selectedCustomparts,
          //     ),
          //   ),
          // );
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BuycarPage(
                  selectedCustomparts: selectedCustomparts,
                )),
          );

        },
        child: Icon(Icons.shopping_cart),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}

void main() {
  runApp(
    ChangeNotifierProvider<TrainpartProvider>(
      create: (context) => TrainpartProvider(),
      child: MaterialApp(
        home: OrderPage(
          trainpart: Trainpart(
            starttime: '起始时间',
            startposition: '起始位置',
            train: '车次',
            totaltime: '8时6分',
            endtime: '结束时间',
            endposition: '结束位置',
          ),
        ),
      ),
    ),
  );
}
