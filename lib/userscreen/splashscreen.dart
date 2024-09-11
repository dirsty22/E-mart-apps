import 'package:e_medicine/const/consts.dart';
import 'package:e_medicine/const/images.dart';
import 'package:e_medicine/userscreen/login_screen.dart';
import 'package:e_medicine/views/home_screen/home.dart';
import 'package:e_medicine/widgets_common/applogo.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
      // Get.to(()=> const loginscreen());
      auth.authStateChanges().listen((User? user){
        if(user == null && mounted){
          Get.to(()=> const loginscreen());
        }else{
          Get.to(()=> const Home());
        }
        
      });

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