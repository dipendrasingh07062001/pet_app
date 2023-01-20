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
    getreminderData();
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

    return WillPopScope(
      onWillPop: () async {
        getreminderData();

        return true;
      },
      child: Scaffold(
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
                                height: h * 0.01,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        styleText("Dose ", GRAY_CLR,
                                            FontWeight.w400, 13),
                                        styleText(
                                            result.vaccinationModeldata![index]
                                                    .dose ??
                                                "",
                                            BLACK_CLR,
                                            FontWeight.w400,
                                            14),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        styleText("Status", GRAY_CLR,
                                            FontWeight.w400, 13),
                                        SizedBox(
                                          height: h * 0.005,
                                        ),
                                        styleText(
                                          // "due in ${DateTime.parse(result.vaccinationModeldata![index].atdate!).difference(DateTime.now()).inDays}",
                                          result.vaccinationModeldata![index]
                                                  .vaccinationstatus ??
                                              "",
                                          BLACK_CLR,
                                          FontWeight.w400,
                                          14,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: h * 0.02,
                              ),
                              Row(
                                children: [
                                  Visibility(
                                    visible: result.vaccinationModeldata![index]
                                        .vaccinationdate!.isNotEmpty,
                                    child: Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          styleText(LAST_VACCINATION, GRAY_CLR,
                                              FontWeight.normal, 13),
                                          Row(
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: List.generate(
                                                    result
                                                        .vaccinationModeldata![
                                                            index]
                                                        .vaccinationdate!
                                                        .length,
                                                    (i) => Row(
                                                          children: [
                                                            SizedBox(
                                                              // width: w * 0.6,
                                                              child: styleText(
                                                                  "${result.vaccinationModeldata![index].vaccinationdate![i]}  ",
                                                                  BLACK_CLR,
                                                                  FontWeight
                                                                      .w400,
                                                                  15),
                                                            ),
                                                            GestureDetector(
                                                              onTap: () {
                                                                downloadFile(
                                                                        result.vaccinationModeldata![index].vaccinationcertificate![
                                                                            i],
                                                                        result
                                                                            .vaccinationModeldata![
                                                                                index]
                                                                            .vaccinationcertificate![
                                                                                i]
                                                                            .split(
                                                                                "/")
                                                                            .last,
                                                                        context)
                                                                    .then(
                                                                        (value) {
                                                                  print(value);
                                                                });
                                                                // downloader(result
                                                                //     .vaccinationModeldata![
                                                                //         index]
                                                                //     .vaccinationcertificate![i]);
                                                              },
                                                              child: Icon(
                                                                Icons
                                                                    .cloud_download_outlined,
                                                                size: 20,
                                                              ),
                                                            )
                                                          ],
                                                        )),
                                              ),
                                              // Column(
                                              //   crossAxisAlignment:
                                              //       CrossAxisAlignment.start,
                                              //   children: result
                                              //       .vaccinationModeldata![index]
                                              //       .vaccinationcertificate!
                                              //       .map((e) => Icon(
                                              //             Icons
                                              //                 .cloud_download_outlined,
                                              //             size: 20,
                                              //           ))
                                              //       .toList(),
                                              // )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                    visible: result.vaccinationModeldata![index]
                                            .vaccinationdate!.length <
                                        4,
                                    child: Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          styleText(
                                              NEXT_VACCINATION + " - Date",
                                              GRAY_CLR,
                                              FontWeight.normal,
                                              13),
                                          styleText(
                                              result
                                                  .vaccinationModeldata![index]
                                                  .atdate
                                                  .toString(),
                                              BLACK_CLR,
                                              FontWeight.w400,
                                              15),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: h * 0.005,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Visibility(
                                    visible: result.vaccinationModeldata![index]
                                            .vaccinationdate!.length <
                                        4,
                                    child: SizedBox(
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
                                              customSnackbar(context,
                                                  value['message'].toString());
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
                            ]),
                      );
                    }),
      ),
    );
  }
}
