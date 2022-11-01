import 'package:flutter/material.dart';
import 'package:pet_app/Componants/Images&Icons.dart';
import 'package:provider/provider.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import '../../Colors/COLORS.dart';
import '../../Provider/ServiceListProvider.dart';
import '../../UTILS/Utils.dart';

String? type2;
String? name;
String? parentName;
String? breed;
String? gender;
String? weight;
String? date;
String? document;
String? image;

class EditPetPage extends StatefulWidget {
  var myList;
  EditPetPage({required this.myList});

  State<EditPetPage> createState() => _EditPetPageState();
}

class _EditPetPageState extends State<EditPetPage> {
  PageController editpageController = PageController();

  static const _kDuration = Duration(milliseconds: 200);
  static const _kCurve = Curves.ease;

  var h;
  var w;

  @override
  void initState() {
    super.initState();
    type2 = widget.myList.type.toString();
    name = widget.myList.name.toString();
    parentName = widget.myList.parentname.toString();
    breed = widget.myList.breed.toString();
    gender = widget.myList.gendar.toString();
    weight = widget.myList.weight.toString();
    date = widget.myList.dob.toString();
    document = widget.myList.uploaddocument.toString();
    image = widget.myList.image.toString();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // print(widget.myList.name.toString());
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Consumer<AddPetProvider>(
        builder: (BuildContext context, value, Widget? child) {
      return Scaffold(
        backgroundColor: WHITE70_CLR,
        appBar: AppBar(
          leading: BackButton(
            onPressed: () {
              if (value.currentIndex == 1 || value.currentIndex == 2) {
                value.currentIndex = 0;
              }
              Navigator.of(context).pop();
              print(value.currentIndex);
            },
          ),
          centerTitle: true,
          toolbarHeight: 65,
          backgroundColor: WHITE70_CLR,
          elevation: 1,
          title: styleText("Edit Pets", DARK_CLR, FontWeight.bold, 16),
        ),
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.only(
              top: h * 0.020, left: w * 0.050, right: w * 0.050),
          child: Stack(
            children: [
              PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                controller: editpageController,
                onPageChanged: value.onChangedPage,
                itemBuilder: (context, position) {
                  return value.editpetPage[position];
                },
                itemCount: value.editpetPage.length,
              ),
              Container(
                  margin: EdgeInsets.only(top: h * 0.165),
                  child: styleText(value.text[value.currentIndex], DARK_CLR,
                      FontWeight.bold, 19)),
              Container(
                padding: const EdgeInsets.all(1),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: GREEN_CLR, width: 1.5)),
                margin: EdgeInsets.only(top: h * 0.130),
                child: StepProgressIndicator(
                  direction: Axis.horizontal,
                  selectedSize: 12,
                  totalSteps: value.pages.length,
                  currentStep: value.currentIndex + 1,
                  size: 10,
                  selectedColor: GREEN_CLR,
                  unselectedColor: WHITE70_CLR,
                  roundedEdges: const Radius.circular(20),
                ),
              ),
              Container(
                  padding: const EdgeInsets.only(bottom: 35),
                  alignment: Alignment.bottomCenter,
                  child: MaterialButton(
                      elevation: 0,
                      minWidth: w * 0.55,
                      height: h * 0.057,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: value.currentIndex == 2
                              ? const BorderSide(color: GREEN_CLR)
                              : const BorderSide(color: Colors.transparent)),
                      color: value.currentIndex == 2
                          ? (value.selectImage == null ? WHITE_CLR : GREEN_CLR)
                          : GREEN_CLR,
                      onPressed: () {
                        editpageController.nextPage(
                            duration: _kDuration, curve: _kCurve);
                      },
                      child: styleText(
                          value.currentIndex == 2
                              ? (value.selectImage == null
                                  ? SKIP_CONTINUE
                                  : FINISH)
                              : CONTINUE,
                          value.currentIndex == 2
                              ? (value.selectImage == null
                                  ? GREEN_CLR
                                  : WHITE_CLR)
                              : WHITE_CLR,
                          FontWeight.normal,
                          15)))
            ],
          ),
        ),
      );
    });
  }
}
