import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Colors/COLORS.dart';
import '../../Componants/Images&Icons.dart';
import '../../Provider/ServiceListProvider.dart';
import '../../UTILS/Utils.dart';

class ServicesHealthList extends StatelessWidget {
  ServicesHealthList({super.key});

  ScrollController _scrollController = ScrollController();

  var h;
  var w;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return Consumer<ServiceHealthProvider>(
        builder: (BuildContext context, value, Widget? child) {
      return ListView.builder(
          shrinkWrap: true,
          controller: _scrollController,
          itemCount: value.Service.length,
          scrollDirection: Axis.horizontal,
          // physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                GestureDetector(
                  onTap: () {
                    value.OnTap(index);

                    print(value.Service);
                    print(value.currenindex);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 13),
                    height: 70,
                    width: 70,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color:
                            value.currenindex == index ? GREEN_CLR : WHITE_CLR,
                        // value.data.elementAt(index)==value.Services?GREEN_CLR:WHITE_CLR,
                        // service.elementAt(index)==services?GREEN: WHITE70_CLR,
                        boxShadow: [BoxShadow(color: SHADOW_CLR)]),
                    child: Image.asset(
                      SERVICES_ICON,
                      color: value.currenindex == index ? WHITE_CLR : GRAY_CLR,
                    ),
                    // child: Image.asset(SERVICES_ICON,color: value.data.elementAt(index)==value.Services? WHITE70_CLR:GRAY_CLR,),
                  ),
                ),
                SizedBox(
                  height: h * 0.010,
                ),
                styleText(
                    value.data.elementAt(index), GRAY_CLR, FontWeight.bold, 13)
              ],
            );
          });
    });
  }
}
