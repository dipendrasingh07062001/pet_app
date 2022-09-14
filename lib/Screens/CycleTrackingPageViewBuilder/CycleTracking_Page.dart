import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:pet_app/Screens/Add_Pets/addPet1.dart';
import 'package:pet_app/SevicesListAll_Screens/Cycle_Tracking.dart';

import '../../Colors/COLORS.dart';
import '../../UTILS/Utils.dart';


class CycleTrackingPage extends StatefulWidget {
  const CycleTrackingPage({Key? key}) : super(key: key);

  @override
  State<CycleTrackingPage> createState() => _CycleTrackingPageState();
}

class _CycleTrackingPageState extends State<CycleTrackingPage> {

int index = 0;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  int mCurrentIndex = -1;
  List<Widget> pages = [
   
    Cycle_Tracking(),
    Cycle_Tracking(),
    Cycle_Tracking(),
    Cycle_Tracking(),
    Cycle_Tracking(),
    

  ];
  PageController _controller = new PageController();
  static const _kDuration = const Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;

  var currentIndex = -1;
var h;
var w;
  @override
  Widget build(BuildContext context) {
    
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      
       backgroundColor: WHITE70_CLR,
      appBar: DefaultAppBar("Cycle Tracking"),
      
      extendBodyBehindAppBar: true,
   
      body: Stack(
        children: [

        

          Container(
              child: PageView.builder(
                allowImplicitScrolling: true,
             
                // physics: NeverScrollableScrollPhysics(),
                controller: _controller,
                onPageChanged: _onPageViewChange,
                itemBuilder: (context, position) {
                  return pages[position];
                },
                itemCount: 5,
              )),


          
          Container(
       
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(bottom: 50),
            child:  


               MaterialButton(
                elevation: 0,
                minWidth:  w*0.5,
                height: h*0.057,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),
                
                
                ),
                
                color:
             GREEN_CLR,
                onPressed: (){
                 
                     print(mCurrentIndex);
                        _controller.nextPage(
                            duration: _kDuration, curve: _kCurve);
                },
                child:styleText( "Continue",WHITE_CLR, FontWeight.normal, 15))
       
          )
        ],
      ),
    );
  }

  _onPageViewChange(int page) {
    setState(() {
      mCurrentIndex = page;
      // print(mCurrentIndex);
    });
  }
}
