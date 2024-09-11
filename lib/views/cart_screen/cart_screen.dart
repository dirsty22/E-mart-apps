import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_medicine/controller/cart_controller.dart';
import 'package:e_medicine/services/firestore_services.dart';
import 'package:e_medicine/views/cart_screen/shiping_screen.dart';
import 'package:e_medicine/widgets_common/loading_indicatoe.dart';
import 'package:e_medicine/widgets_common/out_button.dart';
import 'package:flutter/material.dart';
import 'package:e_medicine/const/consts.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(CartController());
    return Scaffold(
        bottomNavigationBar: SizedBox(
            height: 50,
            child: ourButton(
              color: redColor,
              onPress: () {
                Get.to(() =>ShipingDetails());
              },
              textColor: whiteColor,
              title: "Proceed to shoping",
            )),
        backgroundColor: whiteColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: "shoping cart"
              .text
              .fontFamily(semibold)
              .color(darkFontGrey)
              .make(),
        ),
        body: StreamBuilder(
            stream: FirestoreServices.getCart(currentUser!.uid),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshots) {
              if (!snapshots.hasData) {
                return Center(
                  child: loadingIndicator(),
                );
              } else if (snapshots.data!.docs.isEmpty) {
                return Center(
                  child: "Cart is empty".text.color(darkFontGrey).make(),
                );
              } else {
                var data = snapshots.data!.docs;
                controller.calculate(data);
                controller.produtSnapshot = data;

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Expanded(
                          child: Container(
                        child: ListView.builder(
                            itemCount: data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                leading: Image.network("${data[index]['img']}"
                                ,width: 120,
                                fit: BoxFit.cover,),
                                
                                title:
                                    "${data[index]['title']} x${data[index]['qty']}"
                                        .text
                                        .fontFamily(semibold)
                                        .size(16)
                                        .make(),
                                subtitle: "${data[index]['tprice']}"
                                    .numCurrency
                                    .text
                                    .fontFamily(semibold)
                                    .color(redColor)
                                    .make(),
                                trailing: Icon(
                                  Icons.delete,
                                  color: redColor,
                                ).onTap(() {
                                  FirestoreServices.deletDocument(
                                      data[index].id);
                                }),
                              );
                            }),
                        // color: Colors.red,
                      )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          "Total price"
                              .text
                              .fontFamily(semibold)
                              .color(darkFontGrey)
                              .make(),
                          Obx(
                            () => "${controller.totalP.value}"
                                .numCurrency
                                .text
                                .fontFamily(semibold)
                                .color(darkFontGrey)
                                .make(),
                          ),
                        ],
                      )
                          .box
                          .padding(EdgeInsets.all(12))
                          .width(context.screenWidth - 60)
                          .color(lightGolgen)
                          .roundedSM
                          .make(),
                      10.heightBox,
                      // SizedBox(
                      //     width: context.screenWidth - 60,
                      //     child: ourButton(
                      //       color: redColor,
                      //       onPress: () {},
                      //       textColor: whiteColor,
                      //       title: "Proceed to shoping",
                      //     )),
                    ],
                  ),
                );
              }
            }));
  }
}
