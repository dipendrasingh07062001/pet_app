import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_app/Provider/ServiceListProvider.dart';
import 'package:provider/provider.dart';
import '../../Api/Models/addPetModel.dart';
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
  XFile? selectImage = null;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (AddPetModel.addPetIamge.isNotEmpty) {
      selectImage = XFile(AddPetModel.addPetIamge.first.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

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
                Opengallery(context);
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
                OpenCamera(context);
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
      // SizedBox(
      //   height: h * 0.030,
      // ),
      Expanded(
        child: Visibility(
          visible: AddPetModel.addPetIamge.isNotEmpty ||
              AddPetModel.editimage != null,
          child: GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            padding: EdgeInsets.only(top: 10),
            // physics: NeverScrollableScrollPhysics(),
            children: List.generate(AddPetModel.addPetIamge.length, (index) {
              print("===============");
              print(
                selectImage != null || AddPetModel.editimage != null,
              );
              return Visibility(
                child: Container(
                    alignment: Alignment.center,
                    height: 83,
                    width: 95,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                            AddPetModel.addPetIamge.isEmpty
                                ? AddPetModel.editimage.toString()
                                : "",
                          ),
                          fit: BoxFit.cover),
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
                                  child: selectImage == null
                                      ? AddPetModel.editimage == null
                                          ? Image.asset(
                                              DOG_IMAGE,
                                              height: 90,
                                            )
                                          : Container()
                                      : Padding(
                                          padding: const EdgeInsets.all(1),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            child: Image.file(
                                              AddPetModel.addPetIamge[index],
                                              scale: 1.0,
                                              fit: BoxFit.cover,
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
              );
            }),
          ),
        ),
      ),
    ]);
  }

  Opengallery(BuildContext context) async {
    final GalleryImage = await ImagePicker().pickMultiImage();
    if (GalleryImage.isNotEmpty) {
      selectImage = GalleryImage.first;
      GalleryImage.forEach(
        (e) {
          AddPetModel.addPetIamge.add(File(e.path));
        },
      );
      // AddPetModel.addPetIamge.addAll(GalleryImage.map((e) => File(e.path)).toList),// File(selectImage!.path);
      setState(() {});
    }
  }

  OpenCamera(BuildContext context) async {
    // final CameraImage = await ImagePicker().pickImage(
    //   source: ImageSource.camera,
    // );
    // selectImage = CameraImage;
    // AddPetModel.addPetIamge = File(selectImage!.path);
    // setState(() {});
  }
}
