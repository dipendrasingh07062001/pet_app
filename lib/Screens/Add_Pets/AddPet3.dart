import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pet_app/Provider/ServiceListProvider.dart';
import 'package:provider/provider.dart';
import '../../Colors/COLORS.dart';
import '../../Componants/Images&Icons.dart';
import '../../UTILS/Utils.dart';

int index = 0;
String? selectimage;

class Addpet3 extends StatefulWidget {
  const Addpet3({super.key});

  @override
  State<Addpet3> createState() => _Addpet3State();
}

class _Addpet3State extends State<Addpet3> {
  var h;
  var w;

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return Consumer<AddPetProvider>(
        builder: (BuildContext context, value, Widget? child) {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          height: h * 0.2,
        ),
        Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  value.Opengallery(context);
                },
                child: Container(
                    alignment: Alignment.center,
                    height: h * 0.16,
                    width: w * 0.4,
                    margin: EdgeInsets.only(top: h * 0.020),
                    decoration: BoxDecoration(
                        color: WHITE70_CLR,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: TFFBORDER_CLR)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(GALLERY_ICON),
                        SizedBox(
                          height: h * 0.015,
                        ),
                        GestureDetector(
                            onTap: () {},
                            child: styleText(
                                OPEN_GALLERY, GRAY_CLR, FontWeight.normal, 14)),
                      ],
                    )),
              ),
              GestureDetector(
                onTap: () {
                  value.OpenCamera(context);
                },
                child: Container(
                    alignment: Alignment.center,
                    height: h * 0.16,
                    width: w * 0.4,
                    margin: EdgeInsets.only(top: h * 0.020),
                    decoration: BoxDecoration(
                        color: WHITE70_CLR,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: TFFBORDER_CLR)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(CAMERA_ICON),
                        SizedBox(
                          height: h * 0.015,
                        ),
                        styleText(OPEN_CAMERA, GRAY_CLR, FontWeight.normal, 14),
                      ],
                    )),
              ),
            ]),
        SizedBox(
          height: h * 0.030,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                alignment: Alignment.center,
                height: 83,
                width: 95,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: GRAY_CLR.withOpacity(0.1)),
                  color: FADE_BLUE_CLR.withOpacity(0.3),
                ),
                child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        // clipBehavior: Clip.antiAlias,
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: value.selectImage == null
                                  ? Image.asset(
                                      DOG_IMAGE,
                                      height: 90,
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.all(1),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Image.file(
                                          File(
                                            value.selectImage!.path,
                                          ),
                                          fit: BoxFit.fill,
                                          height: 100,
                                          width: w * 1,
                                        ),
                                      ),
                                    ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 60),
                              child: Align(
                                alignment: Alignment.topRight,
                                child: SizedBox(
                                  height: 25,
                                  child: GestureDetector(
                                    onTap: () {
                                      File(value.selectImage!.path);
                                      print(value.selectImage);
                                    },
                                    child: CircleAvatar(
                                        backgroundColor: WHITE_CLR,
                                        child: GestureDetector(
                                          child: const Icon(
                                            Icons.delete,
                                            size: 10,
                                            color: FADE_GREEN_CLR,
                                          ),
                                        )),
                                  ),
                                ),
                              ),
                            )
                          ],
                        )))),
            Container(
                alignment: Alignment.center,
                height: 83,
                width: 95,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: GRAY_CLR.withOpacity(0.1)),
                  color: FADE_BLUE_CLR.withOpacity(0.3),
                ),
                child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        // clipBehavior: Clip.antiAlias,
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: value.selectImage == null
                                  ? Image.asset(
                                      DOG_IMAGE,
                                      height: 90,
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.all(1),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Image.file(
                                          File(
                                            value.selectImage!.path,
                                          ),
                                          fit: BoxFit.fill,
                                          height: 100,
                                          width: w * 1,
                                        ),
                                      ),
                                    ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 60),
                              child: Align(
                                alignment: Alignment.topRight,
                                child: SizedBox(
                                  height: 25,
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: CircleAvatar(
                                        backgroundColor: WHITE_CLR,
                                        child: GestureDetector(
                                          child: const Icon(
                                            Icons.delete,
                                            size: 10,
                                            color: FADE_GREEN_CLR,
                                          ),
                                        )),
                                  ),
                                ),
                              ),
                            )
                          ],
                        )))),
            Container(
                alignment: Alignment.center,
                height: 83,
                width: 95,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: GRAY_CLR.withOpacity(0.1)),
                  color: FADE_BLUE_CLR.withOpacity(0.3),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      // clipBehavior: Clip.antiAlias,
                      child: Consumer<AddPetProvider>(builder:
                          (BuildContext context, value, Widget? child) {
                        return Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: value.selectImage == null
                                  ? Image.asset(
                                      DOG_IMAGE,
                                      height: 90,
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.all(1),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Image.file(
                                          File(
                                            value.selectImage!.path,
                                          ),
                                          fit: BoxFit.fill,
                                          height: 100,
                                          width: w * 1,
                                        ),
                                      ),
                                    ),
                            ),
                            Consumer<AddPetProvider>(builder:
                                (BuildContext context, value, Widget? child) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 60),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: SizedBox(
                                    height: 25,
                                    child: GestureDetector(
                                      onTap: () {
                                        value.selectImage;
                                        print(value.selectImage);
                                      },
                                      child: CircleAvatar(
                                          backgroundColor: WHITE_CLR,
                                          child: GestureDetector(
                                            child: const Icon(
                                              Icons.delete,
                                              size: 10,
                                              color: FADE_GREEN_CLR,
                                            ),
                                          )),
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ],
                        );
                      })),
                )),
          ],
        ),
      ]);
    });
  }
}
