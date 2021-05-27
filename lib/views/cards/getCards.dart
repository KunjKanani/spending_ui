import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spending_ui/controller/animationController.dart';
import 'package:spending_ui/utils/helpers.dart';
import 'package:spending_ui/views/addCardBtn/addCardBtn.dart';

class GetCards extends StatefulWidget {
  @override
  _GetCardsState createState() => _GetCardsState();
}

class _GetCardsState extends State<GetCards> {
  Animation forCardDeck;
  Animation forAddCard;
  final GetAnimationController controller = GetAnimationController();
  Animation forCardOpacity;
  Animation forCardDown;

  @override
  void initState() {
    forCardDeck = Tween(begin: 80.0, end: 0.0).animate(
      CurvedAnimation(
        parent: controller.animationController,
        curve: Interval(0.0, 0.20),
      ),
    );
    forAddCard = Tween(begin: 240.0, end: 0.0).animate(
      CurvedAnimation(
        parent: controller.animationController,
        curve: Interval(0.0, 0.40),
      ),
    );
    forCardOpacity = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller.animationController,
        curve: Interval(0.20, 0.70),
      ),
    );
    forCardDown = Tween(begin: 0.0, end: 60.0).animate(
      CurvedAnimation(
        parent: controller.animationController,
        curve: Interval(0.20, 0.60),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller.animationController,
      builder: (context, child) => Positioned(
        left: 30,
        right: 30,
        top: 360 + forCardDown.value,
        child: Opacity(
          opacity: 1 - forCardOpacity.value,
          child: Container(
            height: 280,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Opacity(
                  opacity: 1 - forCardOpacity.value,
                  child: Text(
                    "My Cards",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                emptyVerticalBox(
                  height: 10,
                ),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      top: forAddCard.value,
                      child: AddCardBtn(),
                    ),
                    Positioned(
                      top: forCardDeck.value,
                      child: getPrivateCard(),
                    ),
                    getFamilyCard(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getFamilyCard() {
    return Container(
      height: 160,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xffDEE8FB),
            Color(0xffFEF1D8),
          ],
        ),
        boxShadow: [BoxShadow(color: Colors.white, offset: Offset(0, 10))],
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Family Card",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "**** 3142",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade400,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              Text(
                "\$ 12,054",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: CircleAvatar(
                      backgroundImage: Image.asset(
                        "assets/profilePic2.jpg",
                        fit: BoxFit.fill,
                      ).image,
                      radius: 18,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: CircleAvatar(
                      backgroundImage: Image.asset(
                        "assets/profilePic1.jpg",
                        fit: BoxFit.fill,
                      ).image,
                      radius: 18,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.grey.shade400, width: 1),
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Icon(
                          Icons.add,
                          size: 22,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Image.asset(
                "assets/visa.png",
                width: 60,
                height: 50,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget getPrivateCard() {
    return Container(
      height: 150,
      width: Get.size.width - 60,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xffFDEFD9),
            Color(0xffE5EFE1),
          ],
        ),
        boxShadow: [BoxShadow(color: Colors.white, offset: Offset(0, 10))],
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Family Card",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                "\$ 12,054",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
