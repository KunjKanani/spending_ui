import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class GetAnimationController extends GetxController{
  static AnimationController _animationController;
  RxBool showMode = false.obs;
  var time = 0.02.obs;

  AnimationController get animationController => _animationController;

  set animationController(AnimationController value) {
    _animationController = value;
    update();
  }

  void setShowMode(val){
    showMode.value = val;
  }
}