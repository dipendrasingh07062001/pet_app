import 'package:flutter/material.dart';
import 'package:pet_app/Colors/COLORS.dart';
import 'package:pet_app/Componants/Images&Icons.dart';
import 'package:pet_app/Provider/Provider.dart';
import 'package:pet_app/Screens/Onbording/Login.dart';
import 'package:pet_app/UTILS/Utils.dart';
import 'package:provider/provider.dart';

class Tutorial extends StatefulWidget {
  const Tutorial({super.key});

  @override
  State<Tutorial> createState() => _TutorialState();
}

class _TutorialState extends State<Tutorial> {
  int currentIndex = 0;

  var h;
  var w;

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Consumer<ProviderTutorial>(
        builder: (BuildContext context, value, Widget? child) {
      return Scaffold(
        body: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                BACK_GROUND_IMAGE,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(children: [
            SizedBox(
              height: h * 0.080,
            ),
            Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: TextButton(
                      onPressed: () {
                        Navigate_to(context, const Login());
                      },
                      child: const Text(
                        SKIP,
                        style: TextStyle(color: NON_DARK_CLR),
                      )),
                )),
            SizedBox(
              height: h * 0.060,
            ),
            Image.asset(
              DOG_IMAGE,
              height: h * 0.27,
            ),
            SizedBox(
              height: h * 0.020,
            ),
            value.isClick == false
                ? TutorialText(TITLE, DARK_CLR, FontWeight.bold, 25)
                : TutorialText(TITLE, DARK_CLR, FontWeight.bold, 25),
            SizedBox(
              height: h * 0.010,
            ),
            value.isClick == false
                ? TutorialText(
                    TUTORIAL_SUB_TITLE, DARK_CLR, FontWeight.normal, 18)
                : TutorialText(
                    TUTORIAL_SUB_TITLE, DARK_CLR, FontWeight.normal, 18),
            SizedBox(
              height: h * 0.090,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: w * 0.050),
                  child: Row(
                    children: [
                      Container(
                        height: 18,
                        width: 18,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: GREEN_CLR),
                            color:
                                value.isClick == false ? GREEN_CLR : WHITE_CLR),
                      ),
                      SizedBox(
                        width: w * 0.020,
                      ),
                      Container(
                        height: 18,
                        width: 18,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: GREEN_CLR),
                            color:
                                value.isClick == true ? GREEN_CLR : WHITE_CLR),
                      ),
                    ],
                  ),
                ),
                Consumer<ProviderTutorial>(
                    builder: (BuildContext context, value, Widget? child) {
                  return GestureDetector(
                    onTap: () {
                      currentIndex++;
                      value.changePage();

                      print(currentIndex);
                      if (currentIndex >= 2) {
                        ProviderTutorial().NavigateGetStarted(context);
                        //  currentIndex--;
                      }
                    },
                    child: Container(
                        alignment: Alignment.center,
                        height: h * 0.07,
                        width: w * 0.5,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                bottomLeft: Radius.circular(15)),
                            color: GREEN_CLR),
                        child: styleText(
                            value.isClick == false ? NEXT : GET_STARTED,
                            WHITE70_CLR,
                            FontWeight.normal,
                            18)),
                  );
                }),
              ],
            )
          ]),
        ),
      );
    });
  }
}
