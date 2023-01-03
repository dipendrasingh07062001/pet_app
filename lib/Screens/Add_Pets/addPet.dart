import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pet_app/Api/Models/addPetModel.dart';
import 'package:pet_app/Api/Services.dart';
import 'package:pet_app/Componants/Images&Icons.dart';
import 'package:pet_app/Screens/Add_Pets/Add_pet2.dart';
import 'package:pet_app/Screens/HOME/Home.dart';
import 'package:pet_app/Screens/My_Pets/My_Pets.dart';
import 'package:provider/provider.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import '../../Api/Models/My_pet_model.dart';
import '../../Colors/COLORS.dart';
import '../../Provider/Provider.dart';
import '../../Provider/ServiceListProvider.dart';
import '../../UTILS/Utils.dart';
import 'AddPet3.dart';
import 'addPet1.dart';

class AddPetpage extends StatefulWidget {
  MypetListdata? editPetModel;
  bool isedit;

  AddPetpage({Key? key, this.editPetModel, required this.isedit})
      : super(key: key);

  State<AddPetpage> createState() => _AddPetpageState();
}

class _AddPetpageState extends State<AddPetpage> {
  static const _kDuration = Duration(milliseconds: 200);
  static const _kCurve = Curves.ease;
  bool isLoading = false;

  var h;
  var w;
  // int currentIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    disposAddpetModle();
    if (widget.isedit) {
      AddPetModel.isedit = true;
      AddPetModel.type = widget.editPetModel!.type;
      AddPetModel.petId = widget.editPetModel!.id.toString();
      AddPetModel.name = widget.editPetModel!.name;
      AddPetModel.breed = widget.editPetModel!.breed;
      AddPetModel.gender = widget.editPetModel!.gendar;
      AddPetModel.weight = widget.editPetModel!.weight;
      AddPetModel.parentName = widget.editPetModel!.parentname;
      AddPetModel.dob = widget.editPetModel!.dob;
      // AddPetModel.uploadDocumnt = widget.editPetModel!.uploadDocumnt;
      // AddPetModel.addPetIamge = AddPetModel.addPetIamge;
      AddPetModel.editimage = widget.editPetModel!.image;
      AddPetModel.editdoc = widget.editPetModel!.uploaddocument;
    }

    getBreedApi().whenComplete(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    if (widget.editPetModel != null) {
      // Provider.of<AddPetProvider>(context).getvalues(widget.editPetModel!);
    }
    return Scaffold(
      backgroundColor: WHITE70_CLR,
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            // if (value.currentIndex == 1 || value.currentIndex == 2) {
            //   value.currentIndex = 0;
            // }
            if (context.read<CurrentPage>().currentIndex == 0) {
              Navigator.of(context).pop();
              return;
            }
            if (context.read<CurrentPage>().currentIndex == 1) {
              context
                  .read<CurrentPage>()
                  .controller
                  .previousPage(duration: _kDuration, curve: Curves.easeIn);
              context.read<CurrentPage>().decreament();
              return;
            }
            if (context.read<CurrentPage>().currentIndex == 2) {
              context
                  .read<CurrentPage>()
                  .controller
                  .previousPage(duration: _kDuration, curve: Curves.easeIn);
              context.read<CurrentPage>().decreament();
              return;
            }
            // print(value.currentIndex);
          },
        ),
        centerTitle: true,
        toolbarHeight: 65,
        backgroundColor: WHITE70_CLR,
        elevation: 1,
        title: styleText(widget.isedit ? "Edit Pet" : ADD_PETS, DARK_CLR,
            FontWeight.bold, 16),
      ),
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding:
            EdgeInsets.only(top: h * 0.020, left: w * 0.050, right: w * 0.050),
        child: Stack(
          children: [
            PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              controller: context.read<CurrentPage>().controller,
              onPageChanged: (value) {}, //value.onChangedPage,
              itemBuilder: (context, position) {
                return [const AddPets(), const AddPet2(), const Addpet3()][
                    context
                        .read<CurrentPage>()
                        .currentIndex]; //value.pages[position];
              },
              itemCount: 3,
            ),
            Container(
                margin: EdgeInsets.only(top: h * 0.165),
                child: styleText(
                    [
                      "Select Type",
                      "Fill the Details",
                      "Upload Pictures"
                    ][context.read<CurrentPage>().currentIndex],
                    DARK_CLR,
                    FontWeight.bold,
                    19)),
            Consumer<CurrentPage>(
              builder: (context, value, child) {
                return Container(
                  padding: const EdgeInsets.all(1),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: GREEN_CLR, width: 1.5)),
                  margin: EdgeInsets.only(top: h * 0.130),
                  child: StepProgressIndicator(
                    direction: Axis.horizontal,
                    selectedSize: 12,
                    totalSteps: 3,
                    currentStep: value.currentIndex + 1,
                    size: 10,
                    selectedColor: GREEN_CLR,
                    unselectedColor: WHITE70_CLR,
                    roundedEdges: const Radius.circular(20),
                  ),
                );
              },
            ),
            Visibility(
              visible: context.read<CurrentPage>().currentIndex != 0,
              child: Container(
                  padding: const EdgeInsets.only(bottom: 35),
                  alignment: Alignment.bottomCenter,
                  child: isLoading
                      ? loader
                      : MaterialButton(
                          elevation: 0,
                          minWidth: w * 0.55,
                          height: h * 0.057,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side:
                                  context.watch<CurrentPage>().currentIndex == 2
                                      ? const BorderSide(color: GREEN_CLR)
                                      : const BorderSide(
                                          color: Colors.transparent)),
                          color:
                              //currentIndex == 2
                              //     ? (selectImage == null ? WHITE_CLR : GREEN_CLR)
                              //     :
                              GREEN_CLR,
                          onPressed: () {
                            // value.addPetModel.type = value.addPetModel.type;
                            // value.addPetModel.name = value.nameCan.text.toString();
                            // value.addPetModel.parentName =
                            //     value.parentNmaeCan.text.toString();
                            // value.addPetModel.breed = selectBreed;
                            // // value.addPetModel.dob = value.selectAtdate.toString();
                            // value.addPetModel.weight =
                            //     value.weightDropdoun.toString();
                            // value.addPetModel.gender = value.gender.toString();

                            // value.currentIndex;
                            if (context.read<CurrentPage>().currentIndex == 0) {
                              if (AddPetModel.type == null) {
                                customSnackbar(context, "Please select type");
                                return;
                              }
                            }
                            if (context.read<CurrentPage>().currentIndex == 1) {
                              if (AddPetModel.name == null) {
                                customSnackbar(context, "Please enter name");
                                return;
                              }
                              if (AddPetModel.parentName == null) {
                                customSnackbar(
                                    context, "Please enter parent name");
                                return;
                              }
                              if (AddPetModel.breed == null) {
                                customSnackbar(context, "Please select breed");
                                return;
                              }
                              if (AddPetModel.gender == null) {
                                customSnackbar(context, "Please select gender");
                                return;
                              }
                              if (AddPetModel.weight == null) {
                                customSnackbar(context, "Please select weight");
                                return;
                              }
                              if (AddPetModel.dob == null) {
                                customSnackbar(
                                    context, "Please select date of birth");
                                return;
                              }
                              // if (AddPetModel.uploadDocumnt == null &&
                              //     AddPetModel.editdoc == null) {
                              //   customSnackbar(
                              //       context, "Please pick pet document");
                              //   return;
                              // }
                            }
                            // if (context.read<CurrentPage>().currentIndex == 2) {
                            //   if (AddPetModel.addPetIamge == null &&
                            //       AddPetModel.editimage == null) {
                            //     customSnackbar(
                            //         context, "Please pick pet image");
                            //     return;
                            //   }
                            // }
                            if (context.read<CurrentPage>().currentIndex < 2) {
                              context.read<CurrentPage>().controller.nextPage(
                                  duration: _kDuration, curve: Curves.easeIn);
                              context.read<CurrentPage>().increament();
                              // setState(() {});
                              return;
                            }
                            if (context.read<CurrentPage>().currentIndex == 2) {
                              if (widget.isedit) {
                                setState(() {
                                  isLoading = true;
                                });
                                editPetApi(
                                  AddPetModel.petId ?? "",
                                  AddPetModel.type.toString(),
                                  AddPetModel.name.toString(),
                                  AddPetModel.parentName.toString(),
                                  AddPetModel.breed!.id.toString(),
                                  AddPetModel.gender.toString(),
                                  AddPetModel.weight.toString(),
                                  AddPetModel.dob.toString(),
                                  AddPetModel.addPetIamge,
                                  AddPetModel.editimage,
                                  AddPetModel.uploadDocumnt ?? null,
                                ).then((valu) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          backgroundColor: GREEN_CLR,
                                          content:
                                              Text(editpetmsg.toString())));
                                  setState(() {
                                    isLoading = false;
                                  });
                                  mypetApi().whenComplete(() {
                                    Navigate_PushRemove(context, Home());
                                    Navigate_to(context, My_Pets());
                                  });
                                }).catchError((e) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          backgroundColor: GREEN_CLR,
                                          content: Text(e.toString())));
                                  print(e.toString());
                                });
                              } else {
                                setState(() {
                                  isLoading = true;
                                });
                                addPetApi(
                                        AddPetModel.type.toString(),
                                        AddPetModel.name.toString(),
                                        AddPetModel.parentName.toString(),
                                        AddPetModel.breed!.id.toString(),
                                        AddPetModel.gender.toString(),
                                        AddPetModel.weight.toString(),
                                        AddPetModel.dob.toString(),
                                        AddPetModel.addPetIamge,
                                        AddPetModel.uploadDocumnt ?? null)
                                    .then((valu) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          backgroundColor: GREEN_CLR,
                                          content: Text(addpetmsg.toString())));
                                  setState(() {
                                    isLoading = false;
                                  });
                                  mypetApi().whenComplete(() {
                                    Navigate_PushRemove(context, Home());
                                    Navigate_to(context, My_Pets());
                                  });
                                }).catchError((e) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          backgroundColor: GREEN_CLR,
                                          content: Text(e.toString())));
                                  print(e.toString());
                                });
                              }
                            }

                            // print(value.currentIndex);
                            // value.currentIndex == 2
                            //     ? addPetApi(
                            //             value.addPetModel.type.toString(),
                            //             value.addPetModel.name.toString(),
                            //             value.addPetModel.parentName.toString(),
                            //             value.addPetModel.breed.toString(),
                            //             value.addPetModel.gender.toString(),
                            //             value.addPetModel.weight.toString(),
                            //             value.addPetModel.dob.toString(),
                            //             File(
                            //               value.selectImage!.path,
                            //             ),
                            //             File(value.selectImage!.path))
                            //         .then((valu) {
                            //         value.currentIndex = 0;
                            //         ScaffoldMessenger.of(context).showSnackBar(
                            //             SnackBar(
                            //                 backgroundColor: GREEN_CLR,
                            //                 content: Text(addpetmsg.toString())));
                            //         mypetApi().whenComplete(() {
                            //           Navigate_PushRemove(context, Home());
                            //           Navigate_to(context, My_Pets());
                            //           Provider.of<AddPetProvider>(context)
                            //               .dispose();
                            //         });
                            //       }).catchError((e) {
                            //         ScaffoldMessenger.of(context).showSnackBar(
                            //             SnackBar(
                            //                 backgroundColor: GREEN_CLR,
                            //                 content: Text(e.toString())));
                            //         print(e.toString());
                            //       })
                            //     : Container();
                          },
                          child: styleText(
                              // currentIndex == 2
                              //     ? (selectImage == null
                              //         ? SKIP_CONTINUE
                              //         : FINISH)
                              //     :
                              CONTINUE,
                              // value.currentIndex == 2
                              //     ? (value.selectImage == null
                              //         ?
                              // GREEN_CLR,
                              //         : WHITE_CLR)
                              //     :
                              WHITE_CLR,
                              FontWeight.normal,
                              15))),
            )
          ],
        ),
      ),
    );
  }
}
