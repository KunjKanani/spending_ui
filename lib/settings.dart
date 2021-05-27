import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';
import 'package:spending_ui/controller/animationController.dart';
import 'package:spending_ui/controller/riveAnimationController.dart';
import 'package:spending_ui/utils/helpers.dart';
import 'package:spending_ui/views/homepage.dart';

class Setting extends StatefulWidget {
  const Setting({Key key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  Artboard _riveArtBoard;
  CustomRiveAnimationController _riveAnimationController;

  @override
  void initState() {
    super.initState();
    rootBundle.load('assets/galaxy.riv').then((bytes) {
      final file = RiveFile.import(bytes);
      _riveAnimationController = CustomRiveAnimationController();
      setState(() {
        _riveArtBoard = file.mainArtboard
          ..addController(_riveAnimationController);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<GetAnimationController>(
        init: GetAnimationController(),
        builder: (controller) => Container(
          width: Get.size.width,
          child: Stack(
            children: [
              _riveArtBoard == null
                  ? Container()
                  : RotatedBox(
                      quarterTurns: 1,
                      child: Container(
                        height: Get.size.width,
                        width: Get.size.height,
                        color: Colors.teal,
                        child: Rive(
                          artboard: _riveArtBoard,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
              Align(
                alignment: Alignment.centerLeft,
                child: RotatedBox(
                  quarterTurns: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Let's show down the Universe",
                          style: GoogleFonts.pattaya(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 22,
                            ),
                          ),
                        ),
                        emptyHorizontalBox(width: 10),
                        CupertinoSwitch(
                          activeColor: Colors.deepPurple.shade900,
                          value: controller.showMode.value,
                          onChanged: (val) {
                            controller.showMode(val);
                            val
                                ? controller.time.value = 0.001
                                : controller.time.value = 0.02;
                          },
                        ),
                        emptyHorizontalBox(width: 10),
                        MaterialButton(
                          onPressed: () {
                            Get.to(
                                    () => HomePage(),
                                duration: controller.showMode.value ? Duration(seconds: 2) : Get.defaultTransitionDuration
                            );
                          },
                          height: 50,
                          minWidth: 80,
                          color: Colors.deepPurple.shade900,
                          child: Text(
                            "Spending UI",
                            style: GoogleFonts.pattaya(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
