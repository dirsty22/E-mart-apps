import 'package:e_medicine/const/list.dart';
import 'package:e_medicine/views/component/featured_button.dart';
import 'package:e_medicine/widgets_common/home_button.dart';
import 'package:flutter/material.dart';
import 'package:e_medicine/const/consts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(12),

        // color: Colors.black,
        color: lightGrey,
        width: context.screenWidth,
        height: context.screenHeight,
        child: SafeArea(
            child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 60,
              color: lightGrey,
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: whiteColor,
                  hintText: searchanything,
                  hintStyle: TextStyle(color: textfieldGrey),
                ),
              ),
            ),
            7.heightBox,
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    VxSwiper.builder(
                  aspectRatio: 16 / 9,
                  autoPlay: true,
                  height: 100,
                  enableInfiniteScroll: true,
                  itemCount: sliderList.length,
                  itemBuilder: (context, index) {
                    return Image.asset(
                      sliderList[index],
                      fit: BoxFit.fill,
                    )
                        .box
                        .rounded
                        .clip(Clip.antiAlias)
                        .margin(EdgeInsets.symmetric(horizontal: 3))
                        .make();
                  },
                ),
                9.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                      2,
                      (index) => homeButtons(
                            height: context.screenHeight * 0.10,
                            width: context.screenWidth / 2.5,
                            icon: index == 0 ? icTodaysDeal : icFlashDeal,
                            title: index == 0 ? todayDeal : flashsale,
                          )),
                ),
                9.heightBox,
                VxSwiper.builder(
                  aspectRatio: 16 / 9,
                  autoPlay: true,
                  height: 100,
                  enableInfiniteScroll: true,
                  itemCount: secondSliderList.length,
                  itemBuilder: (context, index) {
                    return Image.asset(
                      secondSliderList[index],
                      fit: BoxFit.fill,
                    )
                        .box
                        .rounded
                        .clip(Clip.antiAlias)
                        .margin(EdgeInsets.symmetric(horizontal: 3))
                        .make();
                  },
                ),
                
                9.heightBox,
                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                      3,
                      (index) => homeButtons(
                            height: context.screenHeight * 0.10,
                            width: context.screenWidth / 3.5,
                            icon: index == 0 ? icTopCategories : index == 1 ? icBrands : icTopSeller,
                            title: index == 0 ? topCategories : index == 1 ? brand : topSellers,
                          )),
                ),
                
                14.heightBox,
                Align(alignment: Alignment.centerLeft,
                  child: featuredCategories.text.color(darkFontGrey).size(18).fontFamily(semibold).make()),
                12.heightBox,

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(3, (index)=> Column(
                      children: [
                        featuredButton(
                          icon: featuredImages1[index],title: freaturedTitles1[index],
                        ),
                        10.heightBox,
                        featuredButton(icon: featuredImages2[index],title: freaturedTitles2[index],),
                  
                      ],
                    ),
                    ).toList(),
                  ),
                ),

                15.heightBox,
                Container(
                  padding: EdgeInsets.all(12),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: redColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      featuredProduct.text.white.fontFamily(bold).size(18).make(),
                      10.heightBox,
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(6, (index) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start ,
                            children: [
                              Image.asset(imgP1,width: 150,fit: BoxFit.cover,),
                              10.heightBox,
                              "Laptop 4GB/64GB".text.fontFamily(semibold).color(darkFontGrey).make(),
                              10.heightBox,
                              "\$600 ".text.color(redColor).fontFamily(bold).size(16).make(),
                            ],
                        
                          ).box.white.margin(EdgeInsets.symmetric(horizontal: 4)).roundedSM.padding(EdgeInsets.all(8)).make()
                          ),
                        ),
                      )

                    ],
                  ),
                ),

                //third swiper
                20.heightBox,
                VxSwiper.builder(
                  aspectRatio: 16 / 9,
                  autoPlay: true,
                  height: 100,
                  enableInfiniteScroll: true,
                  itemCount: secondSliderList.length,
                  itemBuilder: (context, index) {
                    return Image.asset(
                      secondSliderList[index],
                      fit: BoxFit.fill,
                    )
                        .box
                        .rounded
                        .clip(Clip.antiAlias)
                        .margin(EdgeInsets.symmetric(horizontal: 3))
                        .make();
                  },
                ),
                20.heightBox,
                GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 6,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 8, crossAxisSpacing: 8,mainAxisExtent: 280), 
                itemBuilder: (context, index) {
                  
                  return Column(
                            crossAxisAlignment: CrossAxisAlignment.start ,
                            children: [
                              Image.asset(
                                imgP1,
                                height: 150,
                                width: 150,fit: BoxFit.cover,),
                              Spacer(),
                              "Laptop 4GB/64GB".text.fontFamily(semibold).color(darkFontGrey).make(),
                              10.heightBox,
                              "\$600 ".text.color(redColor).fontFamily(bold).size(16).make(),
                              10.heightBox
                            ],
                        
                          ).box.white.margin(EdgeInsets.symmetric(horizontal: 4)).roundedSM.padding(EdgeInsets.all(12)).make();
                })
                
                
                  ],
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
