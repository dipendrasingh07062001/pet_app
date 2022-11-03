// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:pet_app/Api/Models/vaccinationModel.dart';
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
  @override
  void initState() {
    super.initState();
    getVaccinationListApi().then((value) {
      setState(() {
        result = value;
        print(result.vaccinationModeldata.toString());
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
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: FloatingActionButton(
          backgroundColor: WHITE70_CLR,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              side: BorderSide(color: GREEN_CLR)),
          onPressed: () {
            Navigate_replace(context, const Add_Vaccinations());
          },
          child: const Icon(
            Icons.add,
            size: 40,
            color: GREEN_CLR,
          ),
          heroTag: "b1",
        ),
      ),
      body: result.vaccinationModeldata == null
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: result.vaccinationModeldata!.length,
              padding: const EdgeInsets.symmetric(vertical: 20),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                    padding: EdgeInsets.only(
                      left: w * 0.030,
                      right: w * 0.030,
                      bottom: h * 0.020,
                    ),
                    child: Container(
                      width: w * 1,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: DROP_CLR.withOpacity(0.1),
                                blurRadius: 16)
                          ]),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: w * 0.030,
                            right: w * 0.030,
                            top: h * 0.010,
                            bottom: h * 0.005),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              styleText(
                                  result.vaccinationModeldata![index]
                                      .vaccinationid
                                      .toString(),
                                  BLACK_CLR,
                                  FontWeight.bold,
                                  16),
                              SizedBox(
                                height: h * 0.005,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(6),
                                    child: Image.network(
                                      result.vaccinationModeldata![index]
                                          .vaccinationcertificate
                                          .toString(),
                                      scale: 1.0,
                                      errorBuilder:
                                          (context, error, stackTrace) =>
                                              Container(),
                                      height: h * 0.075,
                                      width: w * 0.27,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 28,
                                        width: 28,
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              Navigate_replace(context,
                                                  const Add_Vaccinations());
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
                      ),
                    ));
              }),
    );
  }
}
