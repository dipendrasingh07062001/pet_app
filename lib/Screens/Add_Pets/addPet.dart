import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:pet_app/Screens/Add_Pets/addPet1.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../Colors/COLORS.dart';
import '../../UTILS/Utils.dart';
import 'AddPet3.dart';
import 'Add_pet2.dart';

class AddPetpage extends StatefulWidget {
  const AddPetpage({Key? key}) : super(key: key);

  @override
  State<AddPetpage> createState() => _AddPetpageState();
}

class _AddPetpageState extends State<AddPetpage> {

int index = 0;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final List text = ["Select Type","Fill the Details","Upload Pictures"];

  int mCurrentIndex = -1;
  List<Widget> pages = [
   
    AddPets(),
        AddPet2(),
        Addpet3()


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
      appBar: AppBar(centerTitle: true,
      toolbarHeight: h*0.08,
      backgroundColor: WHITE70_CLR,
      elevation: 1,
      title: styleText( "Add Pet", DARK_CLR, FontWeight.bold, 17), 
      ),
      
      extendBodyBehindAppBar: true,
   
      body: Padding(
        padding:  EdgeInsets.only(top:h*0.020,left: w*0.030,right: w*0.030),
        child: Stack(
          children: [
              PageView.builder(
           
              physics: NeverScrollableScrollPhysics(),
              controller: _controller,
              onPageChanged: _onPageViewChange,
              itemBuilder: (context, position) {
                return pages[position];
              },
              itemCount: 3,
            ),
                 
                    Container(
                  padding: EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: GREEN_CLR,width: 1.5)),
                  margin: EdgeInsets.only(top: h*0.125),
                  child: StepProgressIndicator(
                    direction: Axis.horizontal,
                    selectedSize: 12,

    totalSteps: 3,
    currentStep:mCurrentIndex+1,
    size: 10,
    selectedColor:GREEN_CLR,
    unselectedColor:WHITE70_CLR,
    roundedEdges: Radius.circular(20),
   
),
                ),

            
            Container(
         padding: EdgeInsets.only(bottom: 20),
              alignment: Alignment.bottomCenter,
            
              child:  

                 MaterialButton(
                  elevation: 0,
                  minWidth:  mCurrentIndex==2?w*0.7: w*0.55,
                  height: h*0.057,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),
                  side: mCurrentIndex==2? BorderSide(color:GREEN_CLR ):BorderSide(color: Colors.transparent)
                  
                  ),
                  
                  color:
                  mCurrentIndex==2?WHITE_CLR: GREEN_CLR,
                  onPressed: (){
                   
                       print(mCurrentIndex);
                          _controller.nextPage(
                              duration: _kDuration, curve: _kCurve);
                  },
                  child:styleText(  mCurrentIndex==2?"Skip and Continue":"Continue",mCurrentIndex==2?FADE_GREEN_CLR: WHITE_CLR, FontWeight.normal, 15))
         
            )
          ],
        ),
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
