import 'package:ecommerce_peoject/const/list.dart';
import 'package:ecommerce_peoject/views/profile_screen/components/details_card.dart';
import 'package:ecommerce_peoject/widgets_common/bg_widgwt.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_peoject/const/consts.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: SafeArea(
        child: Column(
          children: [
            Align(
                alignment: Alignment.topRight,
                child: Icon(
                  Icons.edit,
                  color: whiteColor,
                ))
              ..onTap(() {}),
            Container(
              // padding: EdgeInsets.all(5),
              child: Row(
                children: [
                  Image.asset(
                    imgProfile2,
                    width: 100,
                    fit: BoxFit.cover,
                  ).box.roundedFull.clip(Clip.antiAlias).make(),
                  10.widthBox,
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "Dummy User".text.fontFamily(semibold).white.make(),
                      "customer@example.com".text.white.make(),
                    ],
                  )),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        side: BorderSide(color: whiteColor)),
                    onPressed: () {},
                    child: "logout".text.fontFamily(semibold).white.make(),
                  ),
                ],
              ),
            ),
            5.heightBox,
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              detailsCard(count: "00",title: "in your cart",width: context.screenWidth/3.2),
              detailsCard(count: "32",title: "in your wishlist",width: context.screenWidth/3.2),
              detailsCard(count: "600",title: "in your orders",width: context.screenWidth/3.2)
            ],
           ),
           ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return Divider(
                color: lightGrey,
              );

            },
            itemCount: profieButtonList.length,
           itemBuilder: (BuildContext context ,int index){
            return ListTile(
              leading: Image.asset(profileButtonIcon[index],width: 22,),
              title: profieButtonList[index].text.fontFamily(semibold).color(darkFontGrey).make(),
            ) ;

           },
           ).box.white.rounded.margin(EdgeInsets.all(12)).padding(EdgeInsets.symmetric(horizontal: 16)).shadowSm.make().box.color(redColor).make()
          ],
        ),
      ),
    );
  }
}
//  child: Column(
//         body: SafeArea(child: Container(
//           padding: EdgeInsets.all(8),
//           child: Row(
//             children: [
//               Image.asset(imgProfile2,width: 130, fit: BoxFit.cover,).box.make(),
//             ],

//           ),)),
//       )