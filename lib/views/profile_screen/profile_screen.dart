import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_medicine/const/list.dart';
import 'package:e_medicine/controller/auth_controller.dart';
import 'package:e_medicine/controller/profile_controller.dart';
import 'package:e_medicine/order_screen/order_screen.dart';
import 'package:e_medicine/services/firestore_services.dart';
import 'package:e_medicine/userscreen/login_screen.dart';
import 'package:e_medicine/views/chat_screen/messaging_screen.dart';
import 'package:e_medicine/views/profile_screen/components/details_card.dart';
import 'package:e_medicine/views/profile_screen/edit_profile_screen.dart';
import 'package:e_medicine/widgets_common/bg_widgwt.dart';
import 'package:e_medicine/wishlist_screen/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:e_medicine/const/consts.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
    return bgWidget(
        child: Column(
      children: [
        StreamBuilder(
          stream: FirestoreServices.getUser(currentUser!.uid),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshots) {
                
            if (!snapshots.hasData) {
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(redColor),
                ),
              );
            } else {
              var data = snapshots.data!.docs[0];
              return SafeArea(
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.topRight,
                        child: Icon(
                          Icons.edit,
                          color: whiteColor,
                        )).onTap(() {
                      controller.nameController.text = data['name'];
                      // controller.passController.text = data['password'];
                      Get.to(() => EditProfileScreen(
                            data: data,
                          ));
                    }),
                    Container(
                      // padding: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          data['imgeUrl'] == ''
                              ? Image.asset(
                                  imgProfile2,
                                  width: 50,
                                  fit: BoxFit.cover,
                                ).box.roundedFull.clip(Clip.antiAlias).make()
                              : Image.network(
                                  data['imgeUrl'],
                                  width: 50,
                                  fit: BoxFit.cover,
                                ).box.roundedFull.clip(Clip.antiAlias).make(),
                          10.widthBox,
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              "${data['name']}"
                                  .text
                                  .fontFamily(semibold)
                                  .white
                                  .make(),
                              "${data['email']}".text.white.make(),
                            ],
                          )),
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                side: BorderSide(color: whiteColor)
                                ),
                            onPressed: () {},
                            child:
                                "logout".text.fontFamily(semibold).white.make(),
                          ),
                        ],
                      ),
                    ),
                    //  20.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      
                      children: [
                      
                        detailsCard(
                            count: data['cart_count'],
                            title: "in your cart",
                            width: context.screenWidth / 3.2),
                        detailsCard(
                            count: data['wishlist_count'],
                            title: "in your wishlist",
                            width: context.screenWidth / 3.2),
                        detailsCard(
                            count: data['order_count'],
                            title: "in your orders",
                            width: context.screenWidth / 3.2)
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
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          onTap: () {
                            switch (index) {
                              case 0:
                              Get.to(() => OrderScreen());
                                
                                break;
                                case 1: Get.to(()=>WishlistScreen());
                                break;
                                case 2: Get.to(() =>MessagesScreen());
                                break;
                              
                            }
                          },
                          leading: Image.asset(
                            profileButtonIcon[index],
                            width: 22,
                          ),
                          title: profieButtonList[index]
                              .text
                              .fontFamily(semibold)
                              .color(darkFontGrey)
                              .make(),
                        );
                      },
                    )
                        .box
                        .white
                        .rounded
                        .margin(EdgeInsets.all(12))
                        .padding(EdgeInsets.symmetric(horizontal: 16))
                        .shadowSm
                        .make()
                        .box
                        .color(redColor)
                        .make()
                  ],
                ),
              );
            }
          },
        ),
      ],
    ));
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
