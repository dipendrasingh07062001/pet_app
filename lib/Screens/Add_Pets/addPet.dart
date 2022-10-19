import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pet_app/Componants/Images&Icons.dart';
import 'package:pet_app/Screens/Add_Pets/Add_pet2.dart';
import 'package:pet_app/Screens/My_Pets/My_Pets.dart';
import 'package:pet_app/main.dart';
import 'package:provider/provider.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import '../../Api/Models/My_pet_model.dart';
import '../../Api/Services.dart';
import '../../Colors/COLORS.dart';
import '../../Provider/ServiceListProvider.dart';
import '../../UTILS/Utils.dart';

class AddPetpage extends StatefulWidget {
  final isEdit;
  MypetListdata? addPetModel;
  AddPetpage({Key? key, required this.isEdit, this.addPetModel})
      : super(key: key);

  State<AddPetpage> createState() => _AddPetpageState();
}

class _AddPetpageState extends State<AddPetpage> {
  PageController controller = PageController();

  static const _kDuration = Duration(milliseconds: 200);
  static const _kCurve = Curves.ease;

  var h;
  var w;

  @override
  Widget build(BuildContext context) {
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
                physics: const NeverScrollableScrollPhysics(),
                controller: controller,
                onPageChanged: value.onChangedPage,
                itemBuilder: (context, position) {
                  return value.pages[position];
                },
                itemCount: value.pages.length,
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
                        setState(() {
                          isLoading = false;
                        });
                        value.addPetModel.type = value.addPetModel.type;
                        value.addPetModel.name = value.nameCan.text.toString();
                        value.addPetModel.parentName =
                            value.parentNmaeCan.text.toString();
                        value.addPetModel.breed = selectBreed;
                        value.addPetModel.dob = value.selectAtdate.toString();
                        value.addPetModel.weight =
                            value.weightDropdoun.toString();
                        value.addPetModel.gender = value.gender.toString();
                        // value.addPetModel.addPetIamge =
                        //     File(value.SelectImage!.path

                        // print(value.addPetModel.type.toString());
                        // print(value.addPetModel.name.toString());
                        // print(value.addPetModel.parentName.toString());
                        // print(value.addPetModel.breed.toString());
                        // print(value.addPetModel.gender.toString());
                        // print(value.addPetModel.dob.toString());
                        // print(value.addPetModel.weight.toString());
                        value.currentIndex;
                        controller.nextPage(
                            duration: _kDuration, curve: _kCurve);

                        // print(value.CurrentIndex);

                        value.currentIndex == 2
                            ? (widget.isEdit
                                ? editPetApi(
                                    value.addPetModel.type.toString(),
                                    value.addPetModel.name.toString(),
                                    value.addPetModel.parentName.toString(),
                                    value.addPetModel.breed.toString(),
                                    value.addPetModel.gender.toString(),
                                    value.addPetModel.weight.toString(),
                                    value.addPetModel.dob.toString(),
                                    File(
                                      value.selectImage!.path,
                                    ),
                                    File(value.selectImage!.path),
                                    value.selectImage!.path.toString(),
                                    value.selectImage!.path.toString(),
                                  ).then((value) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            backgroundColor: GREEN_CLR,
                                            content:
                                                Text(editpetmsg.toString())));

                                    Navigate_replace(context, const My_Pets());
                                  }).catchError((e) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            backgroundColor: GREEN_CLR,
                                            content: Text(e.toString())));
                                    print(e.toString());
                                  })
                                : isLoading == true
                                    ? const Center(
                                        child: CircularProgressIndicator())
                                    : addPetApi(
                                            value.addPetModel.type.toString(),
                                            value.addPetModel.name.toString(),
                                            value.addPetModel.parentName
                                                .toString(),
                                            value.addPetModel.breed.toString(),
                                            value.addPetModel.gender.toString(),
                                            value.addPetModel.weight.toString(),
                                            value.addPetModel.dob.toString(),
                                            File(
                                              value.selectImage!.path,
                                            ),
                                            File(value.selectImage!.path))
                                        .then((value) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                backgroundColor: GREEN_CLR,
                                                content: Text(
                                                    addpetmsg.toString())));

                                        Navigate_replace(
                                            context, const My_Pets());
                                      }).catchError((e) {
                                        setState(() {
                                          isLoading = false;
                                        });
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                backgroundColor: GREEN_CLR,
                                                content: Text(e.toString())));
                                        print(e.toString());
                                      }))
                            : Container();

                        setState(() {
                          isLoading = false;
                        });
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
