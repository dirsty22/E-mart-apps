import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_medicine/const/colors.dart';
import 'package:e_medicine/const/consts.dart';
import 'package:e_medicine/services/firestore_services.dart';
import 'package:e_medicine/widgets_common/loading_indicatoe.dart';
import 'package:flutter/material.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            "My wishlist".text.color(darkFontGrey).fontFamily(semibold).make(),
      ),
      body: StreamBuilder(
          stream: FirestoreServices.getWishlists(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshots) {
            if (!snapshots.hasData) {
              return Center(
                child: loadingIndicator(),
              );
            } else if (snapshots.data!.docs.isEmpty) {
              return "No wishlist yet!".text.color(darkFontGrey).makeCentered();
            } else {
              var data = snapshots.data!.docs;
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            leading: Image.network(
                              "${data[index]['p_img'][0]}",
                              width: 120,
                              fit: BoxFit.cover,
                            ),
                            title: "${data[index]['p_name']} "
                                .text
                                .fontFamily(semibold)
                                .size(16)
                                .make(),
                            subtitle: "${data[index]['p_price']}"
                                .numCurrency
                                .text
                                .fontFamily(semibold)
                                .color(redColor)
                                .make(),
                            trailing: Icon(
                              Icons.favorite,
                              color: redColor,
                            ).onTap(() {
                              // FirestoreServices.deletDocument(data[index].id);
                              firestore
                                  .collection(productsCollection)
                                  .doc(data[index].id)
                                  .set({
                                'p_wishlist':
                                    FieldValue.arrayRemove([currentUser!.uid])
                              }, SetOptions(merge: true));
                            }),
                          ); 
                        }),
                  ),
                ],
              );
            }
          }),
    );
  }
}
