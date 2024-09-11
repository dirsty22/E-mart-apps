import 'dart:io';

import 'package:e_medicine/const/consts.dart';
import 'package:e_medicine/const/images.dart';
import 'package:e_medicine/controller/profile_controller.dart';
import 'package:e_medicine/widgets_common/bg_widgwt.dart';
import 'package:e_medicine/widgets_common/custom_textfild.dart';
import 'package:e_medicine/widgets_common/out_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatelessWidget {
  final dynamic data;
  const EditProfileScreen({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();
    controller.nameController.text = data['name'];
    // controller.passController.text=data['password'];
    return bgWidget(
        child: Column(
      children: [
        AppBar(
          iconTheme: IconThemeData(color: whiteColor),
          backgroundColor: Colors.transparent,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Obx(
            () => Column(
              children: [
                data['imgeUrl'] == '' && controller.profileImgPath.isEmpty
                    ? Image.asset(
                        imgProfile2,
                        width: 100,
                        fit: BoxFit.cover,
                      ).box.roundedFull.clip(Clip.antiAlias).make()
                    : data['imgeUrl'] != '' && controller.profileImgPath.isEmpty
                        ? Image.network(
                            data['imgeUrl'],
                            width: 100,
                            fit: BoxFit.cover,
                          ).box.roundedFull.clip(Clip.antiAlias).make()
                        : Image.file(
                            File(controller.profileImgPath.value),
                            width: 100,
                            fit: BoxFit.cover,
                          ).box.roundedFull.clip(Clip.antiAlias).make(),
                10.heightBox,
                ourButton(
                    color: redColor,
                    onPress: () {
                      controller.changeImage(context);
                    },
                    textColor: whiteColor,
                    title: "change"),
                Divider(),
                10.heightBox,
                customTextFild(
                  controller: controller.nameController,
                  hint: nameHint,
                  title: name,
                  isPass: false,
                ),
                customTextFild(
                  controller: controller.oldpassController,
                  hint: passwordHint,
                  title: oldpass,
                  isPass: true,
                ),
                10.heightBox,
                customTextFild(
                  controller: controller.newpassController,
                  hint: passwordHint,
                  title: newpass,
                  isPass: true,
                ),
                10.heightBox,
                controller.isloading.value
                    ? CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(redColor),
                      )
                    : SizedBox(
                        width: context.screenWidth - 60,
                        child: ourButton(
                            color: redColor,
                            onPress: () async {
                              controller.isloading(true);

                              if (controller.profileImgPath.value.isEmpty) {
                                await controller.uploadProfileImage();
                              } else {
                                controller.profileImageLink = data['imgeUrl'];
                              }

                              if (data['password'] ==
                                  controller.oldpassController.text) {

                                    await controller.changeAuthPassword(
                                      email:  data['email'],
                                      password: controller.oldpassController.text,
                                      newpassword: controller.newpassController.text,
                                    
                                    );
                                await controller.updateprofile(
                                    imgUrl: controller.profileImageLink,
                                    name: controller.nameController.text,
                                    password:
                                        controller.newpassController.text);
                                VxToast.show(context, msg: "updated");
                              }else{
                                VxToast.show(context, msg: "wrong old password");
                                controller.isloading(false);
                              }

                              // await controller.uploadProfileImage(

                              // );
                            },
                            textColor: whiteColor,
                            title: "Save")),
              ],
            )
                .box
                .white
                .shadowSm
                .padding(EdgeInsets.all(16))
                .margin(EdgeInsets.only(top: 50, left: 12, right: 12))
                .rounded
                .make(),
          ),
        ),
      ],
    ));
  }
}
