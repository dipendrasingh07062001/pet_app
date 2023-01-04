import 'package:flutter/material.dart';
import 'package:pet_app/UTILS/Utils.dart';

import '../../Colors/COLORS.dart';

class EditCycle_tracking extends StatefulWidget {
  const EditCycle_tracking({super.key});

  @override
  State<EditCycle_tracking> createState() => _EditCycle_trackingState();
}

class _EditCycle_trackingState extends State<EditCycle_tracking> {
  var h;
  var w;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: DefaultAppBar("Edit Pet Cycle"),
      body: Container(
        height: h,
        width: w,
        padding: EdgeInsets.symmetric(horizontal: w * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              height: h * 0.05,
              child: styleText(
                "When did your pet’s last period start?",
                DARK_CLR,
                FontWeight.bold,
                14,
              ),
            ),
            TextFormField(
              onTap: () {
                print("123456789876543");
              },
              readOnly: true,
              decoration: InputDecoration(
                  isDense: true,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: GREEN_CLR,
                  )),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: GREEN_CLR,
                  )),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: GREEN_CLR,
                  )),
                  hintText: "YYYY-MM-DD",
                  suffixIcon: Icon(
                    Icons.calendar_month,
                    color: GREEN_CLR,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
