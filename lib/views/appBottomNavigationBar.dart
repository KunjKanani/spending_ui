import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spending_ui/utils/helpers.dart';

class GetAppBottomNavigationBar extends StatelessWidget {
  const GetAppBottomNavigationBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      width: Get.size.width,
      padding: EdgeInsets.symmetric(horizontal: 20),
      color: Colors.white,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildItems(icon: Icons.home_outlined, label: "Home"),
            buildItems(
                icon: CupertinoIcons.arrow_right_arrow_left, label: "Payments"),
            buildItems(icon: Icons.star_border_outlined, label: "Services"),
            buildItems(icon: Icons.chat_outlined, label: "Dialogues"),
            buildItems(icon: Icons.settings, label: "Settings"),
          ],
        ),
      ),
    );
  }

  Widget buildItems({IconData icon, String label}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.grey.shade400,
            size: 20,
          ),
          emptyVerticalBox(height: 10),
          Text(
            label,
            style: TextStyle(color: Colors.grey.shade400,fontSize: 11),
          ),
        ],
      ),
    );
  }
}
