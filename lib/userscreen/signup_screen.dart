import 'package:e_medicine/const/consts.dart';
import 'package:e_medicine/controller/auth_controller.dart';
import 'package:e_medicine/views/home_screen/home.dart';
import 'package:e_medicine/widgets_common/applogo.dart';
import 'package:e_medicine/widgets_common/bg_widgwt.dart';
import 'package:e_medicine/widgets_common/custom_textfild.dart';
import 'package:e_medicine/widgets_common/out_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool? ischeck = false;

  var controller = Get.put(AuthController());

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordRetypeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Container(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                (context.screenHeight * 0.06).heightBox,
                applogowidget(),
                8.heightBox,
                "Signup to eMart".text.fontFamily(bold).white.size(18).make(),
                8.heightBox,
                Obx(()=>
                   Column(
                    children: [
                      customTextFild(
                          hint: nameHint,
                          title: name,
                          controller: nameController,
                          isPass: false),
                      customTextFild(
                          hint: emainHint,
                          title: email,
                          controller: emailController,
                          isPass: false),
                      customTextFild(
                          hint: passwordHint,
                          title: password,
                          controller: passwordController,
                          isPass: true),
                      customTextFild(
                          hint: passwordHint,
                          title: retypePassword,
                          controller: passwordRetypeController,
                          isPass: true),
                      Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                              onPressed: () {}, child: forgetPass.text.make())),
                      Row(
                        children: [
                          Checkbox(
                            activeColor: redColor,
                            checkColor: redColor,
                            value: ischeck,
                            onChanged: (newValue) {
                              setState(() {
                                ischeck = newValue;
                              });
                            },
                          ),
                          5.heightBox,
                          Expanded(
                              child: RichText(
                            text:const TextSpan(children: [
                              TextSpan(
                                  text: "I agree to the",
                                  style: TextStyle(
                                    fontFamily: regular,
                                    color: fontGrey,
                                  )),
                              TextSpan(
                                  text: termAndCond,
                                  style: TextStyle(
                                    fontFamily: regular,
                                    color: redColor,
                                  )),
                              TextSpan(
                                  text: "&",
                                  style: TextStyle(
                                    fontFamily: regular,
                                    color: fontGrey,
                                  )),
                              TextSpan(
                                  text: privacyPolicy,
                                  style: TextStyle(
                                    fontFamily: regular,
                                    color: redColor,
                                  ))
                            ]),
                          ))
                        ],
                      ),
                      5.heightBox,
                     controller.isloading.value? CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(redColor),

                     ): ourButton(
                          color: ischeck == true ? redColor : lightGrey,
                          title: signup,
                          textColor: whiteColor,
                          onPress: () async {
                            if (ischeck != false) {
                              controller.isloading(true);
                              try {
                                print('--__---');
                                await controller.SignupMethod(
                                        context: context,
                                        email: emailController.text.strip0x,
                                        password: passwordController.text)
                                    .then((Value) {
                                      print('-_- value caught');
                                      print('cu : ${auth.currentUser}');
                                  return controller.storeUserData(
                                    email: emailController.text,
                                    password: passwordController.text,
                                    name: nameController.text,
                                  );
                                }).then((value) {
                                  VxToast.show(context, msg: loggedin);
                              
                                  Get.offAll(() => Home());
                                });
                              } catch (e) {
                                auth.signOut();
                                VxToast.show(context, msg: '-_- 12${e.toString()}');
                                controller.isloading(false);
                              }
                            }
                          }).box.width(context.screenWidth - 60).make(),
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(children: [
                            TextSpan(
                                text: alreadyHaveAccount,
                                style:
                                    TextStyle(fontFamily: bold, color: fontGrey)),
                            TextSpan(
                                text: login,
                                style: TextStyle(
                                  fontFamily: bold,
                                  color: redColor,
                                )),
                          ])
                        ]),
                      ).onTap(() {
                        Get.back();
                      })
                    ],
                  )
                      .box
                      .white
                      .rounded
                      .padding(EdgeInsets.all(16))
                      .width(context.screenWidth - 60)
                      .shadowSm
                      .make(),
                ),
              ],
            ),
          )),
    );
  }
}
