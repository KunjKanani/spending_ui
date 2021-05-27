import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCardBtn extends StatelessWidget {
  const AddCardBtn({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      height: 60,
      minWidth: Get.size.width - 60,
      child: Text("Add Card", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
          side: BorderSide(
        color: Colors.grey.shade100,
        width: 2,
      )),
    );
  }
}
