import 'package:e_medicine/const/consts.dart';
import 'package:e_medicine/controller/cart_controller.dart';
import 'package:e_medicine/views/cart_screen/payment_method.dart';
import 'package:e_medicine/widgets_common/custom_textfild.dart';
import 'package:e_medicine/widgets_common/out_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShipingDetails extends StatelessWidget {
  const ShipingDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<CartController>();
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: "Shiping Info ".text.fontFamily(semibold).color(darkFontGrey).make(),
      ),
      bottomNavigationBar: SizedBox(
        height: 50
        ,
        child: ourButton(
          onPress: () {
            if(controller.addressController.text.length >10) {
              Get.to(() => PaymentMethods());
            }
            else{
              VxToast.show(context, msg: "Please fill the form");
            }
          },
        
          color: redColor,
          textColor: whiteColor,
          title: "Continue",
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(children: [
            customTextFild(hint: "Address",isPass: false,title: "Address",controller: controller.addressController),
            customTextFild(hint: "City",isPass: false,title: "City",controller: controller.cityController),
            customTextFild(hint: 'State',isPass: false,title: "State",controller: controller.stateController),
            customTextFild(hint: "Phone",isPass: false,title: "Phone",controller: controller.phoneController),
           
          ],),
        ),
      ),
    );
  }
}