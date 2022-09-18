import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../Colors/COLORS.dart';
import '../Componants/Images&Icons.dart';
import '../UTILS/Utils.dart';

class Add_Pregnancy extends StatefulWidget {
  const Add_Pregnancy({super.key});

  @override
  State<Add_Pregnancy> createState() => _Add_PregnancyState();
}

class _Add_PregnancyState extends State<Add_Pregnancy> {


  
      String PastPregnancy = '1';
  final SelectPregnancy = ['1', '2', '3', '4', '5'];

     DateTime _currentdate1=DateTime.now();
  Future<Null>_datechange1(BuildContext context)async{
    final DateTime? _datechange1=await showDatePicker(context: context,
    keyboardType: TextInputType.numberWithOptions(),
        initialDate: _currentdate1,
        firstDate: DateTime(2001),
        lastDate: _currentdate1);
    if(_datechange1!=null){
      setState(() {
        _currentdate1=_datechange1;
      });
    }
  }



 String? _selectedTime;

  Future<void> _show() async {
    final TimeOfDay? result =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (result != null) {
      setState(() {
        _selectedTime = result.format(context);
      });
    }
  }


  
int _radioSelected = 1;
String? _radioVal;

int _radioSelected1 = 1;
String? _radioVal1;

int _radioSelected2 = 1;
String? _radioVal2;
  
var h;
var w;
  @override
  Widget build(BuildContext context) {
    
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      
       backgroundColor: WHITE70_CLR,
      appBar:DefaultAppBar(PREGNANCY),
      
     
   body: Padding(
     padding:  EdgeInsets.only(left: w*0.030,right: w*0.030,top: h*0.015,bottom: h*0.010),
     child: SingleChildScrollView(
       child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

              
                       styleText(SEXUALLY_ACTIVE, BLACK_CLR, FontWeight.normal, 15),


SizedBox(height: h*0.010,),
                         Row(
                  mainAxisAlignment: MainAxisAlignment.start,
              
                children: [
                  
                  SizedBox(
                    height: 20,
                    width: 20,
                    child: Radio(
                      value: 1,
                      groupValue: _radioSelected,
                      activeColor:GREEN_CLR,
                      onChanged: (value) {
                        setState(() {
                          _radioSelected = value!;
                          _radioVal = 'yes';
                        });
                      },
                    ),
                  ),
                  SizedBox(width: w*0.010,),
                     styleText(YES, GRAY_CLR, FontWeight.normal, 15),
                
                SizedBox(width: w*0.030,),
                  SizedBox(
                    height: 20,
                    width: 20,
                    child: Radio(
                      value: 2,
                      groupValue: _radioSelected,
                      activeColor:GREEN_CLR,
                      onChanged: (value) {
                        setState(() {
                          _radioSelected = value!;
                          _radioVal = 'no';
                        });
                      },
                    ),
                  ),
                  SizedBox(width: w*0.010,),
                styleText(NO, GRAY_CLR, FontWeight.normal, 15),


                
                ],
              ),

              SizedBox(height: h*0.015,),
     
       styleText(NO_OF_PREGNANCY, BLACK_CLR, FontWeight.normal, 15),
       
        Container(
                              height: h*0.06,
                              margin: EdgeInsets.only(top: h*0.010),
                          decoration: BoxDecoration(
                            color: WHITE_CLR,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: BORDER_CLR,width: 1)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15,right: 15),
                            child: DropdownButton<String>(
                              isExpanded: true,
                              borderRadius: BorderRadius.circular(10),
                               underline: SizedBox() ,
                              value: PastPregnancy,
                              onChanged: (String? newValue) =>
                                  setState(() => PastPregnancy = newValue!),
                              items: SelectPregnancy
                                  .map<DropdownMenuItem<String>>(
                                      (String value) =>
                                      DropdownMenuItem<String>(
                                      
     
                                        value: value,
                                        child: Text(value,style: TextStyle(color: GRAY_CLR,fontSize: 14),),
                                      ))
                                  .toList(),
     
                             
                              icon: Icon(Icons.keyboard_double_arrow_down,color: GRAY_CLR.withOpacity(0.5),size: 25,),
                              iconSize: 30,
                             
     
                            ),
                          ),
                        ),
     
                        SizedBox(height: h*0.020,),
                       styleText(HEALTH_OF_PREVIOUS, BLACK_CLR, FontWeight.normal, 15),
                          Container(
                                      padding: EdgeInsets.only(left: 10),
                                        alignment: Alignment.center,
                                        height: h*0.06,
                                        margin: EdgeInsets.only(top: h * 0.010),
                                    decoration: BoxDecoration(
                                
                                      color: WHITE_CLR,
                                      borderRadius: BorderRadius.circular(10),
                                     border: Border.all(color: BORDER_CLR,width: 1)
                                      
                                    ),
                                        child: TextFormField(
                                    
                                          decoration: InputDecoration(
                                            errorText: "",
                                            errorStyle: TextStyle(height: 0),
                                              hintText: "Good",
                                              hintStyle: TextStyle(
                                                  color: GRAY_CLR,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal),
                                              border: InputBorder.none)),
                                      
                                        ),

                        SizedBox(height: h*0.020,),
                       styleText(NEUTERED, BLACK_CLR, FontWeight.normal, 15),
                        SizedBox(height: h*0.015,),

                         Row(
                  mainAxisAlignment: MainAxisAlignment.start,
              
                children: [
                  
                  SizedBox(
                    height: 20,
                    width: 20,
                    child: Radio(
                     
                      value: 1,
                      groupValue: _radioSelected1,
                      activeColor:GREEN_CLR,
                      onChanged: (value) {
                        setState(() {
                          _radioSelected1 = value!;
                          _radioVal1 = 'yes';
                        });
                      },
                    ),
                  ),
                  SizedBox(width: w*0.010,),
                  styleText(YES, GRAY_CLR, FontWeight.normal, 15),

                SizedBox(
                  width: w*0.030,
                ),
                  SizedBox(
                    height: 20,
                    width: 20,
                    child: Radio(
                      
                      value: 2,
                      groupValue: _radioSelected1,
                      activeColor:GREEN_CLR,
                      onChanged: (value) {
                        setState(() {
                          _radioSelected1 = value!;
                          _radioVal1 = 'no';
                        });
                      },
                    ),
                  ),
                  SizedBox(width: w*0.010,),
            styleText(NO, GRAY_CLR, FontWeight.normal, 15),


                
                ],
              ),
     

     
                        SizedBox(height: h*0.010,),
                       styleText(REMINDER, DARK_CLR, FontWeight.bold, 15),

      SizedBox(height: h*0.010,),
                       styleText(REMINDER_DURATION, BLACK_CLR, FontWeight.normal, 15),

                       SizedBox(height: h*0.020,),
                         Row(
                  mainAxisAlignment: MainAxisAlignment.start,
              
                children: [
                  
                  SizedBox(
                    height: 20,
                    width: 20,
                    child: Radio(
                     
                      value: 1,
                      groupValue: _radioSelected2,
                      activeColor:GREEN_CLR,
                      onChanged: (value) {
                        setState(() {
                          _radioSelected2 = value!;
                          _radioVal2 = '6months';
                        });
                      },
                    ),
                  ),
                  SizedBox(width: w*0.010,),
                 styleText(MONTH1, GRAY_CLR, FontWeight.normal, 15),
                
                SizedBox(width: w*0.030,),
                  SizedBox(
                      height: 20,
                    width: 20,
                    child: Radio(
                      value: 2,
                      groupValue: _radioSelected2,
                      activeColor:GREEN_CLR,
                      onChanged: (value) {
                        setState(() {
                          _radioSelected2 = value!;
                          _radioVal2= '9months';
                        });
                      },
                    ),
                  ),
                  SizedBox(width: w*0.010,),
                       styleText(MONTH2, GRAY_CLR, FontWeight.normal, 15),
                       SizedBox(width: w*0.030,),
  SizedBox(
      height: 20,
                    width: 20,
    child: Radio(
                      value: 3,
                      groupValue: _radioSelected2,
                      activeColor:GREEN_CLR,
                      onChanged: (value) {
                        setState(() {
                          _radioSelected2 = value!;
                          _radioVal2 = '12months';
                        });
                      },
                    ),

  ),
  SizedBox(width: w*0.010,),
                     styleText(MONTH3, GRAY_CLR, FontWeight.normal, 15),

                
                
                ],
              ),
     
     
                        SizedBox(height: h*0.030,),    
              
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              styleText(AT_DATE, BLACK_CLR, FontWeight.normal, 15),
       
                               Container(
                                  height: h*0.06,
                                  width: w*0.45,
                                  padding: EdgeInsets.only(left: w*0.030,right: w*0.030),
                                  margin: EdgeInsets.only(top: h*0.010),
                              decoration: BoxDecoration(
                                color: WHITE_CLR,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: BORDER_CLR,width: 1)
                              ),
                              child:Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text( "00",style: TextStyle(color: GRAY_CLR,fontSize: 14),),
                       
                                 GestureDetector(
                                  onTap:() {},
        
           child: Icon(Icons.calendar_month_sharp,color: GRAY_CLR.withOpacity(0.5),size: 20,))
                                
                                  ],
                              ),
     
                                ),
                            ],

                          ),

                            Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              styleText(AT_DATE, BLACK_CLR, FontWeight.normal, 15),
       
        Container(
                                  height: h*0.06,
                                  width: w*0.45,
                                  padding: EdgeInsets.only(left: w*0.030,right: w*0.030),
                                  margin: EdgeInsets.only(top: h*0.010),
                              decoration: BoxDecoration(
                                color: WHITE_CLR,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: BORDER_CLR,width: 1)
                              ),
                              child:Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(_selectedTime != null ? _selectedTime! : '00:05 AM',style: TextStyle(color: GRAY_CLR,fontSize: 14),),
                            
                                 GestureDetector(
                                  onTap: (){
                                    setState(() {
                                     _show();
                                    });
                                  },
                                  child: Icon(Icons.access_time_rounded,color: GRAY_CLR.withOpacity(0.5),size: 20,)),
                                
                                  ],
                              ),
     
                                ),
                            ],
                          ),
                        ],
                      ),

                      SizedBox(height: h*0.070,),

                      Align(
                        alignment: Alignment.bottomCenter,
                        child: DefaultButton(text:DONE, ontap: (){}, fontsize: 15, height: h*0.060, width: w*0.8))
     
        ]
                          ),
     ),
                      ),

    );
  }

  
}