

import 'package:ecommerce_peoject/const/consts.dart';
import 'package:ecommerce_peoject/const/list.dart';
import 'package:ecommerce_peoject/widgets_common/applogo.dart';
import 'package:ecommerce_peoject/widgets_common/bg_widgwt.dart';
import 'package:ecommerce_peoject/widgets_common/custom_textfild.dart';
import 'package:ecommerce_peoject/widgets_common/out_button.dart';
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


   @override
  Widget build(BuildContext context) 
  {
    return bgWidget(
      
      child: Container(
        
        height: double.infinity,
        width: double.infinity,
        child: Column(children: [
          
          (context.screenHeight*0.06).heightBox,
          applogowidget(),
          8.heightBox,
          "Signup to eMart".text.fontFamily(bold).white.size(18).make(),
          8.heightBox,


          Column(
            children: [
              customTextFild(hint: nameHint,title: name),
              customTextFild(hint: emainHint,title: email),
              customTextFild(hint: passwordHint,title: password),
              customTextFild(hint: passwordHint,title: retypePassword),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(onPressed: (){}, child: forgetPass.text.make())),
        
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
                        child: RichText(text: TextSpan(
                          children: [
                            TextSpan(text: "I agree to the" , style: TextStyle(
                              fontFamily: regular,
                              color: fontGrey,
                            )),
                            TextSpan(text: termAndCond , style: TextStyle(
                              fontFamily: regular,
                              color: redColor,
                            )),
                            TextSpan(text: "&" , style: TextStyle(
                              fontFamily: regular,
                              color: fontGrey,
                            )),
                            TextSpan(text: privacyPolicy , style: TextStyle(
                              fontFamily: regular,
                              color: redColor,
                            )
                            )
                        
                          ]
                        )
                        ,)
                      )
                  ],
                ),
                5.heightBox,

                ourButton(
                  color: ischeck ==true? redColor :lightGrey,title: signup ,textColor: whiteColor,onPress: (){}
                ).box.width(context.screenWidth-60).make(),
                RichText(text: TextSpan(
                  children: [
                    TextSpan(
                      children: [
                        TextSpan(
                          text: alreadyHaveAccount,
                          style: TextStyle(
                            fontFamily: bold,
                            color: fontGrey
                          )
                        ),
                        TextSpan(
                          text: login,
                          style: TextStyle(
                            fontFamily: bold,
                            color: redColor,
                          )
                        ),

                        

                        
                      ]
                    )
                  ]
                ),
                ).onTap(() {
                          Get.back();
                        })



            ],
          ).box.white.rounded.padding(EdgeInsets.all(16)).width(context.screenWidth-60).shadowSm.make(),

          
        
      ],)),
    );
  }
}