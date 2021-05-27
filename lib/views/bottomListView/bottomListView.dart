import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spending_ui/controller/animationController.dart';
import 'package:spending_ui/utils/constant.dart';

class BottomListView extends StatefulWidget {
  @override
  _BottomListViewState createState() => _BottomListViewState();
}

class _BottomListViewState extends State<BottomListView> {
  Animation forBottomListViewHeight, forBottomListView;

  @override
  void initState() {
    GetAnimationController controller = GetAnimationController();
    forBottomListView = Tween(begin: 0.0, end: 25.0).animate(
      CurvedAnimation(
        parent: controller.animationController,
        curve: Interval(0.40, 1),
      ),
    );
    forBottomListViewHeight = Tween(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(
        parent: controller.animationController,
        curve: Interval(0.60, 1.0),
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 250 - forBottomListView.value * 10,
      child: Opacity(
        opacity: forBottomListView.value * 0.04,
        child: Container(
          width: Get.size.width,
          height: 100 + forBottomListViewHeight.value,
          padding: EdgeInsets.only(top: 30, right: 20, left: 20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.firstBackgroundGradient,
                AppColors.secondBackgroundGradient
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "History",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => BuildListTile(
                    index: index,
                  ),
                  itemCount: 5,
                  shrinkWrap: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BuildListTile extends StatelessWidget {
  final index;

  BuildListTile({this.index});

  final List<Map<String, dynamic>> listData = [
    {
      "title": "Shopping at adidas",
      "paid": 200,
      "card": 3295,
      "date": "01 Mar",
      "image": "adidas.png",
    },
    {
      "title": "Transfer to bob",
      "paid": 150,
      "card": 3295,
      "date": "03 Mar",
      "image": "transaction.jpg",
    },
    {
      "title": "Electricity bill",
      "paid": 250,
      "card": 3295,
      "date": "07 Mar",
      "image": "electricity.png"
    },
    {
      "title": "Paid on Netflix",
      "paid": 25,
      "card": 3295,
      "date": "15 Mar",
      "image": "netflix.png"
    },
    {
      "title": "Take Linked plus plan",
      "paid": 10,
      "card": 3295,
      "date": "20 Mar",
      "image": "linkedIn.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        "assets/"+listData.elementAt(index)["image"],
        width: 50,
        height: 50,
      ),
      title: Text(
        listData.elementAt(index)["title"],
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
      subtitle: Text(
        "**** " + listData.elementAt(index)["card"].toString(),
        style: TextStyle(
          fontSize: 12,
        ),
      ),
      trailing: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "- \$ " + listData.elementAt(index)["paid"].toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            Text(
              listData.elementAt(index)["date"],
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
