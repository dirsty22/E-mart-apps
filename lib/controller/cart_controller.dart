import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_medicine/const/consts.dart';
import 'package:e_medicine/controller/home_controller.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var totalP = 0.obs;
  calculate(data) {
    totalP.value=0;
    for(var i =0 ; i<data.length; i++){
      totalP.value = totalP.value + int.parse(data[i]['tprice'].toString());
    }
  }

  var addressController = TextEditingController();
  var cityController = TextEditingController();
  var stateController = TextEditingController();
  var phoneController = TextEditingController();
   

  var paymentIndex =0.obs ;
  late dynamic produtSnapshot ;
  var products =[];
  var placeOrder = false.obs;

  changePaymentIndex (index) {
    paymentIndex.value = index ;
  }

  placeMeOrdeer({required orderPaymentMethods,required totalAmount}) async{
    placeOrder(true);
    await getProductDetails();
    await firestore.collection(ordersCollection).doc().set({
      'order_code ' : "233981237",
      'order_date' : FieldValue.serverTimestamp(),
      'order_by' :currentUser!.uid,
      "order_by_name" : Get.find<HomeController>().username,
      'order_by_email' :currentUser!.email,
      'order_by_address' : addressController.text,
      'order_by_state' : stateController.text,
      'order_by_city' :cityController.text,
      'order_by_phone' : phoneController.text,
      'shipng_method' :"Home Delivery",
      'payment_method' : orderPaymentMethods,
      'order_placed' : true,
      'order_confirmed' : false,
      'order_delivered' : false,
      'order_on_delibery' : false,
      'total_amount': totalAmount,
      'orders' : FieldValue.arrayUnion(products),
    });
    placeOrder(false);

  }

  getProductDetails() {
    products.clear();
    for(var i=0;i<produtSnapshot.length ;i++)
    {
      products.add({
        'color' : produtSnapshot[i]['color'],
        'vendor_id' : produtSnapshot[i]['vendor_id'],
        'tprice' : produtSnapshot[i]['tprice'],
        'img' : produtSnapshot[i]['img'],
        'qty' : produtSnapshot[i]['qty'],
        'title' : produtSnapshot[i]['title'],
      });

    }
    // print(products);
  }

  clearCart() {
    for(var i=0;i<produtSnapshot.length; i++){
      firestore.collection(cartCollection).doc(produtSnapshot[i].id).delete();
    }
  }

}