import 'package:ecommerce_peoject/const/colors.dart';
import 'package:ecommerce_peoject/const/consts.dart';
import 'package:ecommerce_peoject/const/images.dart';
import 'package:ecommerce_peoject/userscreen/login_screen.dart';
import 'package:ecommerce_peoject/widgets_common/applogo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class spalashscreen extends StatefulWidget {
  const spalashscreen({super.key});

  @override
  State<spalashscreen> createState() => _spalashscreentState();
}

class _spalashscreentState extends State<spalashscreen> {

  changeScreen(){
     Future.delayed(Duration(seconds: 3), () {
      Get.to(()=> const loginscreen());

    });
  }

  @override
  void initState() {
    changeScreen();
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: Center(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset(icSplashBg,width: 300,)),
              
              20.heightBox,
              applogowidget(),
              10.heightBox,         
          ],
        ),
      ),
    );
  }
}