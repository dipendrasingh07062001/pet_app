import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:pet_app/Api/Models/v_model.dart';
import 'package:pet_app/Api/Models/vaccinationModel.dart';
import 'package:pet_app/Api/Prefrence.dart';
import 'package:pet_app/Api/Services.dart';
import 'package:pet_app/Provider/ServiceListProvider.dart';
import 'package:pet_app/SevicesListAll_Screens/Vactionations.dart';
import 'package:provider/provider.dart';
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
  String editImage = "";
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
      vmodel.name = widget.editVaccinationmodeldata!.vaccinationid.toString();
      selectStatus =
          widget.editVaccinationmodeldata!.vaccinationstatus.toString();
      vaccinationdate =
          widget.editVaccinationmodeldata!.vaccinationdate.toString();
      // editImage =
      //     widget.editVaccinationmodeldata!.vaccinationcertificate.toString();
      reminder = widget.editVaccinationmodeldata!.reminder.toString();
      atdate = widget.editVaccinationmodeldata!.atdate.toString();
      attime = widget.editVaccinationmodeldata!.attime.toString();
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

  String reminder = "Daily";

  var h;
  var w;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: WHITE70_CLR,
      appBar: DefaultAppBar(ADD_VACCINATION),
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
              margin: EdgeInsets.only(top: h * 0.010),
              decoration: BoxDecoration(
                  color: WHITE_CLR,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: BORDER_CLR, width: 1)),
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 5),
                child: DropdownButton<VModel?>(
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
            styleText(VACCINATION_STATUS, BLACK_CLR, FontWeight.normal, 15),
            Container(
              height: h * 0.06,
              margin: EdgeInsets.only(top: h * 0.010),
              decoration: BoxDecoration(
                  color: WHITE_CLR,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: BORDER_CLR, width: 1)),
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 5),
                child: DropdownButton<String>(
                  isExpanded: true,
                  borderRadius: BorderRadius.circular(10),
                  underline: const SizedBox(),
                  value: selectStatus,
                  onChanged: (String? newValue) =>
                      setState(() => selectStatus = newValue!),
                  items: selectStatusitems
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
            styleText(VACCINATION_DATE, BLACK_CLR, FontWeight.normal, 15),
            customDateContainer(context, () {
              cutomDatePicker(context).then((value) {
                setState(() {
                  vaccinationdate = DateFormat('dd-MM-yyyy').format(value!);
                });
              });
            },
                vaccinationdate == null
                    ? "DD-MM-YYYY"
                    : vaccinationdate.toString()),
            SizedBox(
              height: h * 0.020,
            ),
            styleText(
                VACCINATION_CERTIFICATE, BLACK_CLR, FontWeight.normal, 15),
            Container(
                alignment: Alignment.center,
                height: h * 0.15,
                width: w * 1,
                margin: EdgeInsets.only(top: h * 0.010),
                decoration: BoxDecoration(
                    color: WHITE70_CLR,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: TFFBORDER_CLR)),
                child: selectImage == null || editImage == ""
                    ? GestureDetector(
                        onTap: () {
                          Opengallery(context);
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
                    : Consumer<AddPetProvider>(
                        builder: (BuildContext context, value, Widget? child) {
                        return GestureDetector(
                          onTap: () {
                            value.Opengallery(context);
                          },
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: editImage == ""
                                  ? Image.file(
                                      File(
                                        selectImage!.path,
                                      ),
                                      scale: 1.0,
                                      fit: BoxFit.fill,
                                      // height: 100,
                                      width: w * 1,
                                    )
                                  : Image.network(
                                      editImage, scale: 1.0,
                                      fit: BoxFit.fill,
                                      // height: 100,
                                      width: w * 1,
                                    )),
                        );
                      })),
            SizedBox(
              height: h * 0.025,
            ),
            styleText(REMINDER, BLACK_CLR, FontWeight.normal, 15),
            SizedBox(
              height: h * 0.015,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                customradioButton("Daily", reminder, (value) {
                  setState(() {
                    reminder = value.toString();
                  });
                }),
                SizedBox(
                  width: w * 0.020,
                ),
                const Text(
                  DAILY,
                  style: TextStyle(color: GRAY_CLR),
                ),
                SizedBox(
                  width: w * 0.1,
                ),
                customradioButton("Weekly", reminder, (value) {
                  setState(() {
                    reminder = value.toString();
                  });
                }),
                SizedBox(
                  width: w * 0.020,
                ),
                const Text(
                  WEEKLY,
                  style: TextStyle(color: GRAY_CLR),
                ),
                SizedBox(
                  width: w * 0.1,
                ),
                customradioButton("Monthly", reminder, (value) {
                  setState(() {
                    reminder = value.toString();
                  });
                }),
                SizedBox(
                  width: w * 0.020,
                ),
                const Text(
                  MONTHLY,
                  style: TextStyle(color: GRAY_CLR),
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
                            atdate = DateFormat('dd-MM-yyyy').format(value!);
                          });
                        });
                      }, atdate == null ? "DD-MM-YYYY" : atdate.toString())
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
                    ? CircularProgressIndicator(
                        color: GREEN_CLR,
                      )
                    : DefaultButton(
                        text: DONE,
                        ontap: () async {
                          if (widget.isEditVaccination == true) {
                            setState(() {
                              iseditvaccion = true;
                            });
                            await editVaccinationApi(
                                    vmodel.name.toString(),
                                    selectStatus.toString(),
                                    vaccinationdate.toString(),
                                    File(
                                      selectImage!.path,
                                    ),
                                    reminder.toString(),
                                    atdate.toString(),
                                    attime.toString())
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
                                      vmodel.name.toString(),
                                      selectStatus.toString(),
                                      vaccinationdate.toString(),
                                      File(
                                        selectImage!.path,
                                      ),
                                      reminder.toString(),
                                      atdate.toString(),
                                      attime.toString())
                                  .then((value) {
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
    } else if (selectStatus == "---Select Status---") {
      customSnackbar(context, "Please select vaccination status");
      return false;
    } else if (vaccinationdate == null) {
      customSnackbar(context, "Please select vaccination date");
      return false;
    } else if (selectImage?.path == null) {
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
}
