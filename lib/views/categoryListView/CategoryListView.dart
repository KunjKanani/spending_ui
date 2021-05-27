import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spending_ui/controller/animationController.dart';
import 'package:spending_ui/utils/helpers.dart';

class CategoryListView extends StatefulWidget {
  @override
  _CategoryListViewState createState() => _CategoryListViewState();
}

class _CategoryListViewState extends State<CategoryListView> {
  GetAnimationController controller = GetAnimationController();
  Animation forCategoryListViewOpacity;

  @override
  void initState() {
    forCategoryListViewOpacity = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller.animationController,
        curve: Interval(0.40, 1),
      ),
    );
    super.initState();
  }

  final List<Color> itemsColors = [
    Colors.orange,
    Colors.green,
    Colors.blue,
    Colors.teal,
    Colors.red
  ];

  final List<String> itemsText = [
    "Transfer",
    "Shopping",
    "favorite",
    "Movies",
    "Travels"
  ];

  final List<IconData> itemsIcon = [
    CupertinoIcons.arrow_right_arrow_left,
    CupertinoIcons.bag,
    CupertinoIcons.star_fill,
    CupertinoIcons.tickets,
    CupertinoIcons.tram_fill
  ];

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 400,
      left: 100 - (forCategoryListViewOpacity.value * 20 * 5),
      child: Opacity(
        opacity: forCategoryListViewOpacity.value,
        child: Container(
          padding: EdgeInsets.only(left: 20),
          height: 145,
          width: Get.size.width,
          child: ListView.builder(
            itemBuilder: (context, index) => buildListItem(index),
            itemCount: itemsText.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ),
    );
  }

  Widget buildListItem(int index) {
    return Transform.scale(
      scale: (1 - index / 10) + (forCategoryListViewOpacity.value - ((1 - index / 10))),
      child: Container(
        width: 130,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: itemsColors.elementAt(index).withOpacity(0.05),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              itemsIcon.elementAt(index),
              color: itemsColors.elementAt(index),
            ),
            emptyVerticalBox(height: 10),
            Text(
              itemsText.elementAt(index),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey.shade300,
              ),
            ),
            emptyVerticalBox(height: 5),
            Text(
              "\$ ${1200+(index*1000)}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            )
          ],
        ),
      ),
    );
  }
}
