import 'package:flutter/material.dart';
import 'package:pet_app/Colors/COLORS.dart';
import 'package:pet_app/Provider/AddCycle.dart';
import 'package:pet_app/Screens/Add_Pets/AddPet3.dart';
import 'package:pet_app/UTILS/Utils.dart';
import 'package:provider/provider.dart';

class CycleTracking2 extends StatefulWidget {
  const CycleTracking2({super.key});

  @override
  State<CycleTracking2> createState() => _CycleTracking2State();
}

class _CycleTracking2State extends State<CycleTracking2> {
  List<Widget> items = List.generate(
    20,
    (index) => styleText("${index + 1} Days", GREEN_CLR.withOpacity(0.75),
        FontWeight.normal, 18),
  );
  // [
  //   styleText("1 Days", GREEN_CLR.withOpacity(0.75), FontWeight.normal, 18),
  //   styleText("2 Days", GREEN_CLR.withOpacity(0.75), FontWeight.normal, 18),
  //   styleText("3 Days", GREEN_CLR.withOpacity(0.75), FontWeight.normal, 18),
  //   styleText("4 Days", GREEN_CLR.withOpacity(0.75), FontWeight.normal, 18),
  //   styleText("5 Days", GREEN_CLR.withOpacity(0.75), FontWeight.normal, 18),
  //   styleText("6 Days", GREEN_CLR.withOpacity(0.75), FontWeight.normal, 18),
  //   styleText("8 Days", GREEN_CLR.withOpacity(0.75), FontWeight.normal, 18),
  //   styleText("9 Days", GREEN_CLR.withOpacity(0.75), FontWeight.normal, 18),
  //   styleText("10 Days", GREEN_CLR.withOpacity(0.75), FontWeight.normal, 18),
  //   styleText("11 Days", GREEN_CLR.withOpacity(0.75), FontWeight.normal, 18),
  //   styleText("12 Days", GREEN_CLR.withOpacity(0.75), FontWeight.normal, 18),
  //   styleText("13 Days", GREEN_CLR.withOpacity(0.75), FontWeight.normal, 18),
  //   styleText("14 Days", GREEN_CLR.withOpacity(0.75), FontWeight.normal, 18),
  //   styleText("15 Days", GREEN_CLR.withOpacity(0.75), FontWeight.normal, 18),
  //   styleText("16 Days", GREEN_CLR.withOpacity(0.75), FontWeight.normal, 18),
  //   styleText("17 Days", GREEN_CLR.withOpacity(0.75), FontWeight.normal, 18),
  //   styleText("18 Days", GREEN_CLR.withOpacity(0.75), FontWeight.normal, 18),
  //   styleText("19 Days", GREEN_CLR.withOpacity(0.75), FontWeight.normal, 18),
  //   styleText("20 Days", GREEN_CLR.withOpacity(0.75), FontWeight.normal, 18),
  // ];

  FixedExtentScrollController fixedExtentScrollController =
      FixedExtentScrollController();

  var h;
  var w;
  @override
  void initState() {
    super.initState();
    context.read<AddCycleProvider>().cycletime = 1;
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: WHITE70_CLR,
      body: Padding(
        padding: EdgeInsets.all(h * 0.020),
        child: Column(
          children: [
            SizedBox(
              height: h * 0.050,
            ),
            styleText("How long does your pet's period usually last?", DARK_CLR,
                FontWeight.bold, 20),
            SizedBox(
              height: h * 0.090,
            ),
            SizedBox(
                height: h * 0.4,
                child: ListWheelScrollView.useDelegate(
                    itemExtent: 50,
                    controller: fixedExtentScrollController,
                    physics: FixedExtentScrollPhysics(),
                    overAndUnderCenterOpacity: 0.5,
                    useMagnifier: false,
                    clipBehavior: Clip.antiAlias,
                    childDelegate: ListWheelChildLoopingListDelegate(
                      children: items,
                    ),
                    onSelectedItemChanged: (index) {
                      context.read<AddCycleProvider>().cycletime = index + 1;
                    })),
          ],
        ),
      ),
    );
  }
}
