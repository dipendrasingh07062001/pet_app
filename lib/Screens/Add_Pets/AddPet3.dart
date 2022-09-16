import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import '../../Colors/COLORS.dart';
import '../../Componants/Images&Icons.dart';
import '../../UTILS/Utils.dart';

int index = 0;

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: h * 0.2,
        ),
      
        Row(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  index = 0;
                  _opengallery(context);
                });
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
                      SvgPicture.asset(
                          "assets/svg_icon/Icon feather-image.svg"),
                      SizedBox(
                        height: h * 0.015,
                      ),
                      GestureDetector(
                          onTap: () {},
                          child: styleText(
                              "Open Gallary", GRAY_CLR, FontWeight.normal, 14)),
                    ],
                  )),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  index = 0;
                  _opencamera(context);
                });
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
                      SvgPicture.asset(
                          "assets/svg_icon/Icon feather-camera.svg"),
                      SizedBox(
                        height: h * 0.015,
                      ),
                      GestureDetector(
                          onTap: () {},
                          child: styleText(
                              "Open Camera", GRAY_CLR, FontWeight.normal, 14)),
                    ],
                  )),
            )
          ],
        ),

        // SelectImage==null?

        Align(
          alignment: Alignment.topCenter,
          child: SizedBox(
            height: h * 0.16,
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      alignment: Alignment.center,
                      margin:
                          EdgeInsets.only(top: h * 0.040, left: 7, right: 5),
                      height:  80,
                      width:95,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: GRAY_CLR.withOpacity(0.1)),
                        color: FADE_BLUE_CLR.withOpacity(0.3),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            // clipBehavior: Clip.antiAlias,
                            child: Column(
                              children: [
                                   Padding(
                                     padding: const EdgeInsets.only(left: 60),
                                     child: Align(
                                      alignment: Alignment.topRight,
                                       child: SizedBox(
                                         height: 20,
                                         child: CircleAvatar(
                                             backgroundColor: WHITE_CLR,
                                             child: GestureDetector(
                                               child: Icon(
                                                 Icons.delete,
                                                 size: 10,
                                                 color: FADE_GREEN_CLR,
                                               ),
                                             )),
                                       ),
                                     ),
                                   ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: SelectImage == null
                                      ? Image.asset(
                                          DOG_IMAGE,
                                          
                                       height: 50,
                                         
                                        )
                                      : Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.file(
                                            File(
                                              SelectImage!.path,
                                            ),
                                            fit: BoxFit.fill,
                                            height:40,
                                            width: w * 1,
                                          ),
                                      ),
                                ),
                             
                              ],
                            )),
                      ));
                }),
          ),
        )

// :Container()
      ],
    );
  }

  PickedFile? SelectImage = null;

  void _opengallery(BuildContext context) async {
    final coverImage = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );
    setState(() {
      SelectImage = coverImage!;
    });
  }

  void _opencamera(BuildContext context) async {
    final CoverImage_Via_Camera = await ImagePicker().getImage(
      source: ImageSource.camera,
    );
    setState(() {
      SelectImage = CoverImage_Via_Camera!;
    });
  }
}
