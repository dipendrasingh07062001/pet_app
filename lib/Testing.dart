import 'package:coverflow/coverflow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pet_app/Screens/Add_Pets/AddPet3.dart';
import 'Componants/Images&Icons.dart';
  class MyHomePAge extends StatefulWidget {
  const MyHomePAge({super.key});

  @override
  State<MyHomePAge> createState() => _MyHomePAgeState();
}

class _MyHomePAgeState extends State<MyHomePAge> {
 
  double itemWidth = 60.0;
  int itemCount = 100;
  int selected = 50;
  FixedExtentScrollController _scrollController =
      FixedExtentScrollController(initialItem: 50);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo"),
      ),
      body: Center(
          child: RotatedBox(
              quarterTurns: 0,
              child: ListWheelScrollView(
                magnification: 2.0,
                onSelectedItemChanged: (x) {
                  setState(() {
                    selected = x;
                  });
                  print(selected);
                },
                controller: _scrollController,
                children: List.generate(
                    itemCount,
                    (x) => Column(
                      children: [


                        RotatedBox(
                            quarterTurns: 1,
                            child: AnimatedContainer(
                                duration: Duration(milliseconds: 400),
                                width: x == selected ? 60 : 50,
                                height: x == selected ? 60 : 50,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: x == selected ? Colors.red : Colors.grey,
                                    shape: BoxShape.circle),
                                child: Text('$x'))),

                                SvgPicture.asset(CYCLE_TRACKING_IMAGE)
                      ],
                    )),
                itemExtent: itemWidth,
              ))),
      
    );
  }
}