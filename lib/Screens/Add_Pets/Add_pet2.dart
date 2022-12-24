import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_app/Api/Models/addPetModel.dart';
import 'package:pet_app/Api/Models/getBreedModel.dart';
import 'package:pet_app/Provider/Provider.dart';
import 'package:pet_app/Provider/ServiceListProvider.dart';
import 'package:provider/provider.dart';
import '../../Api/Services.dart';
import '../../Colors/COLORS.dart';
import '../../Componants/Images&Icons.dart';
import '../../UTILS/Utils.dart';

String? selectBreed;

class AddPet2 extends StatefulWidget {
  const AddPet2({super.key});

  @override
  State<AddPet2> createState() => _AddPet2State();
}

class _AddPet2State extends State<AddPet2> {
  GetBreedModel breedModel = GetBreedModel();
  @override
  void initState() {
    super.initState();

    if (AddPetModel.breed == null) {
      breedModel.name = "Select Breed";

      breedlist.insert(0, breedModel);
    } else {
      breedModel = AddPetModel.breed!;
    }
    // breedlist.insert(0, breedModel);
    weightDropdoun = AddPetModel.weight ?? 'Weight';
    // setState(() {
    //   breedLoading = true;
    // });

    if (AddPetModel.name != null) {
      nameCan.text = AddPetModel.name!;
    }
    if (AddPetModel.parentName != null) {
      parentNmaeCan.text = AddPetModel.parentName!;
    }
    if (AddPetModel.gender != null) {
      gender = AddPetModel.gender!;
    }
    if (AddPetModel.uploadDocumnt != null) {
      selectImage = XFile(AddPetModel.uploadDocumnt!.path);
    }
    breedlistreduser(breedlist);
  }

  breedlistreduser(List<GetBreedModel> list) {
    if (list[0].name == list[1].name) {
      breedlist.removeAt(1);
      breedlistreduser(breedlist);
    } else {
      return list;
    }
  }

  String picktype = "";
  final weightItems = [
    'Weight',
    '10',
    '15',
    '20',
    '25',
    '30',
    '35',
    '40',
    '45',
    '50',
    '55',
    '60'
  ];
  XFile? selectImage = null;
  String weightDropdoun = '';
  String gender = '';
  var h;
  var w;
  TextEditingController nameCan = TextEditingController();
  TextEditingController parentNmaeCan = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final UpadteValue = Provider.of<AddPetProvider>(context, listen: true);

    // String joningdate = DateFormat.yMMMd().format(UpadteValue.currentdate1);

    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(top: h * 0.195),
      child: breedLoading
          ? loader
          : SingleChildScrollView(
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
                        onChanged: ((value) {
                          AddPetModel.name = value;
                        }),
                        decoration: const InputDecoration(
                            errorText: "",
                            errorStyle: TextStyle(height: 0),
                            hintText: "Pet Name",
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
                        onChanged: (value) {
                          AddPetModel.parentName = value;
                        },
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
                  breedLoading
                      ? loader
                      : Container(
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
                                  AddPetModel.breed = breedModel;
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
                                                  color: GRAY_CLR,
                                                  fontSize: 14),
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
                            groupValue: gender,
                            onChanged: (value) {
                              setState(() {
                                gender = value!;
                                AddPetModel.gender = gender;
                              });
                            } // value.onValueChange),
                            ),
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
                          groupValue: gender,
                          onChanged: (value) {
                            setState(() {
                              gender = value!;
                              AddPetModel.gender = gender;
                            });
                          },
                        ),
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
                        value: weightDropdoun,
                        onChanged: (String? newValue) => setState(() {
                          weightDropdoun = newValue!;
                          AddPetModel.weight = weightDropdoun;
                        }),
                        items: weightItems
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
                  Consumer<ProviderTutorial>(
                      builder: (BuildContext context, value, Widget? child) {
                    return GestureDetector(
                      onTap: () async {
                        await value.datePicker(context).whenComplete(() {
                          AddPetModel.dob = value.selectAtdate;
                        });
                      },
                      child: Container(
                        height: h * 0.06,
                        margin: EdgeInsets.only(top: h * 0.020),
                        decoration: BoxDecoration(
                            color: WHITE_CLR,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: BORDER_CLR, width: 1)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  value.selectAtdate == null
                                      ? AddPetModel.dob ?? "Select date"
                                      : AddPetModel.dob ??
                                          value.selectAtdate.toString(),
                                  style: const TextStyle(
                                      color: GRAY_CLR, fontSize: 14),
                                ),
                                Icon(
                                  Icons.calendar_month,
                                  color: GRAY_CLR.withOpacity(0.5),
                                  size: 18,
                                )
                              ]),
                        ),
                      ),
                    );
                  }),
                  SizedBox(
                    height: 10,
                  ),
                  Visibility(
                    visible: picktype == "doc" && selectImage != null,
                    child: Text(
                      selectImage != null ? selectImage!.name : "",
                      style: const TextStyle(
                          color: GRAY_CLR,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                      alignment: Alignment.center,
                      height: h * 0.15,
                      width: w * 1,
                      margin: EdgeInsets.only(top: h * 0.010),
                      decoration: BoxDecoration(
                          color: WHITE70_CLR,
                          image: DecorationImage(
                              image: AddPetModel.isedit &&
                                      AddPetModel.editdoc!.isNotEmpty
                                  ? NetworkImage(AddPetModel.editdoc!)
                                  : NetworkImage(""),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: TFFBORDER_CLR)),
                      child: selectImage == null || picktype == "doc"
                          ? GestureDetector(
                              onTap: () {
                                // Opengallery(context);
                                // pickdocFile().then((value) {
                                //   if (value != null) {
                                //     selectImage = XFile(value);
                                //   }
                                // });
                                askwhich();
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
                                // Opengallery(context);

                                askwhich();
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.file(
                                  File(
                                    selectImage!.path,
                                  ),
                                  scale: 1.0,
                                  fit: BoxFit.cover,
                                  // height: 100,
                                  width: w * 1,
                                ),
                              ),
                            ))
                ],
              ),
            ),
    );
  }

  Opengallery(BuildContext context) async {
    final GalleryImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (GalleryImage != null) {
      selectImage = GalleryImage;
      AddPetModel.uploadDocumnt = File(selectImage!.path);
      setState(() {});
    }
  }

  Future askwhich() async {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Column(
              children: [
                Text(
                  "Pick one options",
                  style: TextStyle(color: BLACK_CLR),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: GREEN_CLR,
                          padding: EdgeInsets.all(8),
                        ),
                        onPressed: () async {
                          Navigator.pop(context);
                          await pickimageFile().then((value) {
                            if (value != null) {
                              selectImage = XFile(value);
                              AddPetModel.uploadDocumnt =
                                  File(selectImage!.path);
                            }
                          });
                          setState(() {
                            picktype = "image";
                          });
                        },
                        child: Text(
                          "Image",
                          style: TextStyle(color: WHITE_CLR),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: GREEN_CLR,
                          padding: EdgeInsets.all(8),
                        ),
                        onPressed: () async {
                          Navigator.pop(context);
                          await pickdocFile().then((value) {
                            if (value != null) {
                              selectImage = XFile(value);
                              AddPetModel.uploadDocumnt =
                                  File(selectImage!.path);
                            }
                          });
                          setState(() {
                            picktype = "doc";
                          });
                        },
                        child: Text(
                          "Document",
                          style: TextStyle(color: WHITE_CLR),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
