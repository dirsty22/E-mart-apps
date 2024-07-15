import 'package:ecommerce_peoject/const/consts.dart';
import 'package:ecommerce_peoject/const/list.dart';
import 'package:ecommerce_peoject/views/home_screen/home.dart';
import 'package:ecommerce_peoject/userscreen/signup_screen.dart';
import 'package:ecommerce_peoject/widgets_common/applogo.dart';
import 'package:ecommerce_peoject/widgets_common/bg_widgwt.dart';
import 'package:ecommerce_peoject/widgets_common/custom_textfild.dart';
import 'package:ecommerce_peoject/widgets_common/out_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class loginscreen extends StatelessWidget {
  const loginscreen({super.key});

  @override
  Widget build(BuildContext context) 
  {
    return bgWidget(
      
      child: Container(
        
        height: double.infinity,
        width: double.infinity,
        child: Column(children: [
          
          (context.screenHeight*0.07).heightBox,
          applogowidget(),
          10.heightBox,
          "Login to eMart".text.fontFamily(bold).white.size(18).make(),
          10.heightBox,


          Column(
            children: [
              customTextFild(hint: emainHint,title: email),
              customTextFild(hint: passwordHint,title: password),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(onPressed: (){}, child: forgetPass.text.make())),
                5.heightBox,
                ourButton(
                  color: redColor,title: login ,textColor: whiteColor,onPress: (){
                    Get.to(() => Home());

                  }
                ).box.width(context.screenWidth-60).make(),

                5.heightBox,
                cresteNewAccount.text.color(fontGrey).make(),
                5.heightBox,

                ourButton(
                  color: lightGolgen,title: signup ,textColor: redColor,onPress: (){
                    Get.to(() =>  SignupScreen());
                  }
                ).box.width(context.screenWidth-60).make(),


                10.heightBox,
                loginWith.text.color(fontGrey).make(),
                5.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, (index) =>
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundColor: lightGrey,
                      radius: 25,
                      child: Image.asset(socialIconList[index],
                      width: 30,
                      ),
                    ),
                  )),
                )

            ],
          ).box.white.rounded.padding(EdgeInsets.all(16)).width(context.screenWidth-60).shadowSm.make(),

          
        
      ],)),
    );
  }
}
