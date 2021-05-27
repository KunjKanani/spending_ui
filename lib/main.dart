import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spending_ui/controller/animationController.dart';
import 'package:spending_ui/settings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: BindingsBuilder(()=>GetAnimationController()),
      home: Setting(),
      theme: ThemeData(
        fontFamily: "Poppins"
      ),
    );
  }
}