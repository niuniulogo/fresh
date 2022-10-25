import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ItemGoodInfo extends StatelessWidget {
  String goodUrl;
  String goodTitle;
  double goodPrice;
  int type;

  String goodType;

  ItemGoodInfo(
      {Key? key,
      required this.goodUrl,
      required this.goodTitle,
      required this.goodPrice,
      this.type = 1,
      this.goodType = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return type == 1
            ? Container(
                width: 100,
                padding: EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.asset(
                        goodUrl,
                        height: 80,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Text(
                      goodTitle,
                      style: TextStyle(fontSize: 12),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '¥' + goodPrice.toString(),
                          style: TextStyle(color: Colors.deepOrange),
                        ),
                        Container(
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.green),
                          child: Lottie.asset('images/car.json',
                              height: 15, width: 15),
                        )
                      ],
                    )
                  ],
                ),
              )
            : Container(
                padding: EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.network(
                        goodUrl,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Text(
                      goodTitle,
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              color: Colors.deepOrange[100],
                              border: Border.all(color: Colors.redAccent,width: 0.5),
                              borderRadius: BorderRadius.circular(2)
                          ),
                          child: Text(
                            '特价',
                            style: TextStyle(

                                color: Colors.redAccent,
                                fontSize: 10),
                          ),
                        ),
                        SizedBox(width: 5,),
                        Container(
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: Colors.greenAccent[100],
                            border: Border.all(color: Colors.green,width: 0.5),
                            borderRadius: BorderRadius.circular(2)
                          ),
                          child: Text('24H发货',style: TextStyle(
                              color: Colors.green,
                              fontSize: 10)),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '¥' + goodPrice.toString() + '/' + goodType,
                          style: TextStyle(color: Colors.deepOrange),
                        ),
                        Container(
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.green),
                          child: Lottie.asset('images/car.json',
                              height: 20, width: 20),
                        )
                      ],
                    )
                  ],
                ),
              );
      },
    );
  }
}
