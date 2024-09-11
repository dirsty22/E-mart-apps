import 'package:e_medicine/const/consts.dart';
import 'package:e_medicine/order_screen/order_placed_details.dart';
import 'package:e_medicine/order_screen/order_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart' as intl;

class OrderDetails extends StatelessWidget {
  final dynamic data;
  const OrderDetails({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: "Order Details".text.fontFamily(semibold).make(),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              orderStatus(
                color: redColor,
                icon: Icons.done,
                title: "Placed",
                showDone: data['order_placed'],
              ),
              orderStatus(
                color: Colors.blue,
                icon: Icons.thumb_up,
                title: "Confirmed",
                showDone: data['order_confirmed'],
              ),
              orderStatus(
                color: Colors.yellow,
                icon: Icons.car_crash,
                title: "Delivery",
                showDone: data['order_on_delibery'],
              ),
              orderStatus(
                color: Colors.purple,
                icon: Icons.done_all_rounded,
                title: "Delivered",
                showDone: data['order_delivered'],
              ),
              Divider(),
              10.heightBox,
              Column(
                children: [
                  orderPlacedDetails(
                      d1: data['order_code '],
                      d2: data['shipng_method'],
                      title1: 'Order Code',
                      title2: "Shiping Method"),
                  orderPlacedDetails(
                      d1: intl.DateFormat("h.mma")
                          .add_yMd()
                          .format((data['order_date'].toDate())),
                      d2: data['payment_method'],
                      title1: 'Order Date',
                      title2: "Payment Method"),
                  orderPlacedDetails(
                      d1: "Unpaid",
                      d2: "Order Placed",
                      title1: 'Payment Status',
                      title2: "Delivery Status"),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            "Shiping Address".text.fontFamily(semibold).make(),
                            "${data['order_by_name']}"
                                .text
                                .fontFamily(semibold)
                                .make(),
                            "${data['order_by_email']}"
                                .text
                                .fontFamily(semibold)
                                .make(),
                            "${data['order_by_address']}"
                                .text
                                .fontFamily(semibold)
                                .make(),
                            "${data['order_by_city']}"
                                .text
                                .fontFamily(semibold)
                                .make(),
                            "${data['order_by_state']}"
                                .text
                                .fontFamily(semibold)
                                .make(),
                            "${data['order_by_phone']}"
                                .text
                                .fontFamily(semibold)
                                .make(),
                          ],
                        ),
                        SizedBox(
                          width: 130,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              "Total Amount".text.fontFamily(semibold).make(),
                              "${data['total_amount']}"
                                  .text
                                  .color(redColor)
                                  .fontFamily(semibold)
                                  .make(),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ).box.outerShadowMd.white.make(),
              Divider(),
              10.heightBox,
              "Ordered Product"
                  .text
                  .size(16)
                  .color(darkFontGrey)
                  .fontFamily(semibold)
                  .makeCentered(),
              10.heightBox,
              ListView(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: List.generate(data['orders'].length, (index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      orderPlacedDetails(
                        title1: data['orders'][index]['title'],
                        title2: data['orders'][index]['tprice'],
                        d1: "${data['orders'][index]['qty']}",
                        d2: "Refundaable",
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Container(
                          width: 30,
                          height: 10,
                          // color: Color(data['orders'][index]['color']),
                        ),
                      ),
                      Divider()
                    ],
                  );
                }).toList(),
              ).box.outerShadowMd.white.margin(EdgeInsets.only(bottom: 4)).make(),
              10.heightBox,
              Row(
                children: [
                  "SUB TOTAL".text.color(darkFontGrey).size(16).fontFamily(semibold).make(),
                  
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
