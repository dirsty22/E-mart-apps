import 'package:e_medicine/const/consts.dart';

Widget customTextFild({String? title, String? hint , controller, isPass}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start ,
    children: [
      title!.text.color(redColor).fontFamily(semibold).size(16).make(),
      5.heightBox,
      TextFormField(
        obscureText: isPass,
        controller: controller,
        decoration: InputDecoration(
          hintStyle: TextStyle(fontFamily:semibold,color: fontGrey ),
          hintText: hint,
          isDense: true,
          fillColor: lightGrey,
          filled: true,
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: textfieldGrey))

        ),

      ),
      5.heightBox,
    ],
  );
}