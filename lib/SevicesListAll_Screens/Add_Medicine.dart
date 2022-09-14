import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../Colors/COLORS.dart';
import '../UTILS/Utils.dart';

class Add_Medicine extends StatefulWidget {
  const Add_Medicine({super.key});

  @override
  State<Add_Medicine> createState() => _Add_MedicineState();
}

class _Add_MedicineState extends State<Add_Medicine> {


  
      String Duration = '1';
  final SelectDuration = ['1', '2', '3', '4', '5'];

      String day = '1';
  final SelectDay = ['1', '2', '3', '4', '5'];

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
      appBar: DefaultAppBar("Medicine"),
  
   body: Padding(
     padding:  EdgeInsets.only(left: w*0.030,right: w*0.030,top: h*0.020,bottom: h*0.020),
     child: SingleChildScrollView(
       child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [


                         styleText("Medicine Name ", BLACK_CLR, FontWeight.normal, 15),
                          Container(
                                      padding: EdgeInsets.only(left: 10),
                                        alignment: Alignment.center,
                                        height: h*0.065,
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
                                              hintText: "2",
                                              hintStyle: TextStyle(
                                                  color: GRAY_CLR,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal),
                                              border: InputBorder.none)),
                                      
                                        ),


                                SizedBox(height: h*0.020,),

                                         Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                           children: [
                                             SizedBox(
                                              width: w*0.4,
                                               child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                 children: [
                                                   styleText("Duration", BLACK_CLR, FontWeight.normal, 15),
                                                
       
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
                              value: Duration,
                              onChanged: (String? newValue) =>
                                  setState(() => Duration = newValue!),
                              items: SelectDuration
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

                         ],
                                               ),
                                             ),

                                                SizedBox(
                                                  width: w*0.45,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                               children: [
                                                   styleText("Dose/day", BLACK_CLR, FontWeight.normal, 15),
                                              
       
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
                              value: day,
                              onChanged: (String? newValue) =>
                                  setState(() => day = newValue!),
                              items: SelectDay
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

                         ],
                                             ),
                                                ),
                                           ],
                                         ),
     
              
                         SizedBox(height: h*0.020,),
                            styleText("Course Start Date", BLACK_CLR, FontWeight.normal, 15),
       
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
                       
                       styleText("Course end  Date", BLACK_CLR, FontWeight.normal, 15),
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
                       
                       styleText("Reminder", BLACK_CLR, FontWeight.normal, 15),

                           SizedBox(height: h*0.020,),
                       
                       styleText("Reminder Duration", BLACK_CLR, FontWeight.normal, 15),
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
                          _radioVal = 'daily';
                        });
                      },
                    ),
                  ),
                  SizedBox(width: w*0.030,),
                     styleText("Daily", GRAY_CLR, FontWeight.normal, 15),
                
                  Radio(
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
                styleText("Weekly", GRAY_CLR, FontWeight.normal, 15),


                
                ],
              ),
     
      
     
    
  
              
                      Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        styleText("At Time", BLACK_CLR, FontWeight.normal, 15),
       
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
                            Text( _selectedTime != null ? _selectedTime! : '00:08 AM',style: TextStyle(color: GRAY_CLR,fontSize: 14),),
                      
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

                      SizedBox(height: h*0.040,),

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