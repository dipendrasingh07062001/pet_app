import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../Colors/COLORS.dart';
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
      appBar: AppBar(centerTitle: true,
      toolbarHeight: h*0.08,
      backgroundColor: WHITE70_CLR,
      elevation: 1,
      title: styleText( "Pregnancy", DARK_CLR, FontWeight.bold, 17), 
      ),
      
     
   body: Padding(
     padding:  EdgeInsets.only(left: w*0.030,right: w*0.030,top: h*0.020,bottom: h*0.050),
     child: SingleChildScrollView(
       child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

              
                       styleText("Sexully Active", BLACK_CLR, FontWeight.normal, 15),

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
                  SizedBox(width: w*0.030,),
                     styleText("Yes", GRAY_CLR, FontWeight.normal, 15),
                
                  Radio(
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
                styleText("No", GRAY_CLR, FontWeight.normal, 15),


                
                ],
              ),
     
       styleText("No. of past Pregnancy", BLACK_CLR, FontWeight.normal, 15),
       
        Container(
                              height: h*0.065,
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
                       styleText("Health of Previous litter ", BLACK_CLR, FontWeight.normal, 15),
                          Container(
                                      padding: EdgeInsets.only(left: 10),
                                        alignment: Alignment.center,
                                        height: h*0.07,
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
                       styleText("Nuetered ", BLACK_CLR, FontWeight.normal, 15),


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
                  SizedBox(width: w*0.030,),
                  styleText("Yes", GRAY_CLR, FontWeight.normal, 15),

                
                  Radio(
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
            styleText("No", GRAY_CLR, FontWeight.normal, 15),


                
                ],
              ),
     

     
                        SizedBox(height: h*0.010,),
                       styleText("Reminder ", DARK_CLR, FontWeight.bold, 15),

      SizedBox(height: h*0.010,),
                       styleText("Reminder Duration ", BLACK_CLR, FontWeight.normal, 15),
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
                  SizedBox(width: w*0.030,),
                 styleText("6 Months", GRAY_CLR, FontWeight.normal, 15),
                
                  Radio(
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
                       styleText("9Months", GRAY_CLR, FontWeight.normal, 15),
  Radio(
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
                     styleText("12Months", GRAY_CLR, FontWeight.normal, 15),

                
                
                ],
              ),
     
    
     
                            styleText("Deworming Date", BLACK_CLR, FontWeight.normal, 15),
       
                        Container(
                              height: h*0.065,
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
                              Text( _currentdate1==null?"DD-MM-YYYY":"$_currentdate1",style: TextStyle(color: GRAY_CLR,fontSize: 14),),
                   
                             GestureDetector(
                              onTap: (){
                                setState(() {
                                  _datechange1(context);
                                });
                              },
                              child: Icon(Icons.calendar_month_sharp,color: GRAY_CLR.withOpacity(0.5),size: 20,)),
                            
                              ],
                          ),
     
                            ),
                       
  
                        SizedBox(height: h*0.020,),    
              
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              styleText("At Date", BLACK_CLR, FontWeight.normal, 15),
       
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
                              styleText("At Time", BLACK_CLR, FontWeight.normal, 15),
       
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
                                  Text("00",style: TextStyle(color: GRAY_CLR,fontSize: 14),),
                            
                                 GestureDetector(
                                  onTap: (){
                                    setState(() {
                                     
                                    });
                                  },
                                  child: Icon(Icons.timelapse,color: GRAY_CLR.withOpacity(0.5),size: 20,)),
                                
                                  ],
                              ),
     
                                ),
                            ],
                          ),
                        ],
                      ),

                      SizedBox(height: h*0.050,),

                      Align(
                        alignment: Alignment.bottomCenter,
                        child: DefaultButton(text: "Continue", ontap: (){}, fontsize: 15, height: h*0.060, width: w*0.65))
     
        ]
                          ),
     ),
                      ),

    );
  }

  
}