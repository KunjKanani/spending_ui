import 'package:flutter/material.dart';
import 'package:spending_ui/controller/animationController.dart';
import 'package:spending_ui/utils/helpers.dart';

class SpendingTopBar extends StatelessWidget {
  final GetAnimationController controller = GetAnimationController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30, right: 30, top: 30),
      child: Row(
        children: [
          GestureDetector(
            onTap: (){
              controller.animationController.reverse();
            },
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.black12,
                  width: 0.8,
                ),
              ),
              child: Icon(Icons.arrow_back_rounded),
            ),
          ),
          emptyHorizontalBox(),
          Text(
            "Spending",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
