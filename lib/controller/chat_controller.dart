import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_medicine/const/consts.dart';
import 'package:e_medicine/controller/home_controller.dart';
import 'package:get/get.dart';

class ChatsController extends GetxController {
  @override
  void onInit() {
    getChatId();
    // TODO: implement onInit
    super.onInit();
  }

  var chats = firestore.collection(chatsCollection);
  var frieName = Get.arguments[0];
  var frieId = Get.arguments[1];

  var senderName = Get.find<HomeController>().username;
  var currentId = currentUser!.uid;

  var msgController = TextEditingController();
  dynamic chatDocId;
  var isLoading = false.obs;

  getChatId() async {
    isLoading(true);
    await chats
        .where('users', isEqualTo: {
          frieId: null,
          currentId: null,
        })
        .limit(1)
        .get()
        .then((QuerySnapshot snapshots) {
          if (snapshots.docs.isNotEmpty) {
            chatDocId = snapshots.docs.single.id;
          } else {
            chats.add({
              'created_on': null,
              'last_msg ': '',
              'users': {frieId: null, currentId: null},
              'toId': frieId,
              'fromId': '',
              'friend_name': frieName,
              'sender_name': senderName,
            }).then((value) {
              chatDocId = value.id;
            });
          }
        });
        isLoading(false);
  }

  sendMsg(String msg) async {
    if (msg.trim().isNotEmpty) {
      chats.doc(chatDocId).update({
        'created_on': FieldValue.serverTimestamp(),
        'last_msg': msg,
        'toId': frieId,
        'fromId': currentId
      });
      chats.doc(chatDocId).collection(messageCollection).doc().set({
        'created_on': FieldValue.serverTimestamp(),
        'msg': msg,
        'uid': currentId,
      });
    }
  }
}
