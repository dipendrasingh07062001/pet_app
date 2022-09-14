import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../Colors/COLORS.dart';
import '../UTILS/Utils.dart';

class Add_Vaccinations extends StatefulWidget {
  const Add_Vaccinations({super.key});

  @override
  State<Add_Vaccinations> createState() => _Add_VaccinationsState();
}

class _Add_VaccinationsState extends State<Add_Vaccinations> {



      String dropdounvalue = '---Slelect Vaccinations---';
  final items = ['---Slelect Vaccinations---', 'RABIT', 'CAT', 'DOG', 'CAT!'];
  
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
      appBar: AppBar(centerTitle: true,
      toolbarHeight: h*0.08,
      backgroundColor: WHITE70_CLR,
      elevation: 1,
      title: styleText( "Add Vaccinations", DARK_CLR, FontWeight.bold, 17), 
      ),
      
     
   body: Padding(
     padding:  EdgeInsets.only(left: w*0.030,right: w*0.030,top: h*0.020,bottom: h*0.050),
     child: SingleChildScrollView(
       child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
     
       styleText("Vaccination Name", BLACK_CLR, FontWeight.bold, 15),
       
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
                              value: dropdounvalue,
                              onChanged: (String? newValue) =>
                                  setState(() => dropdounvalue = newValue!),
                              items: items
                                  .map<DropdownMenuItem<String>>(
                                      (String value) =>
                                      DropdownMenuItem<String>(
                                      
     
                                        value: value,
                                        child: Text(value,style: TextStyle(color: GRAY_CLR,fontSize: 14),),
                                      ))
                                  .toList(),
     
                             
                              icon: Icon(Icons.keyboard_arrow_down_sharp,color: GRAY_CLR,size: 25,),
                              iconSize: 30,
                             
     
                            ),
                          ),
                        ),
     
                        SizedBox(height: h*0.020,),
     
      styleText("Vacccination Status", BLACK_CLR, FontWeight.bold, 15),
       
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
                              value: selectStatus,
                              onChanged: (String? newValue) =>
                                  setState(() => dropdounvalue = newValue!),
                              items: SelectStstusitems
                                  .map<DropdownMenuItem<String>>(
                                      (String value) =>
                                      DropdownMenuItem<String>(
                                      
     
                                        value: value,
                                        child: Text(value,style: TextStyle(color: GRAY_CLR,fontSize: 14),),
                                      ))
                                  .toList(),
     
                             
                              icon: Icon(Icons.keyboard_arrow_down_sharp,color: GRAY_CLR,size: 25,),
                              iconSize: 30,
                             
     
                            ),
                          ),
                        ),
                        SizedBox(height: h*0.020,),
                       styleText("Vacccination Date", BLACK_CLR, FontWeight.bold, 15),
       
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
                              child: Icon(Icons.calendar_month_sharp,color: GRAY_CLR,size: 25,)),
                            
                              ],
                          ),
     
                            ),
                            SizedBox(height: h*0.020,),
     
                            styleText("Vacccination Certificate", BLACK_CLR, FontWeight.bold, 15),
  
                             Container(
                    alignment: Alignment.center,
                    height: h*0.16,
                    width: w*1,
                    margin: EdgeInsets.only(top: h*0.010),
                    decoration: BoxDecoration(
                      color: WHITE70_CLR ,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: TFFBORDER_CLR)
                    ),
     
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
     
                    SvgPicture.asset("assets/svg_icon/Icon feather-upload-cloud.svg"),
     
                    SizedBox(height: h*0.015,),
                        GestureDetector(
                    onTap: (){},
                    child: styleText(" Document Upload", GRAY_CLR, FontWeight.normal, 14)),
     
     
                    ],)
     
                  ),
     
                           SizedBox(height: h*0.020,),
     
                        styleText("Reminder", BLACK_CLR, FontWeight.bold, 15),
                           
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
                  SizedBox(width: w*0.030,),
                  Text('Daily'),
                
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
                    Text('Weekly'),

                 
                  Radio(
                    value: 3,
                    groupValue: _radioSelected,
                    activeColor:GREEN_CLR,
                    onChanged: (value) {
                      setState(() {
                        _radioSelected = value!;
                        _radioVal = 'monthly';
                      });
                    },
                  ), Text('Monthly'),
                ],
              ),
     
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              styleText("At Date", BLACK_CLR, FontWeight.bold, 15),
       
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
                                  Text( _currentdate1==null?"":"$_currentdate1",style: TextStyle(color: GRAY_CLR,fontSize: 14),),
                       
                                 GestureDetector(
                                  onTap:() async {

                                    DateTime? pickedDate = await showDatePicker(
                      context: context, initialDate: DateTime.now(),
                      firstDate: DateTime(2000), 
                      lastDate: DateTime(2101)
                  );
                  
                  if(pickedDate != null ){
                      print(pickedDate);  
                      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate); 
                      print(formattedDate); 

                      setState(() {
                       
                      });
                  }else{
                      print("Date is not selected");
                  }
                },
        
           child: Icon(Icons.calendar_month_sharp,color: GRAY_CLR,size: 25,))
                                
                                  ],
                              ),
     
                                ),
                            ],

                          ),

                            Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              styleText("At Time", BLACK_CLR, FontWeight.bold, 15),
       
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
                                  Text("$_currentdate1",style: TextStyle(color: GRAY_CLR,fontSize: 14),),
                            
                                 GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      _datechange1(context);
                                    });
                                  },
                                  child: Icon(Icons.timelapse,color: GRAY_CLR,size: 25,)),
                                
                                  ],
                              ),
     
                                ),
                            ],
                          ),
                        ],
                      ),

                      SizedBox(height: h*0.020,),

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