import 'package:flutter/material.dart';
import 'package:spending_ui/controller/animationController.dart';

class GetSpendingChart extends StatelessWidget {
  final Animation forChart;
  final GetAnimationController controller = GetAnimationController();  final Animation forTextOpacity;
  final List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.orange,
    Colors.blueGrey,
    Colors.blue,
    Colors.orange.shade200,
    Colors.cyan,
    Colors.amber,
    Colors.deepOrange,
    Colors.pink,
    Colors.brown,
    Colors.lightGreen,
  ];

  GetSpendingChart({this.forChart, this.forTextOpacity});

  @override
  Widget build(BuildContext context) {
    List<double> barHeight = [
      60 * forChart.value,
      30 * forChart.value,
      45 * forChart.value,
      15 * forChart.value,
      40 * forChart.value,
      30 * forChart.value,
      55 * forChart.value,
      15 * forChart.value,
      45 * forChart.value,
      30 * forChart.value,
      10 * forChart.value,
      50 * forChart.value,
    ];
    List<String> months = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec",
    ];
    List<String> spendingVal = [
      "1.2K",
      "500",
      "423",
      "1k",
      "213",
      "314",
      "543",
      "650",
      "230",
      "1.7k",
      "210",
      "640",
    ];

    return ListView.builder(
      itemCount: barHeight.length,
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: index == 2 ? () {
                  controller.animationController.forward();
                } : () {},
                child: Container(
                  width: 35,
                  height: barHeight[index],
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    color: forChart.value > 1.30
                        ? colors
                            .elementAt(index)
                            .withOpacity(forChart.value - 1.0)
                        : index < 3
                            ? Color(0xffF5B443).withOpacity(
                                1.0 - ((forChart.value - 1.0) * 3.0))
                            : Color(0xffFFE6C0).withOpacity(
                                1.0 - ((forChart.value - 1.0) * 3.0)),
                  ),
                ),
              ),
              Stack(
                children: [
                  Opacity(
                    opacity: 1 - forTextOpacity.value,
                    child: Text(
                      months[index],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Opacity(
                    opacity: forTextOpacity.value,
                    child: Text(
                      spendingVal[index],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
