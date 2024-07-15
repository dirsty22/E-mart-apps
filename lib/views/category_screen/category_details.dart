import 'package:ecommerce_peoject/const/consts.dart';
import 'package:ecommerce_peoject/views/category_screen/item_details.dart';
import 'package:ecommerce_peoject/widgets_common/bg_widgwt.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CategoryDetails extends StatelessWidget {
  final String? title;
  const CategoryDetails({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Container(
      child: Column(
        children: [
          AppBar(
            iconTheme: IconThemeData(
              color: whiteColor
            ),
            backgroundColor: Colors.transparent,
            title: title!.text.fontFamily(bold).white.make(),
          ),
          Column(
            children: [
              SingleChildScrollView(
                // physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                      6,
                      (index) => "Baby Clothing"
                          .text
                          .size(14)
                          .fontFamily(semibold)
                          .color(darkFontGrey)
                          .makeCentered()
                          .box
                          .white
                          .roundedSM
                          .size(120, 60)
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
                  itemCount: 6,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 250,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8),
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          imgP1,
                          height: 150,
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                        "Laptop 4GB/64GB"
                            .text
                            .fontFamily(semibold)
                            .color(darkFontGrey)
                            .make(),
                        10.heightBox,
                        "\$600 "
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
                        .make().onTap((){
                          Get.to(()=>ItemDetails(title: "Dummy item"));
                        });
                  }))
        ],
      ),
    ));
  }
}
