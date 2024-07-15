import 'package:ecommerce_peoject/const/colors.dart';
import 'package:ecommerce_peoject/userscreen/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      
      
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: darkFontGrey,
          )
        ),
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        
       // useMaterial3: true,
      ),
       home: spalashscreen(),
    );
  }
}

