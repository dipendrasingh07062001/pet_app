import 'package:flutter/material.dart';
import 'package:pet_app/Componants/Images&Icons.dart';
import 'package:provider/provider.dart';
import '../../Colors/COLORS.dart';
import '../../Provider/ServiceListProvider.dart';
import '../../UTILS/Utils.dart';
import 'Cycle_Tracking6.dart';

class CycleTrackingPage extends StatefulWidget {
  const CycleTrackingPage({Key? key}) : super(key: key);

  @override
  State<CycleTrackingPage> createState() => _CycleTrackingPageState();
}

class _CycleTrackingPageState extends State<CycleTrackingPage> {
  int index = 0;

  // final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  int mCurrentIndex = -1;

  PageController _controller = PageController();
  static const _kDuration = Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;

  var h;
  var w;
  @override
  Widget build(BuildContext context) {
    final update = Provider.of<CycleTrackingProvider>(context, listen: false);

    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Consumer<CycleTrackingProvider>(
        builder: (BuildContext context, value, Widget? child) {
      return Scaffold(
        backgroundColor: WHITE70_CLR,
        appBar: DefaultAppBar("Cycle Tracking"),
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  height: h * 0.7,
                  margin: EdgeInsets.only(top: h * 0.125),
                  child: PageView.builder(
                    allowImplicitScrolling: true,
                    physics: const NeverScrollableScrollPhysics(),
                    controller: _controller,
                    onPageChanged: value.onChangedPage,
                    itemBuilder: (context, position) {
                      return value.pages[position];
                    },
                    itemCount: value.pages.length,
                  )),
              Container(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.only(bottom: h * 0.080),
                child: Column(
                  children: [
                    MaterialButton(
                        elevation: 0,
                        minWidth: w * 0.75,
                        height: h * 0.057,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        color: GREEN_CLR,
                        onPressed: () {
                          print(value.currentIndex);
                          value.currentIndex;
                          _controller.nextPage(
                              duration: _kDuration, curve: _kCurve);

                          if (value.currentIndex == 4) {
                            Navigate_to(context, const Cycle_Tracking6());
                          }
                        },
                        child:
                            styleText(NEXT, WHITE_CLR, FontWeight.normal, 15)),
                    SizedBox(
                      height: h * 0.020,
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigate_to(context, const Cycle_Tracking6());
                        },
                        child: styleText(
                            "Skip", GREEN_CLR, FontWeight.normal, 15)),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
