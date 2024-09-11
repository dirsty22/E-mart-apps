import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_medicine/const/consts.dart';
import 'package:e_medicine/controller/chat_controller.dart';
import 'package:e_medicine/services/firestore_services.dart';
import 'package:e_medicine/views/chat_screen/components/sender_bubble.dart';
import 'package:e_medicine/widgets_common/loading_indicatoe.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ChatsController());
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: "${controller.frieName}".text.fontFamily(semibold).color(darkFontGrey).make(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Obx(
              () => controller.isLoading.value
                  ? Center(
                      child: loadingIndicator(),
                    )
                  : Expanded(
                      child: Container(
                          // color: Colors.teal,
                          child: StreamBuilder(
                              stream: FirestoreServices.getChatMessages(
                                  controller.chatDocId.toString()),
                              builder: (BuildContext context,
                                  AsyncSnapshot<QuerySnapshot> snapshots) {
                                if (!snapshots.hasData) {
                                  return Center(
                                    child: loadingIndicator(),
                                  );
                                } else if (snapshots.data!.docs.isEmpty) {
                                  return Center(
                                    child: "Send a message...."
                                        .text
                                        .color(darkFontGrey)
                                        .make(),
                                  );
                                } else {
                                  return ListView(
                                    children: snapshots.data!.docs.mapIndexed((currentValue, index) {
                                      var data =snapshots.data!.docs[index];
                                      return Align(
                                        alignment: data['uid'] == currentUser!.uid ? Alignment.centerRight : Alignment.centerLeft,
                                        child: senderBubble(data));
                                    },).toList(),

                                      // senderBubble(),
                                      // senderBubble(),
                                    
                                  );
                                }
                              }))),
            ),
            10.heightBox,
            Row(
              children: [
                Expanded(
                    child: TextFormField(
                  controller: controller.msgController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: textfieldGrey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: textfieldGrey),
                    ),
                    hintText: "Type a message",
                  ),
                )),
                IconButton(
                    onPressed: () {
                      controller.sendMsg(controller.msgController.text);
                      controller.msgController.clear();
                    },
                    icon: Icon(
                      Icons.send,
                      color: Colors.blue,
                    ))
              ],
            )
                .box
                .height(70)
                .padding(EdgeInsets.all(12))
                .margin(EdgeInsets.only(bottom: 8))
                .make()
          ],
        ),
      ),
    );
  }
}
