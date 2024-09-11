import 'package:e_medicine/const/consts.dart';
import 'package:e_medicine/controller/product_controller.dart';
import 'package:e_medicine/services/firestore_services.dart';
import 'package:e_medicine/views/category_screen/item_details.dart';
import 'package:e_medicine/widgets_common/bg_widgwt.dart';
import 'package:e_medicine/widgets_common/loading_indicatoe.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CategoryDetails extends StatelessWidget {
  final String? title;
  const CategoryDetails({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProductController>();

    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: redColor),
          backgroundColor: Colors.transparent,
          title: title!.text.fontFamily(bold).color(redColor).make(),
        ),
        body: 
        StreamBuilder(
          
          stream: FirestoreServices.getProducts(title),
          builder: (BuildContext context, AsyncSnapshot snapshots) {
            if (!snapshots.hasData) {
              return Center(
                child: loadingIndicator(),
              );
            } else if (snapshots.data!.docs.isEmpty) {
              return Center(
                child: "No Product found".text.color(darkFontGrey).make(),
              );
            } else {
              var data = snapshots.data!.docs;
              return Container(
                child: Column(
                  children: [
                    // AppBar(
                    //   iconTheme: IconThemeData(color: whiteColor),
                    //   backgroundColor: Colors.transparent,
                    //   title: title!.text.fontFamily(bold).white.make(),
                    // ),
                    Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SingleChildScrollView(
                          // physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                                controller.subcat.length,
                                (index) => "${controller.subcat[index]}"
                                    .text
                                    .size(12)
                                    .fontFamily(semibold)
                                    .color(darkFontGrey)
                                    .makeCentered()
                                    .box
                                    .color(Vx.red200)
                                    .roundedSM
                                    .size(120, 50)
                                    .margin(EdgeInsets.symmetric(horizontal: 4))
                                    .make()),
                          ),
                        ),

                        // Expanded(
                        //   child: GridView.builder(
                        //     shrinkWrap: true,
                        //     itemCount: 6,
                        //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                        //    itemBuilder: (context , index) {
                        //     return Container(

                        //     );
                        //   }))
                      ],
                    ),
                    20.heightBox,
                    Expanded(
                        child: GridView.builder(
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: data.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisExtent: 250,
                                    mainAxisSpacing: 8,
                                    crossAxisSpacing: 8),
                            itemBuilder: (context, index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.network(
                                    data[index]['p_img'][0],
                                    height: 150,
                                    width: 150,
                                    fit: BoxFit.cover,
                                  ),
                                  "${data[index]['p_name']}"
                                      .text
                                      .fontFamily(semibold)
                                      .color(darkFontGrey)
                                      .make(),
                                  10.heightBox,
                                  "${data[index]['p_price']} "
                                      .numCurrency
                                      .text
                                      .color(redColor)
                                      .fontFamily(bold)
                                      .size(16)
                                      .make(),
                                  10.heightBox
                                ],
                              )
                                  .box
                                  .white
                                  .margin(EdgeInsets.symmetric(horizontal: 4))
                                  .roundedSM
                                  .outerShadowSm
                                  .padding(EdgeInsets.all(12))
                                  .make()
                                  .onTap(() {
                                    controller.checkIffav(data[index]);
                                Get.to(() => ItemDetails(
                                    title: "${data[index]['p_name']}",data: data[index],));
                              });
                            }))
                  ],
                ),
              );
            }
          },
        ));
  }
}
    // return bgWidget(
    //     child: Column(
    //   children: [
    //     AppBar(
    //       iconTheme: IconThemeData(color: whiteColor),
    //       backgroundColor: Colors.transparent,
    //       title: title!.text.fontFamily(bold).white.make(),
    //     ),
    //     StreamBuilder(
    //       stream: FirestoreServices.getProducts(title),
    //       builder: (BuildContext context, AsyncSnapshot snapshots) {
    //         if (!snapshots.hasData) {
    //           return Center(
    //             child: loadingIndicator(),
    //           );
    //         }
    //          else if (snapshots.data!.docs.isEmpty) {
    //           return Center(
    //             child: "No Product found".text.color(darkFontGrey).make(),
    //           );
    //         } 
    //         else {
    //           var data = snapshots.data!.docs;
    //           return Container(
    //             child: Column(
    //               children: [
    //                 // AppBar(
    //                 //   iconTheme: IconThemeData(color: whiteColor),
    //                 //   backgroundColor: Colors.transparent,
    //                 //   title: title!.text.fontFamily(bold).white.make(),
    //                 // ),
    //                 Column(
    //                   // crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: [
    //                     SingleChildScrollView(
    //                       // physics: BouncingScrollPhysics(),
    //                       scrollDirection: Axis.horizontal,
    //                       child: Row(
    //                         children: List.generate(
    //                             controller.subcat.length,
    //                             (index) => "${controller.subcat[index]}"
    //                                 .text
    //                                 .size(12)
    //                                 .fontFamily(semibold)
    //                                 .color(darkFontGrey)
    //                                 .makeCentered()
    //                                 .box
    //                                 .white
    //                                 .roundedSM
    //                                 .size(120, 50)
    //                                 .margin(EdgeInsets.symmetric(horizontal: 4))
    //                                 .make()),
    //                       ),
    //                     ),

    //                     // Expanded(
    //                     //   child: GridView.builder(
    //                     //     shrinkWrap: true,
    //                     //     itemCount: 6,
    //                     //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    //                     //    itemBuilder: (context , index) {
    //                     //     return Container(

    //                     //     );
    //                     //   }))
    //                   ],
    //                 ),
    //                 20.heightBox,
    //                 Expanded(
    //                     child: GridView.builder(
    //                         physics: BouncingScrollPhysics(),
    //                         shrinkWrap: true,
    //                         itemCount: data.length,
    //                         gridDelegate:
    //                             SliverGridDelegateWithFixedCrossAxisCount(
    //                                 crossAxisCount: 2,
    //                                 mainAxisExtent: 250,
    //                                 mainAxisSpacing: 8,
    //                                 crossAxisSpacing: 8),
    //                         itemBuilder: (context, index) {
    //                           return Column(
    //                             crossAxisAlignment: CrossAxisAlignment.start,
    //                             children: [
    //                               Image.network(
    //                                 data[index]['p_img'],
    //                                 height: 150,
    //                                 width: 150,
    //                                 fit: BoxFit.cover,
    //                               ),
    //                               "${data[index]['p_name']}"
    //                                   .text
    //                                   .fontFamily(semibold)
    //                                   .color(darkFontGrey)
    //                                   .make(),
    //                               10.heightBox,
    //                               "${data[index]['p_price']} ".numCurrency
    //                                   .text
    //                                   .color(redColor)
    //                                   .fontFamily(bold)
    //                                   .size(16)
    //                                   .make(),
    //                               10.heightBox
    //                             ],
    //                           )
    //                               .box
    //                               .white
    //                               .margin(EdgeInsets.symmetric(horizontal: 4))
    //                               .roundedSM
    //                               .outerShadowSm
    //                               .padding(EdgeInsets.all(12))
    //                               .make()
    //                               .onTap(() {
    //                             Get.to(() => ItemDetails(title: "${data[index]['p_name']}"));
    //                           });
    //                         }))
    //               ],
    //             ),
    //           );
    //         }
    //       },
    //     )
    //   ],
    // ));
//   }
// }