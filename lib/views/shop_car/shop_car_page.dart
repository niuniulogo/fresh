import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ShopCarPage extends StatefulWidget {
  const ShopCarPage({Key? key}) : super(key: key);

  @override
  State<ShopCarPage> createState() => _ShopCarPageState();
}

class _ShopCarPageState extends State<ShopCarPage> {
  String _is_select_all = '0';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('购物车'),
        centerTitle: true,
        actions: [
          Container(width: 40, height: 40, child: Center(child: Text('删除'))),
          SizedBox(
            width: 15,
          )
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
                child: Center(
              child: Container(
                  width: double.maxFinite,
                  height: 300,
                  child: Column(children: [
                    Lottie.asset('images/kong-car.json', width: 200),
                    Text(
                      '去逛逛,慰劳一下自己吧',
                      style: TextStyle(fontSize: 16, color: Colors.grey[500]),
                    ),
                  ])),
            )),
            Container(
                padding: EdgeInsets.all(10),
                width: double.maxFinite,
                height: 50,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.white,
                      Color.fromRGBO(207, 245, 210, 0.1),

                    ],
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Radio(
                                  toggleable: true,
                                  value: '1',
                                  groupValue: _is_select_all,
                                  onChanged: (e) {
                                    setState(() {
                                      _is_select_all = e.toString();
                                    });
                                    print(_is_select_all);
                                  }),
                              Text('全选')
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                '合计:',
                                style: TextStyle(fontSize: 12),
                              ),
                              Text('¥ 0.0',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold))
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Chip(
                      padding: EdgeInsets.only(left: 8, right: 8,top: -4),
                      label: Text(
                        '去结算',
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                      backgroundColor: Colors.green,
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
