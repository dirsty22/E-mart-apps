import 'package:ecommerce_peoject/const/list.dart';
import 'package:ecommerce_peoject/views/category_screen/category_details.dart';
import 'package:ecommerce_peoject/widgets_common/bg_widgwt.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_peoject/const/consts.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Container(
      child: Column(
        children: [
          AppBar(
            iconTheme: IconThemeData(
              color: whiteColor,
            ),
            backgroundColor: Colors.transparent,
            title: categories.text.fontFamily(bold).color(whiteColor).make(),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              // height: 500,
              child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: 9,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      mainAxisExtent: 200),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Image.asset(
                          categoryImages[index],
                          height: 100,
                          width: 200,
                          fit: BoxFit.fill,
                        ),
                        10.heightBox,
                        categoriesList[index].text.color(darkFontGrey).make(),
                      ],
                    )
                        .box
                        .white
                        .roundedSM
                        .clip(Clip.antiAlias)
                        .outerShadowSm
                        .make()
                        .onTap(() {
                      Get.to(() => CategoryDetails(
                            title: categoriesList[index],
                          ));
                    });
                  }),
            ),
          )

          // Title(color: color, child: child)
        ],
      ),
    )
        // child: Scaffold(
        //   appBar: AppBar(
        //     title: categories.text.fontFamily(bold).color(whiteColor).make(),
        //   ),
        // )
        );
  }
}
