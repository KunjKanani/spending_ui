import 'package:flutter/material.dart';
import 'package:spending_ui/controller/animationController.dart';
import 'package:spending_ui/utils/helpers.dart';
import 'package:spending_ui/views/spending/spendingChart.dart';

class Spending extends StatefulWidget {
  @override
  _SpendingState createState() => _SpendingState();
}

class _SpendingState extends State<Spending> {
  final GetAnimationController controller = GetAnimationController();
  Animation forMoneyVal;
  Animation forChartContainer;
  Animation forChart;
  Animation forTextOpacity;

  @override
  void initState() {
    forMoneyVal = Tween(begin: 6421.0, end: 9812.0).animate(
      CurvedAnimation(
        parent: controller.animationController,
        curve: Interval(0.0, 0.60),
      ),
    );
    forChartContainer = Tween(begin: 0.0, end: 60.0).animate(
      CurvedAnimation(
        parent: controller.animationController,
        curve: Interval(0.20, 0.70),
      ),
    );
    forChart = Tween(begin: 1.0, end: 2.0).animate(
      CurvedAnimation(
        parent: controller.animationController,
        curve: Interval(0.20, 0.70),
      ),
    );
    forTextOpacity = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller.animationController,
        curve: Interval(0.45, 0.80),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 30,
      right: 30,
      top: 140,
      child: AnimatedBuilder(
        animation: controller.animationController,
        builder: (context, child) => Container(
          height: 202 + forChartContainer.value,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "March Spending",
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              emptyVerticalBox(height: 15),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "\$",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  emptyHorizontalBox(width: 10),
                  Row(
                    children: [
                      Text(
                        "${forMoneyVal.value.toInt()}",
                        style: TextStyle(
                          fontSize: 38,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      emptyHorizontalBox(),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 3,
                            color: Colors.blue,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Icon(
                          Icons.arrow_forward_rounded,
                          color: Colors.blue,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                height: 100 + forChartContainer.value,
                child: GetSpendingChart(
                  forChart: forChart,
                  forTextOpacity: forTextOpacity,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
