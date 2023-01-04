import 'package:flutter/material.dart';
import 'package:pet_app/Colors/COLORS.dart';
import 'package:pet_app/Provider/AddCycle.dart';
import 'package:pet_app/UTILS/Utils.dart';
import 'package:provider/provider.dart';

class CycleTracking3 extends StatefulWidget {
  const CycleTracking3({super.key});

  @override
  State<CycleTracking3> createState() => _CycleTracking3State();
}

class _CycleTracking3State extends State<CycleTracking3> {
  List<Widget> items = List.generate(
    20,
    (index) => styleText("${index + 11} Days", GREEN_CLR.withOpacity(0.75),
        FontWeight.normal, 18),
  );
  // [
  //   styleText("11 Days", GREEN_CLR.withOpacity(0.75), FontWeight.normal, 18),
  //   styleText("12 Days", GREEN_CLR.withOpacity(0.75), FontWeight.normal, 18),
  //   styleText("13 Days", GREEN_CLR.withOpacity(0.75), FontWeight.normal, 18),
  //   styleText("14 Days", GREEN_CLR.withOpacity(0.75), FontWeight.normal, 18),
  //   styleText("15 Days", GREEN_CLR.withOpacity(0.75), FontWeight.normal, 18),
  //   styleText("16 Days", GREEN_CLR.withOpacity(0.75), FontWeight.normal, 18),
  //   styleText("18 Days", GREEN_CLR.withOpacity(0.75), FontWeight.normal, 18),
  //   styleText("19 Days", GREEN_CLR.withOpacity(0.75), FontWeight.normal, 18),
  //   styleText("20 Days", GREEN_CLR.withOpacity(0.75), FontWeight.normal, 18),
  //   styleText("21 Days", GREEN_CLR.withOpacity(0.75), FontWeight.normal, 18),
  //   styleText("22 Days", GREEN_CLR.withOpacity(0.75), FontWeight.normal, 18),
  //   styleText("23 Days", GREEN_CLR.withOpacity(0.75), FontWeight.normal, 18),
  //   styleText("24 Days", GREEN_CLR.withOpacity(0.75), FontWeight.normal, 18),
  //   styleText("25 Days", GREEN_CLR.withOpacity(0.75), FontWeight.normal, 18),
  //   styleText("26 Days", GREEN_CLR.withOpacity(0.75), FontWeight.normal, 18),
  //   styleText("27 Days", GREEN_CLR.withOpacity(0.75), FontWeight.normal, 18),
  //   styleText("28 Days", GREEN_CLR.withOpacity(0.75), FontWeight.normal, 18),
  //   styleText("29 Days", GREEN_CLR.withOpacity(0.75), FontWeight.normal, 18),
  //   styleText("30 Days", GREEN_CLR.withOpacity(0.75), FontWeight.normal, 18),
  // ];
  @override
  void initState() {
    super.initState();
    context.read<AddCycleProvider>().cyclerepeattime = 11;
  }

  var h;
  var w;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: WHITE70_CLR,
      body: Padding(
        padding: EdgeInsets.all(h * 0.020),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: h * 0.050,
            ),
            styleText("How long is the typical cycle?", DARK_CLR,
                FontWeight.bold, 20),
            SizedBox(
              height: h * 0.090,
            ),
            SizedBox(
                height: h * 0.4,
                child: ListWheelScrollView.useDelegate(
                  itemExtent: 50,
                  physics: const FixedExtentScrollPhysics(),
                  overAndUnderCenterOpacity: 0.4,
                  onSelectedItemChanged: (value) {
                    context.read<AddCycleProvider>().cyclerepeattime =
                        value + 11;
                  },
                  childDelegate: ListWheelChildLoopingListDelegate(
                    children: items,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
