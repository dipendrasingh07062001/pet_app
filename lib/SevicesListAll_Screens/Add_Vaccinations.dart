import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:pet_app/Api/Models/v_model.dart';
import 'package:pet_app/Api/Models/vaccinationModel.dart';
import 'package:pet_app/Api/Prefrence.dart';
import 'package:pet_app/Api/Services.dart';
import 'package:pet_app/SevicesListAll_Screens/Vactionations.dart';
import '../Colors/COLORS.dart';
import '../Componants/Images&Icons.dart';
import '../UTILS/Utils.dart';

class Add_Vaccinations extends StatefulWidget {
  bool isEditVaccination;
  VaccinationMaodelList? editVaccinationmodeldata;
  Add_Vaccinations(
      {super.key,
      required this.isEditVaccination,
      this.editVaccinationmodeldata});

  @override
  State<Add_Vaccinations> createState() => _Add_VaccinationsState();
}

class _Add_VaccinationsState extends State<Add_Vaccinations> {
  VModel vmodel = VModel();
  File? imageFile;
  String editImage = "";
  String picktype = "";
  String day = '1';

  final SelectDay = ['1', '2', '3', '4', '5', "6", "7", "8", "9", "10"];
  final Selectremind = [
    '1',
    '2',
    '3',
    '4',
    '5',
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12"
  ];
  @override
  void initState() {
    super.initState();
    vmodel.name = "---Select Vaccinations---";
    vaccinationList.clear();
    vaccinationList.add(vmodel);
    getVaccinationApi().whenComplete(() {
      setState(() {});
    });

    if (widget.isEditVaccination) {
      vmodel.id = widget.editVaccinationmodeldata!.vaccinationid!.id;
      vmodel.name = widget.editVaccinationmodeldata!.vaccinationid!.name;
      vmodel.status = widget.editVaccinationmodeldata!.vaccinationid!.status;

      selectStatus =
          widget.editVaccinationmodeldata!.vaccinationstatus.toString();
      // vaccinationdate =
      //     widget.editVaccinationmodeldata!.vaccinationdate!.isEmpty
      //         ? ""
      //         : widget.editVaccinationmodeldata!.vaccinationdate!.last;
      // editImage =
      //     widget.editVaccinationmodeldata!.vaccinationcertificate!.isEmpty
      //         ? ""
      //         : widget.editVaccinationmodeldata!.vaccinationcertificate!.last;
      reminder = widget.editVaccinationmodeldata!.reminder.toString();
      atdate = widget.editVaccinationmodeldata!.atdate.toString();
      attime = widget.editVaccinationmodeldata!.attime.toString();
      day = widget.editVaccinationmodeldata!.dose!;
    }
  }

  String selectStatus = '---Select Status---';
  final selectStatusitems = [
    '---Select Status---',
    'true',
    'false',
  ];

  String? vaccinationdate;
  String? atdate;
  String? attime;

  String reminder = "1";

  var h;
  var w;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    // addvaccination = false;
    return Scaffold(
      backgroundColor: WHITE70_CLR,
      appBar: DefaultAppBar(
          widget.isEditVaccination ? "Edit Vaccination" : ADD_VACCINATION),
      body: Padding(
        padding: EdgeInsets.only(
          left: w * 0.030,
          right: w * 0.030,
          top: h * 0.020,
        ),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            styleText(VACCINATION_NAME, BLACK_CLR, FontWeight.normal, 15),
            Container(
              height: h * 0.06,
              width: w,
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: h * 0.010),
              decoration: BoxDecoration(
                  color: WHITE_CLR,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: BORDER_CLR, width: 1)),
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 5),
                child: widget.isEditVaccination
                    ? Text(
                        vmodel.name.toString(),
                        style: const TextStyle(color: GRAY_CLR, fontSize: 14),
                      )
                    : DropdownButton<VModel?>(
                        isExpanded: true,
                        borderRadius: BorderRadius.circular(10),
                        underline: const SizedBox(),
                        value: vmodel,
                        onChanged: (newValue) {
                          vmodel = newValue!;
                          setState(() {});
                          print("id......" + vmodel.id.toString());
                        },
                        items:
                            //  vaccinationList.map((e) => e).toList()
                            vaccinationList
                                .map<DropdownMenuItem<VModel>>(
                                    (VModel value) => DropdownMenuItem<VModel>(
                                          value: value,
                                          child: Text(
                                            value.name.toString(),
                                            style: const TextStyle(
                                                color: GRAY_CLR, fontSize: 14),
                                          ),
                                        ))
                                .toList(),
                        icon: Icon(
                          Icons.keyboard_arrow_down_sharp,
                          color: GRAY_CLR.withOpacity(0.5),
                          size: 25,
                        ),
                        iconSize: 30,
                      ),
              ),
            ),
            SizedBox(
              height: h * 0.020,
            ),
            Visibility(
              visible: widget.isEditVaccination,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  styleText(
                      VACCINATION_STATUS, BLACK_CLR, FontWeight.normal, 15),
                  Container(
                    height: h * 0.06,
                    width: w,
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(top: h * 0.010),
                    decoration: BoxDecoration(
                        color: WHITE_CLR,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: BORDER_CLR, width: 1)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 5),
                      child: widget.isEditVaccination
                          ? Text(
                              selectStatus,
                              style: const TextStyle(
                                  color: GRAY_CLR, fontSize: 14),
                            )
                          : DropdownButton<String>(
                              isExpanded: true,
                              borderRadius: BorderRadius.circular(10),
                              underline: const SizedBox(),
                              value: selectStatus,
                              onChanged: (String? newValue) =>
                                  setState(() => selectStatus = newValue!),
                              items: selectStatusitems
                                  .map<DropdownMenuItem<String>>(
                                      (String value) =>
                                          DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(
                                              value,
                                              style: const TextStyle(
                                                  color: GRAY_CLR,
                                                  fontSize: 14),
                                            ),
                                          ))
                                  .toList(),
                              icon: Icon(
                                Icons.keyboard_arrow_down_sharp,
                                color: GRAY_CLR.withOpacity(0.5),
                                size: 25,
                              ),
                              iconSize: 30,
                            ),
                    ),
                  ),
                  SizedBox(
                    height: h * 0.020,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                styleText(DOSE_DAY, BLACK_CLR, FontWeight.normal, 15),
                Container(
                  height: h * 0.06,
                  width: w * 0.3,
                  margin: EdgeInsets.only(top: h * 0.010),
                  decoration: BoxDecoration(
                      color: WHITE_CLR,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: BORDER_CLR, width: 1)),
                  alignment: Alignment.center,
                  child: widget.isEditVaccination
                      ? Text(
                          day,
                          style: TextStyle(color: PLACE_H_CLR, fontSize: 14),
                        )
                      : Padding(
                          padding:
                              const EdgeInsets.only(left: 15, right: 5, top: 3),
                          child: DropdownButton<String>(
                            isExpanded: true,
                            borderRadius: BorderRadius.circular(10),
                            underline: SizedBox(),
                            value: day,
                            onChanged: (String? newValue) =>
                                setState(() => day = newValue!),
                            items: SelectDay.map<DropdownMenuItem<String>>(
                                (String value) => DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: TextStyle(
                                            color: PLACE_H_CLR, fontSize: 14),
                                      ),
                                    )).toList(),
                            icon: Image.asset(
                              UPDOUN_ICON,
                              color: GRAY_CLR.withOpacity(0.5),
                              height: 25,
                            ),
                            iconSize: 30,
                          ),
                        ),
                ),
              ],
            ),
            styleText(VACCINATION_DATE, BLACK_CLR, FontWeight.normal, 15),
            customDateContainer(context, () {
              cutomDatePicker(context).then((value) {
                setState(() {
                  vaccinationdate = DateFormat('yyyy-MM-DD').format(value!);
                });
              });
            },
                vaccinationdate == null || vaccinationdate == ""
                    ? "YYYY-MM-DD"
                    : vaccinationdate.toString()),
            SizedBox(
              height: h * 0.020,
            ),
            styleText(
                VACCINATION_CERTIFICATE, BLACK_CLR, FontWeight.normal, 15),
            Visibility(
              visible: picktype == "doc" && imageFile != null,
              child: Text(
                imageFile != null ? imageFile!.path.split("/").last : "",
                style: const TextStyle(
                    color: GRAY_CLR, fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            Visibility(
              visible: widget.isEditVaccination && editImage != "",
              child: Text(
                editImage,
                style: const TextStyle(
                    color: GRAY_CLR, fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
                alignment: Alignment.center,
                height: h * 0.15,
                width: w * 1,
                margin: EdgeInsets.only(top: h * 0.010),
                decoration: BoxDecoration(
                    color: WHITE70_CLR,
                    image:
                        editImage != "" && imageFile == null || picktype == ""
                            ? DecorationImage(
                                image: NetworkImage(editImage),
                                fit: BoxFit.cover,
                              )
                            : null,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: TFFBORDER_CLR)),
                child: imageFile == null || picktype != "image"
                    ? GestureDetector(
                        onTap: () {
                          setState(() {
                            askwhich();
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(UPLOAD_ICON),
                            SizedBox(
                              height: h * 0.015,
                            ),
                            styleText("Upload Certificate", GRAY_CLR,
                                FontWeight.normal, 14)
                          ],
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          setState(() {
                            askwhich();
                          });
                        },
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.file(
                              File(
                                imageFile!.path,
                              ),
                              scale: 1.0,
                              fit: BoxFit.cover,
                              width: w * 1,
                            )),
                      )),
            SizedBox(
              height: h * 0.025,
            ),
            styleText(REMINDER, BLACK_CLR, FontWeight.normal, 15),
            SizedBox(
              height: h * 0.015,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // mainAxisAlignment: MainAxisAlignment.start,
              // alignment: WrapAlignment.spaceBetween,

              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      customradioButton("3", reminder, (value) {
                        setState(() {
                          reminder = value.toString();
                        });
                      }),
                      SizedBox(
                        width: w * 0.020,
                      ),
                      const Text(
                        "3 Months",
                        style: TextStyle(color: GRAY_CLR),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      customradioButton("6", reminder, (value) {
                        setState(() {
                          reminder = value.toString();
                        });
                      }),
                      SizedBox(
                        width: w * 0.020,
                      ),
                      const Text(
                        "6 Months",
                        style: TextStyle(color: GRAY_CLR),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      customradioButton("9", reminder, (value) {
                        setState(() {
                          reminder = value.toString();
                        });
                      }),
                      SizedBox(
                        width: w * 0.020,
                      ),
                      const Text(
                        "9 Months",
                        style: TextStyle(color: GRAY_CLR),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: h * 0.030,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      customradioButton("12", reminder, (value) {
                        setState(() {
                          reminder = value.toString();
                        });
                      }),
                      SizedBox(
                        width: w * 0.020,
                      ),
                      const Text(
                        "12 Months",
                        style: TextStyle(color: GRAY_CLR),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: h * 0.04,
                  width: w * 0.3,
                  margin: EdgeInsets.only(top: h * 0.010),
                  decoration: BoxDecoration(
                      color: WHITE_CLR,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: BORDER_CLR, width: 1)),
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 5, top: 3),
                    child: DropdownButton<String>(
                      isExpanded: true,
                      borderRadius: BorderRadius.circular(10),
                      underline: SizedBox(),
                      value: reminder,
                      onChanged: (String? newValue) =>
                          setState(() => reminder = newValue!),
                      items: Selectremind.map<DropdownMenuItem<String>>(
                          (String value) => DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(
                                      color: PLACE_H_CLR, fontSize: 14),
                                ),
                              )).toList(),
                      icon: Text(
                        " Months ",
                        style: TextStyle(color: GRAY_CLR, height: 0.9),
                      ),
                      // iconSize: 30,
                    ),
                  ),
                ),
                SizedBox(
                  width: w * 0.260,
                ),
              ],
            ),
            SizedBox(
              height: h * 0.030,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: w * 0.45,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      styleText(AT_DATE, BLACK_CLR, FontWeight.normal, 15),
                      customDateContainer(context, () {
                        cutomDatePicker(context).then((value) {
                          setState(() {
                            atdate = DateFormat('yyyy-MM-dd').format(value!);
                          });
                        });
                      }, atdate == null ? "YYYY-MM-DD" : atdate.toString())
                    ],
                  ),
                ),
                SizedBox(
                  width: w * 0.45,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      styleText(AT_TIME, BLACK_CLR, FontWeight.normal, 15),
                      customDateContainer(context, () {
                        showTime(context).then((value) {
                          setState(() {
                            attime = value.format(context);
                          });
                        });
                      }, attime == null ? "00:00 AM" : attime.toString())
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: h * 0.035,
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: addvaccination || iseditvaccion
                    ? loader
                    : DefaultButton(
                        text: DONE,
                        ontap: () async {
                          if (widget.isEditVaccination) {
                            setState(() {
                              iseditvaccion = true;
                            });
                            await editVaccinationApi(
                                    vmodel.id.toString(),
                                    selectStatus.toString(),
                                    vaccinationdate.toString(),
                                    imageFile != null
                                        ? File(
                                            imageFile!.path,
                                          )
                                        : File(""),
                                    reminder.toString(),
                                    atdate.toString(),
                                    attime.toString(),
                                    day,
                                    editImage)
                                .then((value) {
                              Preference.Pref.setInt(
                                  'vaccinationId', value['data']['id']);
                              customSnackbar(
                                  context, value['message'].toString());
                              Navigate_replace(context, const Vaccinations());
                              setState(() {
                                iseditvaccion = false;
                              });
                            }).catchError((e) {
                              customSnackbar(context, e.toString());
                              setState(() {
                                iseditvaccion = false;
                              });
                            });
                            setState(() {
                              iseditvaccion = false;
                            });
                          } else {
                            if (addVaccinationValidation()) {
                              setState(() {
                                addvaccination = true;
                              });
                              await addVaccinationApi(
                                vmodel.id.toString(),
                                // selectStatus.toString(),
                                vaccinationdate.toString(),
                                imageFile != null
                                    ? File(
                                        imageFile!.path,
                                      )
                                    : File(""),
                                reminder.toString(),
                                atdate.toString(),
                                attime.toString(),
                                day,
                              ).then((value) {
                                Preference.Pref.setInt(
                                    'vaccinationId', value['data']['id']);
                                customSnackbar(
                                    context, value['message'].toString());
                                Navigate_replace(context, const Vaccinations());
                                setState(() {
                                  addvaccination = false;
                                });
                              }).catchError((e) {
                                customSnackbar(context, e.toString());
                                setState(() {
                                  addvaccination = false;
                                });
                              });
                              setState(() {
                                addvaccination = false;
                              });
                            }
                          }
                        },
                        fontsize: 15,
                        height: h * 0.060,
                        width: w * 0.8)),
            SizedBox(
              height: h * 0.035,
            ),
          ]),
        ),
      ),
    );
  }

  addVaccinationValidation() {
    if (vmodel.name == "---Select Vaccinations---") {
      customSnackbar(context, "Please select vaccination name");
      return false;
    } else if (vaccinationdate != null && imageFile?.path == null) {
      customSnackbar(context, "Please select vaccination certificate");
      return false;
    } else if (atdate == null) {
      customSnackbar(context, "Please select at date");
      return false;
    } else if (attime == null) {
      customSnackbar(context, "Please select at time");
      return false;
    }
    return true;
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
                              imageFile = File(value);
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
                              imageFile = File(value);
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
