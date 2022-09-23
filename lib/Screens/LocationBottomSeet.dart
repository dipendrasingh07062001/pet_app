import 'package:flutter/material.dart';
import 'package:pet_app/Componants/Images&Icons.dart';
import 'package:pet_app/Provider/Provider.dart';
import 'package:pet_app/Screens/HOME/Home.dart';
import 'package:pet_app/UTILS/Utils.dart';
import 'package:provider/provider.dart';

import '../Colors/COLORS.dart';

class LocationBottomSeet extends StatefulWidget {
  const LocationBottomSeet({super.key});

  @override
  State<LocationBottomSeet> createState() => _LocationBottomSeetState();
}

class _LocationBottomSeetState extends State<LocationBottomSeet> {
  var h;
  var w;

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Container(
        height: h * 0.6,
        decoration: new BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16), topRight: Radius.circular(16))),
        child: Padding(
          padding: EdgeInsets.only(
              top: h * 0.020, right: w * 0.040, left: w * 0.030),
          child: Consumer<ProviderTutorial>(
              builder: (BuildContext context, value, Widget? child) {
            return Column(
              children: [
                Align(
                    alignment: Alignment.bottomRight,
                    child: GestureDetector(
                        onTap: () {
                          // value.searchLocationCantroller.text.toString();

                          print(value.searchLocationCantroller);

                          Navigator.of(context).pop();
                        },
                        child:
                            styleText(DONE, GREEN_CLR, FontWeight.bold, 15))),
                Container(
                  alignment: Alignment.center,
                  height: h * 0.065,
                  margin: EdgeInsets.only(top: h * 0.020),
                  decoration: BoxDecoration(
                      color: WHITE_CLR,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: BORDER_CLR, width: 1)),
                  child: TextFormField(
                      controller: value.searchLocationCantroller,
                      decoration: InputDecoration(
                          errorText: "",
                          errorStyle: TextStyle(height: 0),
                          hintText: "Location",
                          hintStyle: TextStyle(
                              color: GRAY_CLR,
                              fontSize: 14,
                              fontWeight: FontWeight.normal),
                          prefixIcon: Icon(
                            Icons.location_on,
                            color: GREEN_CLR,
                            size: 20,
                          ),
                          suffixIcon: Icon(
                            Icons.gps_fixed_sharp,
                            size: 17,
                            color: GRAY_CLR,
                          ),
                          border: InputBorder.none)),
                ),
                Container(
                  alignment: Alignment.center,
                  height: h * 0.4,
                  margin: EdgeInsets.only(top: h * 0.010),
                  decoration: BoxDecoration(
                      color: WHITE_CLR,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: BORDER_CLR, width: 1)),
                  child: SizedBox(
                    height: h * 0.36,
                    child: ListView.builder(
                        itemCount: 8,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.only(
                                top: h * 0.010,
                                right: w * 0.030,
                                left: w * 0.030),
                            child: Column(
                              children: [
                                Row(children: [
                                  Icon(
                                    Icons.location_on,
                                    color: GRAY_CLR,
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  styleText("27/2,Mansarover Jaipur,302033",
                                      GRAY_CLR, FontWeight.normal, 12)
                                ]),
                                Divider(
                                  color: GRAY_CLR.withOpacity(0.3),
                                  thickness: 1,
                                )
                              ],
                            ),
                          );
                        }),
                  ),
                ),
              ],
            );
          }),
        ));
  }
}
