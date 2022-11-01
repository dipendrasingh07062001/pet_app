import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pet_app/Api/Models/v_model.dart';
import 'package:pet_app/Api/Services.dart';
import 'package:pet_app/SevicesListAll_Screens/Vactionations.dart';
import 'package:provider/provider.dart';
import '../Colors/COLORS.dart';
import '../Componants/Images&Icons.dart';
import '../Provider/ServiceListProvider.dart';
import '../UTILS/Utils.dart';

class Add_Vaccinations extends StatefulWidget {
  const Add_Vaccinations({super.key});

  @override
  State<Add_Vaccinations> createState() => _Add_VaccinationsState();
}

class _Add_VaccinationsState extends State<Add_Vaccinations> {
  VModel vmodel = VModel();

  @override
  void initState() {
    super.initState();
    vmodel.name = "---Slelect Vaccinations---";
    vaccinationList.clear();
    vaccinationList.add(vmodel);
    getVaccinationApi().whenComplete(() {
      setState(() {});
    });
  }

  String selectStatus = '---Slelect Status---';
  final selectStatusitems = [
    '---Slelect Status---',
    'true',
    'false',
  ];

  String? selectedTime;
  Future<void> selectTime() async {
    final TimeOfDay? result =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (result != null) {
      setState(() {
        selectedTime = result.format(context);
      });
    }
  }

  String? selectdate;
  String? selectAtdate;
  DateTime? birthDate;

  Future<void> datePicker() async {
    final datePick = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));
    if (datePick != null && datePick != birthDate) {
      setState(() {
        birthDate = datePick;
        selectdate =
            "${birthDate!.day}-${birthDate!.month}-${birthDate!.year}"; // 08/14/2019
      });
    }
  }

  DateTime? birthDate1;
  Future<void> datePicker1() async {
    final datePick = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));
    if (datePick != null && datePick != birthDate1) {
      setState(() {
        birthDate1 = datePick;
        selectAtdate =
            "${birthDate1!.day}-${birthDate1!.month}-${birthDate1!.year}"; // 08/14/2019
      });
    }
  }

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
            Container(
              height: h * 0.06,
              padding: EdgeInsets.only(left: w * 0.030, right: w * 0.030),
              margin: EdgeInsets.only(top: h * 0.010),
              decoration: BoxDecoration(
                  color: WHITE_CLR,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: BORDER_CLR, width: 1)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    selectdate == null ? "Selectdate" : "$selectdate",
                    style: const TextStyle(color: GRAY_CLR, fontSize: 14),
                  ),
                  GestureDetector(
                      onTap: () async {
                        datePicker();
                      },
                      child: Icon(
                        Icons.calendar_month_sharp,
                        color: GRAY_CLR.withOpacity(0.5),
                        size: 20,
                      )),
                ],
              ),
            ),
            SizedBox(
              height: h * 0.020,
            ),
            styleText(
                VACCINATION_CERTIFICATE, BLACK_CLR, FontWeight.normal, 15),
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
                              print(
                                "hhhhhhhh" + value.selectImage!.path,
                              );
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image.file(
                                File(
                                  value.selectImage!.path,
                                ),
                                fit: BoxFit.fill,
                                // height: 100,
                                width: w * 1,
                              ),
                            ),
                          ));
              },
            ),
            SizedBox(
              height: h * 0.025,
            ),
            styleText(REMINDER, BLACK_CLR, FontWeight.normal, 15),
            SizedBox(
              height: h * 0.015,
            ),
            Consumer<AddPetProvider>(
                builder: (BuildContext context, value, Widget? child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                    width: 20,
                    child: Radio(
                        value: 'daily',
                        groupValue: value.day,
                        activeColor: GREEN_CLR,
                        onChanged: value.dayChangevalue),
                  ),
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
                  SizedBox(
                    height: 20,
                    width: 20,
                    child: Radio(
                        value: 'weekly',
                        groupValue: value.day,
                        activeColor: GREEN_CLR,
                        onChanged: value.dayChangevalue),
                  ),
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
                  SizedBox(
                    height: 20,
                    width: 20,
                    child: Radio(
                        value: 'monthly',
                        groupValue: value.day,
                        activeColor: GREEN_CLR,
                        onChanged: value.dayChangevalue),
                  ),
                  SizedBox(
                    width: w * 0.020,
                  ),
                  const Text(
                    MONTHLY,
                    style: TextStyle(color: GRAY_CLR),
                  ),
                ],
              );
            }),
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
                      Container(
                        height: h * 0.06,
                        padding:
                            EdgeInsets.only(left: w * 0.030, right: w * 0.030),
                        margin: EdgeInsets.only(top: h * 0.010),
                        decoration: BoxDecoration(
                            color: WHITE_CLR,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: BORDER_CLR, width: 1)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              selectAtdate == null
                                  ? "Selectdate"
                                  : "$selectAtdate",
                              style: const TextStyle(
                                  color: GRAY_CLR, fontSize: 14),
                            ),
                            GestureDetector(
                                onTap: () async {
                                  datePicker1();
                                },
                                child: Icon(
                                  Icons.calendar_month_sharp,
                                  color: GRAY_CLR.withOpacity(0.5),
                                  size: 20,
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: w * 0.45,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      styleText(AT_TIME, BLACK_CLR, FontWeight.normal, 15),
                      Container(
                        height: h * 0.06,
                        padding:
                            EdgeInsets.only(left: w * 0.030, right: w * 0.030),
                        margin: EdgeInsets.only(top: h * 0.010),
                        decoration: BoxDecoration(
                            color: WHITE_CLR,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: BORDER_CLR, width: 1)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              selectedTime == null
                                  ? "SelectTime"
                                  : selectedTime.toString(),
                              style: const TextStyle(
                                  color: GRAY_CLR, fontSize: 14),
                            ),
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectTime();
                                  });
                                },
                                child: Icon(
                                  Icons.access_time_rounded,
                                  color: GRAY_CLR.withOpacity(0.5),
                                  size: 20,
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: h * 0.035,
            ),
            Consumer<AddPetProvider>(
                builder: (BuildContext context, value, Widget? child) {
              return Align(
                  alignment: Alignment.bottomCenter,
                  child: DefaultButton(
                      text: DONE,
                      ontap: () {
                        addVaccinationApi(
                                vmodel.name.toString(),
                                selectStatus.toString(),
                                selectdate.toString(),
                                File(
                                  value.selectImage!.path,
                                ),
                                value.day.toString(),
                                selectedTime.toString(),
                                selectAtdate.toString())
                            .then((value) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: GREEN_CLR,
                              content: Text(addVaccinationmsg.toString())));
                          print(addVaccinationmsg.toString());
                          setState(() {});
                          Navigate_replace(context, const Vaccinations());
                        }).catchError((e) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: GREEN_CLR,
                              content: Text(e.toString())));

                          print(e.toString());
                        });
                      },
                      fontsize: 15,
                      height: h * 0.060,
                      width: w * 0.8));
            }),
            SizedBox(
              height: h * 0.035,
            ),
          ]),
        ),
      ),
    );
  }
}
