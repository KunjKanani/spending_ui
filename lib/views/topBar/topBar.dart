import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spending_ui/controller/animationController.dart';
import 'package:spending_ui/utils/helpers.dart';

class GetTopBar extends StatelessWidget {
  final GetAnimationController controller = GetAnimationController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30, right: 30,top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: Image.asset(
                  "assets/profilePic.jpg",
                  fit: BoxFit.fill,
                ).image,
                radius: 28,
              ),
              emptyHorizontalBox(width: 10),
              Text(
                "Hi, lina",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Stack(
              children: [
                Positioned(
                  child: Container(
                    width: 5,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  right: 13,
                  top: 8,
                ),
                Center(child: Icon(CupertinoIcons.bell, color: Colors.black,),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
