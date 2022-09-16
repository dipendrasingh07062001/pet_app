import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../Colors/COLORS.dart';
import '../UTILS/Utils.dart';

class Add_Deworming extends StatefulWidget {
  const Add_Deworming({super.key});

  @override
  State<Add_Deworming> createState() => _Add_DewormingState();
}

class _Add_DewormingState extends State<Add_Deworming> {


  
      String selectStatus = '---Slelect Status---';
  final SelectStstusitems = ['---Slelect Status---', 'RABIT', 'CAT', 'DOG', 'CAT!'];

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
  
var h;
var w;
  @override
  Widget build(BuildContext context) {
    
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      
       backgroundColor: WHITE70_CLR,
      appBar: DefaultAppBar("Deworming"),
     
   body: Padding(
     padding:  EdgeInsets.only(left: w*0.030,right: w*0.030,top: h*0.020,bottom: h*0.050),
     child: SingleChildScrollView(
       child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
     
       styleText("Deworming Status", BLACK_CLR, FontWeight.normal, 15),
       
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
                              value: selectStatus,
                              onChanged: (String? newValue) =>
                                  setState(() => selectStatus = newValue!),
                              items: SelectStstusitems
                                  .map<DropdownMenuItem<String>>(
                                      (String value) =>
                                      DropdownMenuItem<String>(
                                      
     
                                        value: value,
                                        child: Text(value,style: TextStyle(color: GRAY_CLR,fontSize: 14),),
                                      ))
                                  .toList(),
     
                             
                              icon: Icon(Icons.keyboard_arrow_down_sharp,color: GRAY_CLR.withOpacity(0.5),size: 25,),
                              iconSize: 30,
                             
     
                            ),
                          ),
                        ),
     
                        SizedBox(height: h*0.020,),
                       styleText("Deworming Duration", BLACK_CLR, FontWeight.normal, 15),

SizedBox(height: h*0.020,),
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
                          _radioVal = 'dilay';
                        });
                      },
                    ),
                  ),
                  SizedBox(width: w*0.010,),
                  Text('Daily',style: TextStyle(color: GRAY_CLR),),
                
                SizedBox(width: w*0.040,),
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
                          _radioVal = 'weekly';
                        });
                      },
                    ),
                  ),
                  SizedBox(width: w*0.010,),
                    Text('Weekly',style: TextStyle(color: GRAY_CLR),),

                 SizedBox(width: w*0.035,),
                  SizedBox(
                     height: 20,
                    width: 20,
                    child: Radio(
                      value: 3,
                      groupValue: _radioSelected,
                      activeColor:GREEN_CLR,
                      onChanged: (value) {
                        setState(() {
                          _radioSelected = value!;
                          _radioVal = 'monthly';
                        });
                      },
                    ),

                  ),
                  SizedBox(width: w*0.010,) ,Text('Monthly',style: TextStyle(color: GRAY_CLR),),
                ],
              ),
     
          SizedBox(height: h*0.015,),
     
                            styleText("Deworming Date", BLACK_CLR, FontWeight.normal, 15),
       
                        Container(
                              height: h*0.06,
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
     
                        styleText("Reminder", BLACK_CLR, FontWeight.normal, 17),
                         SizedBox(height: h*0.015,),
     
                        styleText("Reminder Duration", BLACK_CLR, FontWeight.normal, 15),
                                         SizedBox(height: h*0.015,),

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
                          _radioVal = 'dilay';
                        });
                      },
                    ),
                  ),
                  SizedBox(width: w*0.010,),
                  Text('Daily',style: TextStyle(color: GRAY_CLR),),
                                 SizedBox(width: w*0.035,),

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
                          _radioVal = 'weekly';
                        });
                      },
                    ),
                  ),
                  SizedBox(width: w*0.010,),
                    Text('Weekly',style: TextStyle(color: GRAY_CLR),),

                 SizedBox(width: w*0.035,),
                  SizedBox(
                        height: 20,
                    width: 20,
                    child: Radio(
                      value: 3,
                      groupValue: _radioSelected,
                      activeColor:GREEN_CLR,
                      onChanged: (value) {
                        setState(() {
                          _radioSelected = value!;
                          _radioVal = 'monthly';
                        });
                      },
                    ),
                  ), 
                  SizedBox(width: w*0.010,),
                  Text('Monthly',style: TextStyle(color: GRAY_CLR),),
                ],
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
       
        Container(                    width: w*0.45,
                                  height: h*0.06,
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

                      SizedBox(height: h*0.050,),

                      Align(
                        alignment: Alignment.bottomCenter,
                        child: DefaultButton(text: "Done", ontap: (){
                          Navigator.of(context).pop();
                        }, fontsize: 15, height: h*0.060, width: w*0.8))
     
        ]
                          ),
     ),
                      ),

    );
  }

  
}

 
