import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:pet_app/UTILS/Utils.dart';
import 'Colors/COLORS.dart';
import 'Componants/Images&Icons.dart';

class MyHomePAge extends StatefulWidget {
  const MyHomePAge({super.key});

  @override
  State<MyHomePAge> createState() => _MyHomePAgeState();
}

class _MyHomePAgeState extends State<MyHomePAge> {
  double itemWidth = 60.0;
  int selected = 0;
  DateTime now = DateTime.now();
  late DateTime lastDayOfMonth;
  @override
  void initState() {
    super.initState();
    lastDayOfMonth = DateTime(now.year, now.month + 1, 0);
  }

  FixedExtentScrollController _scrollController =
      FixedExtentScrollController(initialItem: 200);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                TutorialText("Today,25 August", BLACK_CLR, FontWeight.bold, 20),
          ),
          Container(
            padding: EdgeInsets.zero,
            height: 1,
            color: GRAY_CLR,
            width: 300,
          ),
          Image.asset(
            DROP_ICON,
            height: 35,
            color: GREEN_CLR,
          ),
          Container(
            alignment: Alignment.bottomCenter,
            height: 150,
            child: RotatedBox(
                quarterTurns: 5,
                child: ListWheelScrollView(
                  clipBehavior: Clip.antiAlias,
                  renderChildrenOutsideViewport: false,
                  onSelectedItemChanged: (x) {
                    setState(() {
                      selected = x;
                    });
                    print(selected);
                  },
                  controller: _scrollController,
                  children: List.generate(
                    lastDayOfMonth.day,
                    (x) {
                      final currentDate =
                          lastDayOfMonth.add(Duration(days: x + 1));
                      final dayName = DateFormat('E').format(currentDate);
                      return Row(
                        children: [
                          Container(
                            height: 35.0,
                            width: 35.0,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: x == selected
                                  ? GREEN_CLR
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(100.0),
                            ),
                            child: Transform.rotate(
                              angle: -70.7,
                              child: Text(
                                dayName.substring(0, 1),
                                style: TextStyle(
                                  fontSize: 17.0,
                                  color: x == selected ? WHITE_CLR : GRAY_CLR,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Transform.rotate(
                            angle: -80.1,
                            child: SvgPicture.asset(CYCLE_TRACKING_IMAGE,
                                height: x == selected ? 70 : 50,
                                color: x == selected
                                    ? GREEN_CLR
                                    : GREEN_CLR.withOpacity(0.8)),
                          ),
                        ],
                      );
                    },
                  ),
                  itemExtent: itemWidth,
                )),
          ),
        ],
      ),
    );
  }
}
