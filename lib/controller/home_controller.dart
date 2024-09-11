
import 'package:e_medicine/const/consts.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class HomeController extends GetxController{

  @override
  void onInit() {
    getUsername();
    // TODO: implement onInit
    super.onInit();
  }


  var currentNavIndex =0.obs;

  var username = '';

  getUsername() async{
   var n = await firestore.collection(userCollection).where('id',isEqualTo: currentUser!.uid).get().then((value) {
      if(value.docs.isNotEmpty){
        return value.docs.single['name'];

      }
    });
    username = n;
    print(username);

  } 

}