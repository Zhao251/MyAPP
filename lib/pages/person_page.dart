import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:train_order_system/pages/person_next/message_page.dart';
import 'package:train_order_system/pages/person_next/order_list_page.dart';


class Personpart {

  final String userid;
  final String username;
  final String userphone;
  final String usertime;
  final String userimgpath;

  Personpart({

    required this.userid,
    required this.username,
    required this.userphone,
    required this.usertime,
    required this.userimgpath

  });
}

class PersonPage extends StatefulWidget {
  @override
  _PersonPageState createState() => _PersonPageState();


}

class _PersonPageState extends State<PersonPage> {
  Personpart? personData = Personpart(
      userid: '',
      username: '',
      userphone: '',
      usertime: '',
      userimgpath: ''
  );


  @override
  void initState() {
    super.initState();
    getRequestFunction3();
  }

  void getRequestFunction3() async {
    try {
      Dio dio = Dio();
      String url = "http://192.168.8.1:4523/m1/2714298-0-default/user/1";
      Response response = await dio.get(url);
      var responseData = response.data;
      print(responseData);

      setState(() {
        personData = Personpart(
          userid: responseData['userpart']['userid'].toString(),
          username: responseData['userpart']['username'].toString(),
          userphone: responseData['userpart']['userphone'].toString(),
          usertime: responseData['userpart']['usertime'].toString(),
          userimgpath: '',
        );
      });

      print(personData?.username);
    } catch (error) {
      print(error.toString());
    }
  }


  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Color.fromRGBO(242,242,242,1.0),
          body: Column(
            children: [
              // 第一部分
              Container(
                color:  Color.fromRGBO(63, 159, 254, 1.0),
                padding: EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('lib/assets/img/person.jpg'),
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
                            '姓名：${personData?.username}',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text('电话：${personData!.userphone}'),
                          SizedBox(height: 8.0),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
              // 第二部分
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(

                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                    style: BorderStyle.solid,  // 设置边框样式为虚线
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  children: [
                    Text(
                      '我的',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => OrderListPage(selectedCustomparts: [],)),
                                );
                              },
                              child: Icon(Icons.calendar_month),
                            ),
                            Text('历史订单'),
                          ],
                        ),
                        Column(
                          children: [
                            Icon(Icons.star_border),
                            Text('我的评价'),
                          ],
                        ),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => MessagePage()),
                                );
                              },
                              child: Icon(Icons.message_outlined),
                            ),
                            Text('系统消息'),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
              // 第三部分
              Container(

                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '店铺工具',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),  // 添加一个 SizedBox 控制 Icon 和 Text 的间距
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,  // 设置 MainAxisAlignment 为 spaceBetween
                      children: [
                        Text('联系客服'),
                        Icon(Icons.add),
                      ],
                    ),
                    SizedBox(height: 8.0),  // 添加一个 SizedBox 控制 Icon 和 Text 的间距
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,  // 设置 MainAxisAlignment 为 spaceBetween
                      children: [
                        Text('关于我们'),
                        Icon(Icons.add),
                      ],
                    ),
                    SizedBox(height: 8.0),  // 添加一个 SizedBox 控制 Icon 和 Text 的间距

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,  // 设置 MainAxisAlignment 为 spaceBetween
                      children: [
                        Text('关注公众号'),
                        Icon(Icons.add),
                      ],
                    ),

                  ],
                ),
              )
            ],
          ),
        )
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
      home: PersonPage(),
    );
  }
}
