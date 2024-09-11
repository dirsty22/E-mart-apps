import 'package:e_medicine/const/consts.dart';

Widget bgWidget({Widget? child}) {
  return Scaffold(
    body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(imgBackground), fit: BoxFit.fill)),
        child: child),
  );
}
