import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pet_app/Colors/COLORS.dart';
import 'package:pet_app/Componants/Images&Icons.dart';
import 'package:pet_app/UTILS/Utils.dart';
import 'package:provider/provider.dart';
import '../Provider/Provider.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  var h;
  var w;



  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return ChangeNotifierProvider<ProviderTutorial>(
      create: (BuildContext context) => ProviderTutorial(),
      child: Scaffold(
        extendBody: true,
          resizeToAvoidBottomInset: true,
          // backgroundColor: WHITE70_CLR,
          body: Stack(
            children: [
              Container(
                // height: h*1,
                // width: w*1,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(BACK_GROUND_IMAGE, ), fit: BoxFit.cover, )
                ),
                
                    ),
              
           
       Column(
          children: [
            SizedBox(
              height: h * 0.2,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: h * 0.19,
                  width: w * 0.42,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: GREEN_CLR),
                ),
                Image.asset(
                  DOG_IMAGE,
                  height: h * 0.27,
                )
              ],
            ),
            SizedBox(
               height:   h * 0.040
            ),
            Consumer<ProviderTutorial>(
                builder: (BuildContext context, value, Widget? child) {
              return GestureDetector(
                onTap: () {
              
                  ProviderTutorial().NavigateLogin(context);
                   value.change();

                },
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                      alignment: Alignment.center,
                      height: h * 0.075,
                      width: w * 0.58,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                        color: value.isClick==false? FADE_GREEN_CLR : GREEN_CLR,
                      ),
                      child: styleText(
                          SIGN_IN, WHITE70_CLR, FontWeight.normal, 20)),
                ),
              );
            }),
            SizedBox(
                height:   h * 0.060
            ),
            Consumer<ProviderTutorial>(
                builder: (BuildContext context, value, Widget? child) {
              return GestureDetector(
                onTap: () {
                  ProviderTutorial().NavigateSinup(context);
               
                  value.change();
                
                },
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                      alignment: Alignment.center,
                      height: h * 0.07,
                      width: w * 0.58,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20)),
                        color:  value.isClick==false? GREEN_CLR:FADE_GREEN_CLR,
                      ),
                      child: styleText(
                         SIGN_UP, WHITE70_CLR, FontWeight.normal, 20)),
                ),
              );
            })
          ],
        ),
            ]
      )
      ),
    );
  }
}


