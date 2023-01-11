// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:pet_app/Api/Models/vaccinationModel.dart';
import 'package:pet_app/Api/Prefrence.dart';
import 'package:pet_app/Api/Services.dart';
import 'package:pet_app/Colors/COLORS.dart';
import 'package:pet_app/Componants/Images&Icons.dart';
import 'package:pet_app/SevicesListAll_Screens/Add_Vaccinations.dart';
import 'package:pet_app/UTILS/Utils.dart';

class Vaccinations extends StatefulWidget {
  const Vaccinations({super.key});

  @override
  State<Vaccinations> createState() => _VaccinationsState();
}

class _VaccinationsState extends State<Vaccinations> {
  VaccinationMaodel result = VaccinationMaodel();
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    getVaccinationListApi().then((value) {
      setState(() {
        result = value;
        print(result.vaccinationModeldata.toString());
        isLoading = false;
      });
    });
  }

  var h;
  var w;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: WHITE70_CLR,
      appBar: DefaultAppBar(VACCINATOIN),
      floatingActionButton: flotingButton(() {
        Navigate_replace(
            context,
            Add_Vaccinations(
              isEditVaccination: false,
            ));
      }),
      body: isLoading
          ? loader
          : result.vaccinationModeldata!.isEmpty
              ? Center(
                  child: Text("No vaccinations found"),
                )
              : ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: result.vaccinationModeldata!.length,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: w * 1,
                      margin: EdgeInsets.only(
                        left: w * 0.030,
                        right: w * 0.030,
                        bottom: h * 0.020,
                      ),
                      padding: EdgeInsets.only(
                          left: w * 0.030,
                          right: w * 0.030,
                          top: h * 0.010,
                          bottom: h * 0.005),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: DROP_CLR.withOpacity(0.1),
                                blurRadius: 16)
                          ]),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            styleText(
                                result.vaccinationModeldata![index]
                                        .vaccinationid!.name ??
                                    "",
                                BLACK_CLR,
                                FontWeight.bold,
                                16),
                            SizedBox(
                              height: h * 0.005,
                            ),
                            SizedBox(
                              height: h * 0.005,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: w * 0.4,
                                  child: styleText(
                                      "Dose", BLACK_CLR, FontWeight.w400, 14),
                                ),
                                SizedBox(
                                  width: w * 0.4,
                                  child: Row(
                                    children: [
                                      styleText("Status     ", BLACK_CLR,
                                          FontWeight.w400, 14),
                                      SizedBox(
                                        height: h * 0.005,
                                      ),
                                      styleText(
                                        "due in ${DateTime.parse(result.vaccinationModeldata![index].atdate!).difference(DateTime.now()).inDays}",
                                        GREEN_CLR,
                                        FontWeight.w500,
                                        14,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: w * 0.4,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      styleText(LAST_VACCINATION, GRAY_CLR,
                                          FontWeight.normal, 13),
                                      styleText(
                                          "Date ${result.vaccinationModeldata![index].vaccinationdate.toString()}",
                                          BLACK_CLR,
                                          FontWeight.bold,
                                          15),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: w * 0.4,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      styleText(NEXT_VACCINATION, GRAY_CLR,
                                          FontWeight.normal, 13),
                                      styleText(
                                          "Date ${result.vaccinationModeldata![index].atdate.toString()}",
                                          BLACK_CLR,
                                          FontWeight.bold,
                                          15),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: h * 0.005,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(6),
                                  child: Image.network(
                                    result.vaccinationModeldata![index]
                                        .vaccinationcertificate
                                        .toString(),
                                    loadingBuilder:
                                        (context, child, loadingProgress) {
                                      if (loadingProgress == null) {
                                        return child;
                                      } else {
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: valueLoader(loadingProgress
                                                      .expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes!
                                              : null),
                                        );
                                      }
                                    },
                                    scale: 1.0,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            Container(),
                                    height: h * 0.075,
                                    width: w * 0.27,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 28,
                                      width: 28,
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            Preference.Pref.setInt(
                                                'vaccinationId',
                                                result
                                                    .vaccinationModeldata![
                                                        index]
                                                    .id);
                                            Navigate_replace(
                                                context,
                                                Add_Vaccinations(
                                                  isEditVaccination: true,
                                                  editVaccinationmodeldata:
                                                      result.vaccinationModeldata![
                                                          index],
                                                ));

                                            print("m, m, " +
                                                Preference.Pref.getInt(
                                                        'vaccinationId')
                                                    .toString());
                                          });
                                        },
                                        child: const CircleAvatar(
                                          backgroundColor: FADE_BLUE_CLR,
                                          child: Icon(
                                            Icons.edit,
                                            size: 15,
                                            color: WHITE70_CLR,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: w * 0.010,
                                    ),
                                    SizedBox(
                                      height: 28,
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            deleteDialog(context, () {
                                              deleteVaccintionApi(result
                                                      .vaccinationModeldata![
                                                          index]
                                                      .id
                                                      .toString())
                                                  .then((value) {
                                                customSnackbar(
                                                    context,
                                                    value['message']
                                                        .toString());
                                                getVaccinationListApi()
                                                    .then((value) {
                                                  result = value;
                                                  setState(() {});
                                                });

                                                Navigator.of(context).pop();
                                              }).catchError((e) {
                                                customSnackbar(
                                                    context, e.toString());
                                              });
                                            }, deletVaccination);
                                          });
                                        },
                                        child: const CircleAvatar(
                                          backgroundColor: FADE_BLUE_CLR,
                                          child: Icon(
                                            Icons.delete,
                                            color: WHITE70_CLR,
                                            size: 15,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ]),
                    );
                  }),
    );
  }
}
