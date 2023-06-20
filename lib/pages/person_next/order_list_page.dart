import 'package:flutter/material.dart';

import '../../component/bizpart.dart';
import '../order_page.dart';

class OrderListPage extends StatelessWidget {
  final List<SelectedCustompart> selectedCustomparts;

  OrderListPage({required this.selectedCustomparts});

  @override
  Widget build(BuildContext context) {
    if (selectedCustomparts.isEmpty) {
      // 当selectedCustomparts为空时，展示空页面
      return Scaffold(
        backgroundColor: Color.fromRGBO(242, 242, 242, 1.0),
        appBar: AppBar(
          title: Text('订单页面'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('没有任何订单'),
              SizedBox(height: 16.0),
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text('订单页面'),
        ),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [],
              ),
            ),
            Container(
              height: 400,
              child: ListView.builder(
                itemCount: selectedCustomparts.length,
                itemBuilder: (context, index) {
                  final custompart = selectedCustomparts[index];
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.green, // 绿色背景色
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 4.0),
                          child: Text(
                            '正在进行',
                            style: TextStyle(
                              color: Colors.white, // 白色文字颜色
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          '套餐: ${custompart.foodname}',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '套餐总价: \$${(selectedCustomparts[index].foodprice * selectedCustomparts[index].quantity).toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '总价: \$${selectedCustomparts.fold(0.0, (total, part) => total + part.foodprice * part.quantity).toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
    }
  }
}
