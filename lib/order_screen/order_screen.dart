import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_medicine/const/consts.dart';
import 'package:e_medicine/order_screen/order_details.dart';
import 'package:e_medicine/services/firestore_services.dart';
import 'package:e_medicine/widgets_common/loading_indicatoe.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "My Order".text.color(darkFontGrey).fontFamily(semibold).make(),
      ),
      body: StreamBuilder(
          stream: FirestoreServices.getAllOrders(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshots) {
            if (!snapshots.hasData) {
              return Center(
                child: loadingIndicator(),
              );
            } else if (snapshots.data!.docs.isEmpty) {
              return "No orders yet!".text.color(darkFontGrey).makeCentered();
            } else {
              var data = snapshots.data!.docs;
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: "${index + 1}"
                        .text
                        .fontFamily(bold)
                        .color(darkFontGrey).xl
                        .make(),
                    title: data[index]['order_code ']
                        .toString()
                        .text
                        .color(redColor)
                        .fontFamily(semibold)
                        .make(),
                    subtitle: data[index]['total_amount']
                        .toString()
                        .numCurrency
                        .text
                        .fontFamily(semibold)
                        .make(),
                    trailing: IconButton(
                        onPressed: () {
                          Get.to(()=> OrderDetails(data: data[index],));
                        },
                        icon: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: darkFontGrey,
                        )),
                  );
                },
              );
            }
          }),
    );
  }
}
