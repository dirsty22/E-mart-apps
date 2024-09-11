import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_medicine/const/colors.dart';
import 'package:e_medicine/const/styles.dart';
import 'package:e_medicine/services/firestore_services.dart';
import 'package:e_medicine/widgets_common/loading_indicatoe.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MessagesScreen
 extends StatelessWidget {
  const MessagesScreen
  ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "My Message".text.color(darkFontGrey).fontFamily(semibold).make(),
      ),
      body: StreamBuilder(
          stream: FirestoreServices.getAllMessage(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshots) {
            if (!snapshots.hasData) {
              return Center(
                child: loadingIndicator(),
              );
            } else if (snapshots.data!.docs.isEmpty) {
              return "No messages yet!".text.color(darkFontGrey).makeCentered();
            }
            else{
              return Container();
            }
          }),
    );
  }
}