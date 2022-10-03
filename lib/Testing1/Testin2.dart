import 'package:flutter/material.dart';
import 'package:pet_app/Colors/COLORS.dart';

class Demo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DemoState();
}

class DemoState extends State<Demo> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> offset;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 750));
    offset = Tween<Offset>(begin: Offset(0.0, 0.0), end: Offset.zero)
        .animate(CurvedAnimation(parent: controller, curve: Curves.easeIn));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: SlideTransition(
              position: offset,
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Container(
                  alignment: Alignment.center,
                  height: 150,
                  width: 300,
                  decoration: BoxDecoration(
                      color: GREEN_CLR,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    "Swipe",
                    style: TextStyle(color: WHITE_CLR),
                  ),
                ),
              ),
            ),
          ),
          MaterialButton(
            color: GREEN_CLR,
            child: Text(
              "Swipe",
              style: TextStyle(color: WHITE_CLR),
            ),
            onPressed: () {
              switch (controller.status) {
                case AnimationStatus.completed:
                  controller.reverse();
                  break;
                case AnimationStatus.dismissed:
                  controller.forward();
                  break;
                default:
              }
            },
          ),
        ],
      ),
    );
  }
}
