import 'package:flutter/material.dart';
import 'package:pet_app/Provider/AddCycle.dart';
import 'package:provider/provider.dart';

import '../../Colors/COLORS.dart';
import '../../UTILS/Utils.dart';

class Cycle_Tracking extends StatefulWidget {
  const Cycle_Tracking({super.key});

  @override
  State<Cycle_Tracking> createState() => _Cycle_TrackingState();
}

class _Cycle_TrackingState extends State<Cycle_Tracking> {
  int _prengnant = 1;
  String? _prengnantvalue;

  var h;
  var w;
  List<String> states = [
    "Pregnant",
    "Pregnancy",
    "Other",
    "None of These",
  ];
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: WHITE70_CLR,
        body: Padding(
          padding: EdgeInsets.all(h * 0.020),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: h * 0.050,
            ),
            styleText(
                "Some factors affect your pet’s \ncycle. are your pet currently?",
                DARK_CLR,
                FontWeight.bold,
                20),
            ListView.builder(
              itemCount: states.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(0),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _prengnant = index + 1;
                      _prengnantvalue = states[index];
                      context.read<AddCycleProvider>().petcurrentstate =
                          states[index];
                    });
                  },
                  child: DefaultRadioButton(
                      text: states[index],
                      groupValue: _prengnant,
                      value: index + 1,
                      ontap: (value) {
                        setState(() {
                          _prengnant = value!;
                          _prengnantvalue = states[index];
                          context.read<AddCycleProvider>().petcurrentstate =
                              states[index];
                        });
                      }),
                );
              },
            ),
            // DefaultRadioButton(
            //     text: "Pregnant",
            //     groupValue: _prengnant,
            //     value: 1,
            //     ontap: (value) {
            //       setState(() {
            //         _prengnant = value!;
            //         _prengnantvalue = "pregnant";
            //       });
            //     }),
            // DefaultRadioButton(
            //     text: "Pregnancy",
            //     groupValue: _prengnant,
            //     value: 2,
            //     ontap: (value) {
            //       setState(() {
            //         _prengnant = value!;
            //         _prengnantvalue = "pregnancy";
            //       });
            //     }),
            // DefaultRadioButton(
            //     text: "Other",
            //     groupValue: _prengnant,
            //     value: 3,
            //     ontap: (value) {
            //       setState(() {
            //         _prengnant = value!;
            //         _prengnantvalue = "other";
            //       });
            //     }),
            // DefaultRadioButton(
            //     text: "None of These",
            //     groupValue: _prengnant,
            //     value: 4,
            //     ontap: (value) {
            //       setState(() {
            //         _prengnant = value!;
            //         _prengnantvalue = "None of these";
            //       });
            //     }),
          ]),
        ));
  }
}
