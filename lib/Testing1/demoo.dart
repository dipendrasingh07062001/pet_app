import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class demmo extends StatefulWidget {
  const demmo({super.key});

  @override
  State<demmo> createState() => _demmoState();
}

class _demmoState extends State<demmo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(
          onPressed: () {
            showModalBottomSheet(
                backgroundColor: Colors.transparent,
                context: context,
                builder: (ctx) => demo());
          },
          color: Colors.red,
        ),
      ),
    );
  }
}

class demo extends StatefulWidget {
  const demo({super.key});

  @override
  State<demo> createState() => _demoState();
}

class _demoState extends State<demo> {
  var h;
  var w;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Container(
      height: h * 0.2,
      width: w * 1,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Padding(
        padding: EdgeInsets.only(
            top: 5, left: w * 0.025, right: w * 0.025, bottom: 5),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                        // left: w * 0.025,
                        right: w * 0.025,
                      ),
                      child: Container(
                        height: h * 0.05,
                        width: w * 0.1,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Color.fromARGB(255, 50, 181, 140),
                            )),
                        child: Icon(
                          Icons.ad_units,
                          color: Color.fromARGB(255, 50, 181, 140),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: h * 0.010),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "LVE-272",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.red,
                                fontWeight: FontWeight.normal),
                          ),
                          Text(
                            "Gomeh Shada Co.",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.normal),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  height: h * 0.042,
                  width: w * 0.27,
                  margin: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.green.withOpacity(0.1)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.settings,
                        size: 15,
                        color: Color.fromARGB(255, 50, 181, 140),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Discloger",
                        style: TextStyle(
                            fontFamily: "LamaSans",
                            fontSize: 12,
                            color: Colors.green,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(thickness: 1, color: Colors.grey.withOpacity(.1)),
            Padding(
              padding: EdgeInsets.only(
                top: w * 0.005,
                // left: w * 0.025,
                // right: w * 0.025,
                bottom: h * 0.016,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: h * 0.042,
                    width: w * 0.27,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.green.withOpacity(0.1)),
                    child: Text(
                      "Restorent",
                      style: TextStyle(
                          fontFamily: "LamaSans",
                          fontSize: 12,
                          color: Colors.green,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: h * 0.042,
                    width: w * 0.27,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.red.withOpacity(0.1),
                    ),
                    child: Text(
                      "Weight 4",
                      style: TextStyle(
                          fontFamily: "LamaSans",
                          fontSize: 12,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: h * 0.042,
                    width: w * 0.3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey.withOpacity(0.1)),
                    child: Text(
                      "Pending Inspection",
                      style: TextStyle(
                          fontFamily: "LamaSans",
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
