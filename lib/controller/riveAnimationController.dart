import 'package:get/get.dart';
import 'package:rive/rive.dart';
import 'package:spending_ui/controller/animationController.dart';

class CustomRiveAnimationController extends RiveAnimationController<RuntimeArtboard>{
  GetAnimationController animationController = Get.find();
  LinearAnimationInstance _normalMode;
  RuntimeArtboard _artboard;
  @override
  bool init(RuntimeArtboard artBoard) {
    _artboard = artBoard;
    _normalMode = _artboard.animationByName('GalaxyOnNormalSpeed');
    isActive = true;
    return _artboard != null;
  }
  @override
  void apply(RuntimeArtboard artBoard, double elapsedSeconds) {
    _normalMode.animation.apply(_normalMode.time, coreContext: artBoard);
    _normalMode.advance(animationController.time.value);
  }

}