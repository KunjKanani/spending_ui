import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spending_ui/controller/animationController.dart';
import 'package:spending_ui/utils/constant.dart';
import 'package:spending_ui/views/appBottomNavigationBar.dart';
import 'package:spending_ui/views/bottomListView/bottomListView.dart';
import 'package:spending_ui/views/cards/getCards.dart';
import 'package:spending_ui/views/categoryListView/CategoryListView.dart';
import 'package:spending_ui/views/spending/spending.dart';
import 'package:spending_ui/views/spending/spendingTopBar.dart';
import 'package:spending_ui/views/topBar/topBar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  GetAnimationController controller = Get.find();
  Animation forBgColor;
  Animation forBottomNavigationBar;
  Animation forTopBar;

  @override
  void initState() {
    print(controller.showMode.value);
    controller.animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: controller.showMode.value ? 20 : 2),
    );

    forBgColor = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller.animationController,
        curve: Interval(0.20, 0.45),
      ),
    );

    forBottomNavigationBar = Tween(begin: 0.0, end: 46.0).animate(
      CurvedAnimation(
        parent: controller.animationController,
        curve: Interval(0.30, 0.45),
      ),
    );

    forTopBar = Tween(begin: 0.0, end: 20.0).animate(
      CurvedAnimation(
        parent: controller.animationController,
        curve: Interval(0.45, 0.60),
      ),
    );

    super.initState();
  }

  @override
  void dispose() {
    controller.animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: Get.size.height < 780.0
                  ? Get.size.height + (780.0 - Get.size.height)
                  : Get.size.height,
            ),
            AnimatedBuilder(
              animation: controller.animationController,
              builder: (context, child) => Container(
                width: Get.size.width,
                height: Get.size.height,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.firstBackgroundGradient.withOpacity(
                        1.0 - forBgColor.value,
                      ),
                      AppColors.secondBackgroundGradient,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
            Spending(),
            GetCards(),
            AnimatedBuilder(
              animation: controller.animationController,
              builder: (context, child) => CategoryListView(),
            ),
            AnimatedBuilder(
              animation: controller.animationController,
              builder: (context, child) => BottomListView(),
            ),
            AnimatedBuilder(
              animation: controller.animationController,
              builder: (context, child) => Positioned(
                top: forTopBar.value + 40,
                width: Get.size.width,
                child: Opacity(
                  opacity: forTopBar.value == 0.0
                      ? 1.0
                      : 1.0 - (forTopBar.value * 0.05),
                  child: GetTopBar(),
                ),
              ),
            ),
            AnimatedBuilder(
              animation: controller.animationController,
              builder: (context, child) => Positioned(
                bottom: 0 - forBottomNavigationBar.value,
                child: GetAppBottomNavigationBar(),
              ),
            ),
            AnimatedBuilder(
              animation: controller.animationController,
              builder: (context, child) => Positioned(
                top: forTopBar.value + 20,
                child: Opacity(
                  opacity: forTopBar.value * 0.05,
                  child: SpendingTopBar(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
