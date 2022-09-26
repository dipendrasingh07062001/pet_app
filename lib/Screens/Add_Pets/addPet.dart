import 'package:flutter/material.dart';
import 'package:pet_app/Componants/Images&Icons.dart';
import 'package:pet_app/Provider/ServiceListProvider.dart';
import 'package:provider/provider.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import '../../Colors/COLORS.dart';
import '../../UTILS/Utils.dart';

class AddPetpage extends StatefulWidget {
  const AddPetpage({Key? key}) : super(key: key);

  State<AddPetpage> createState() => _AddPetpageState();
}

class _AddPetpageState extends State<AddPetpage> {
  PageController _controller = new PageController();

  static const _kDuration = const Duration(milliseconds: 200);
  static const _kCurve = Curves.ease;

  get Cantroller => _controller;

  var h;
  var w;

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Consumer<addPetProvider>(
        builder: (BuildContext context, value, Widget? child) {
      return Scaffold(
        backgroundColor: WHITE70_CLR,
        appBar: AppBar(
          leading: BackButton(
            onPressed: () {
              if (value.CurrentIndex == 1 || value.CurrentIndex == 2) {
                value.CurrentIndex = 0;
              }
              Navigator.of(context).pop();
              print(value.CurrentIndex);
            },
          ),
          centerTitle: true,
          toolbarHeight: 65,
          backgroundColor: WHITE70_CLR,
          elevation: 1,
          title: styleText(ADD_PETS, DARK_CLR, FontWeight.bold, 16),
        ),
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.only(
              top: h * 0.020, left: w * 0.050, right: w * 0.050),
          child: Stack(
            children: [
              PageView.builder(
                physics: NeverScrollableScrollPhysics(),
                controller: _controller,
                onPageChanged: value.OnChangedPage,
                itemBuilder: (context, position) {
                  return value.pages[position];
                  //  vapages[position];
                },
                itemCount: value.pages.length,
              ),
              Container(
                  margin: EdgeInsets.only(top: h * 0.165),
                  child: styleText(value.text[value.CurrentIndex], DARK_CLR,
                      FontWeight.bold, 19)),
              Container(
                padding: EdgeInsets.all(1),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: GREEN_CLR, width: 1.5)),
                margin: EdgeInsets.only(top: h * 0.130),
                child: StepProgressIndicator(
                  direction: Axis.horizontal,
                  selectedSize: 12,
                  totalSteps: value.pages.length,
                  currentStep: value.CurrentIndex + 1,
                  size: 10,
                  selectedColor: GREEN_CLR,
                  unselectedColor: WHITE70_CLR,
                  roundedEdges: Radius.circular(20),
                ),
              ),
              Container(
                  padding: EdgeInsets.only(bottom: 35),
                  alignment: Alignment.bottomCenter,
                  child: MaterialButton(
                      elevation: 0,
                      minWidth: w * 0.55,
                      // minWidth:value.mCurrentIndex == 2 ? w * 0.7 : w * 0.55,
                      height: h * 0.057,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: value.CurrentIndex == 2
                              ? BorderSide(color: GREEN_CLR)
                              : BorderSide(color: Colors.transparent)),
                      color: value.CurrentIndex == 2 ? WHITE_CLR : GREEN_CLR,
                      onPressed: () {
                        value.CurrentIndex;

                        _controller.nextPage(
                            duration: _kDuration, curve: _kCurve);

                        print(value.CurrentIndex);
                      },
                      child: styleText(
                          value.CurrentIndex == 2 ? SKIP_CONTINUE : CONTINUE,
                          value.CurrentIndex == 2 ? GREEN_CLR : WHITE_CLR,
                          FontWeight.normal,
                          15)))
            ],
          ),
        ),
      );
    });
  }
}
