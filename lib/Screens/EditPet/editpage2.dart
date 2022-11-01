import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pet_app/Api/Models/getBreedModel.dart';
import 'package:pet_app/Provider/Provider.dart';
import 'package:pet_app/Provider/ServiceListProvider.dart';
import 'package:pet_app/Screens/EditPet/EditPage.dart';
import 'package:provider/provider.dart';
import '../../Api/Services.dart';
import '../../Colors/COLORS.dart';
import '../../Componants/Images&Icons.dart';
import '../../UTILS/Utils.dart';

String? selectBreed;

class EditPet2 extends StatefulWidget {
  @override
  State<EditPet2> createState() => _EditPet2State();
}

class _EditPet2State extends State<EditPet2> {
  TextEditingController nameCan = TextEditingController();
  TextEditingController parentNmaeCan = TextEditingController();
  GetBreedModel breedModel = GetBreedModel();

  @override
  void initState() {
    super.initState();
    breedModel.name = "Slelect Breeds";
    breedlist.clear();
    breedlist.add(breedModel);
    getBreedApi().whenComplete(() {
      setState(() {});
    });

    nameCan.text = name.toString();
    parentNmaeCan.text = parentName.toString();
  }

  var h;
  var w;

  @override
  Widget build(BuildContext context) {
    // final UpadteValue = Provider.of<AddPetProvider>(context, listen: true);

    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Consumer<AddPetProvider>(
        builder: (BuildContext context, value, Widget? child) {
      return Padding(
        padding: EdgeInsets.only(top: h * 0.195),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 10),
                alignment: Alignment.center,
                height: h * 0.060,
                margin: EdgeInsets.only(top: h * 0.025),
                decoration: BoxDecoration(
                    color: WHITE_CLR,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: BORDER_CLR, width: 1)),
                child: TextFormField(
                    controller: nameCan,
                    decoration: const InputDecoration(
                        errorText: "",
                        errorStyle: TextStyle(height: 0),
                        hintText: "Pet name ",
                        hintStyle: TextStyle(
                            color: GRAY_CLR,
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                        border: InputBorder.none)),
              ),
              Container(
                padding: const EdgeInsets.only(left: 10),
                alignment: Alignment.center,
                height: h * 0.06,
                margin: EdgeInsets.only(top: h * 0.020),
                decoration: BoxDecoration(
                    color: WHITE_CLR,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: BORDER_CLR, width: 1)),
                child: TextFormField(
                    controller: parentNmaeCan,
                    decoration: const InputDecoration(
                        errorText: "",
                        errorStyle: TextStyle(height: 0),
                        hintText: "Pet's Parent Name",
                        hintStyle: TextStyle(
                            color: GRAY_CLR,
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                        border: InputBorder.none)),
              ),
              Container(
                alignment: Alignment.centerLeft,
                height: h * 0.06,
                margin: EdgeInsets.only(top: h * 0.020),
                decoration: BoxDecoration(
                    color: WHITE_CLR,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: BORDER_CLR, width: 1)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: DropdownButton<GetBreedModel?>(
                    isExpanded: true,
                    borderRadius: BorderRadius.circular(10),
                    underline: const SizedBox(),
                    value: breedModel,
                    onChanged: (newValue) {
                      breedModel = newValue!;
                      setState(() {
                        selectBreed = breedModel.name.toString();
                      });

                      // print("id......" + breedModel.id.toString());
                    },
                    items: breedlist
                        .map<DropdownMenuItem<GetBreedModel>>(
                            (GetBreedModel value) =>
                                DropdownMenuItem<GetBreedModel>(
                                  value: value,
                                  child: Text(
                                    value.name.toString(),
                                    style: const TextStyle(
                                        color: GRAY_CLR, fontSize: 14),
                                  ),
                                ))
                        .toList(),

                    // add extra sugar..
                    icon: Icon(
                      Icons.keyboard_arrow_down_sharp,
                      color: GRAY_CLR.withOpacity(0.5),
                      size: 30,
                    ),
                    iconSize: 30,
                  ),
                ),
              ),
              SizedBox(
                height: h * 0.020,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                    height: 20,
                    child: Radio(
                        activeColor: GREEN_CLR,
                        value: 'male',
                        groupValue: value.gender,
                        onChanged: value.onValueChange),
                  ),
                  SizedBox(
                    width: w * 0.010,
                  ),
                  styleText(MALE, GRAY_CLR, FontWeight.normal, 15),
                  SizedBox(
                    width: w * 0.080,
                  ),
                  SizedBox(
                    width: 20,
                    height: 20,
                    child: Radio(
                        activeColor: GREEN_CLR,
                        value: 'female',
                        groupValue: value.gender,
                        onChanged: value.onValueChange),
                  ),
                  SizedBox(
                    width: w * 0.010,
                  ),
                  styleText(FEMALE, GRAY_CLR, FontWeight.normal, 15),
                ],
              ),
              SizedBox(
                height: h * 0.020,
              ),
              Container(
                height: h * 0.06,
                decoration: BoxDecoration(
                    color: WHITE_CLR,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: BORDER_CLR, width: 1)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    borderRadius: BorderRadius.circular(10),
                    underline: const SizedBox(),
                    value: value.weightDropdoun,
                    onChanged: (String? newValue) =>
                        setState(() => value.weightDropdoun = newValue!),
                    items: value.weightItems
                        .map<DropdownMenuItem<String>>(
                            (String value) => DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: const TextStyle(
                                        color: GRAY_CLR, fontSize: 14),
                                  ),
                                ))
                        .toList(),

                    // add extra sugar..
                    icon: Row(
                      children: [
                        const Text(
                          "KG",
                          style: TextStyle(color: GRAY_CLR, fontSize: 15),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down_sharp,
                          color: GRAY_CLR.withOpacity(0.5),
                          size: 30,
                        ),
                      ],
                    ),
                    iconSize: 30,
                  ),
                ),
              ),
              Container(
                height: h * 0.06,
                margin: EdgeInsets.only(top: h * 0.020),
                decoration: BoxDecoration(
                    color: WHITE_CLR,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: BORDER_CLR, width: 1)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Consumer<ProviderTutorial>(
                      builder: (BuildContext context, value, Widget? child) {
                    return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            value.selectAtdate == null
                                ? "Select date"
                                : value.selectAtdate.toString(),
                            style:
                                const TextStyle(color: GRAY_CLR, fontSize: 14),
                          ),
                          GestureDetector(
                              onTap: () {
                                value.datePicker(context);
                              },
                              child: Icon(
                                Icons.calendar_month,
                                color: GRAY_CLR.withOpacity(0.5),
                                size: 18,
                              ))
                        ]);
                  }),
                ),
              ),
              Consumer<AddPetProvider>(
                builder: (BuildContext context, value, Widget? child) {
                  return Container(
                      alignment: Alignment.center,
                      height: h * 0.15,
                      width: w * 1,
                      margin: EdgeInsets.only(top: h * 0.010),
                      decoration: BoxDecoration(
                          color: WHITE70_CLR,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: TFFBORDER_CLR)),
                      child: value.selectImage == null
                          ? GestureDetector(
                              onTap: () {
                                value.Opengallery(context);
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(UPLOAD_ICON),
                                  SizedBox(
                                    height: h * 0.015,
                                  ),
                                  styleText(UPLOAD_DOCUMENT, GRAY_CLR,
                                      FontWeight.normal, 14)
                                ],
                              ),
                            )
                          : GestureDetector(
                              onTap: () {
                                value.Opengallery(context);
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.file(
                                  File(
                                    value.selectImage!.path,
                                  ),
                                  scale: 1.0,
                                  fit: BoxFit.fill,
                                  // height: 100,
                                  width: w * 1,
                                ),
                              ),
                            ));
                },
              ),
            ],
          ),
        ),
      );
    });
  }
}
