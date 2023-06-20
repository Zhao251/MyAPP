
import 'package:flutter/material.dart';

import '../../component/bizpart.dart';
import '../order_page.dart';
import '../person_next/order_list_page.dart';

class BuycarPage extends StatelessWidget {

  final List<SelectedCustompart> selectedCustomparts;

  BuycarPage({required this.selectedCustomparts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('购物车'),
      ),
      body: ListView(
        children: [
          Container(
            height: 200,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/img/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '套餐数量',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('清空'),
                    ),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OrderListPage(selectedCustomparts: selectedCustomparts ?? []),
                            settings: RouteSettings(arguments: selectedCustomparts),
                          ),
                        );
                      },
                      child: Text('去结算'),
                    ),


                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 400,
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: selectedCustomparts.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Custompart(
                            foodname: selectedCustomparts[index].foodname,
                            description: selectedCustomparts[index].description,
                            foodimagePath: selectedCustomparts[index].foodimagePath,
                            foodprice: selectedCustomparts[index].foodprice,
                            foodaddr: selectedCustomparts[index].foodaddr,
                            minValue: selectedCustomparts[index].minValue,
                            maxValue: selectedCustomparts[index].maxValue,
                          ),
                          SizedBox(height: 16.0),
                          Text(
                            '数量: ${selectedCustomparts[index].quantity}',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '套餐总价: \$${(selectedCustomparts[index].foodprice * selectedCustomparts[index].quantity).toStringAsFixed(2)}',
                          ),
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  '总价: \$${selectedCustomparts.fold(0.0, (total, part) => total + part.foodprice * part.quantity).toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )

        ],
      ),
    );
  }
}

