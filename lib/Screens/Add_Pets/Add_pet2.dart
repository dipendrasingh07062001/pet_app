import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import '../../Colors/COLORS.dart';
import '../../UTILS/Utils.dart';
class AddPet2 extends StatefulWidget {
   AddPet2({super.key});

  @override
  State<AddPet2> createState() => _AddPet2State();
}

class _AddPet2State extends State<AddPet2> {
   TextEditingController searchLocationCantroller  =TextEditingController();

  var h;
  var w;

  String gender ="male";

    String dropdounvalue = 'BREED';
  final items = ['BREED', 'RABIT', 'CAT', 'DOG', 'CAT!'];

      String weightDropdoun = 'Weight';
  final weightItems = ['Weight', '10', '20', '30', '40','50','60'];


   DateTime _currentdate1=DateTime.now();
  Future<Null>_datechange1(BuildContext context)async{
    final DateTime? _datechange1=await showDatePicker(context: context,
        initialDate: _currentdate1,
        firstDate: DateTime(2001),
        lastDate: _currentdate1);
    if(_datechange1!=null){
      setState(() {
        _currentdate1=_datechange1;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    
  String _joningdate=DateFormat.yMMMd().format(_currentdate1);

    h =MediaQuery.of(context).size.height;
    w=  MediaQuery.of(context).size.width;
    return Padding(
      padding:  EdgeInsets.only(left: w*0.050,right: w*0.050,top: h*0.155),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
      
          styleText("Fill the Details", DARK_CLR, FontWeight.bold, 19),
      
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
                                            controller: searchLocationCantroller,
                                            decoration: InputDecoration(
                                              errorText: "",
                                              errorStyle: TextStyle(height: 0),
                                                hintText: "Pet Name",
                                                hintStyle: TextStyle(
                                                    color: GRAY_CLR,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.normal),
                                                border: InputBorder.none)),
                                        
                                          ),
      
      
                                            Container(
                                              padding: EdgeInsets.only(left: 10),
                                          alignment: Alignment.center,
                                          height: h*0.065,
                                          margin: EdgeInsets.only(top: h * 0.020),
                                      decoration: BoxDecoration(
                                  
                                        color: WHITE_CLR,
                                        borderRadius: BorderRadius.circular(10),
                                       border: Border.all(color: BORDER_CLR,width: 1)
                                        
                                      ),
                                          child: TextFormField(
                                            controller: searchLocationCantroller,
                                            decoration: InputDecoration(
                                              errorText: "",
                                              errorStyle: TextStyle(height: 0),
                                                hintText: "Pets parent Name",
                                                hintStyle: TextStyle(
                                                    color: GRAY_CLR,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.normal),
                                                border: InputBorder.none)),
                                        
                                          ),
      
      
                          Container(
                            height: h*0.065,
                            margin: EdgeInsets.only(top: h*0.020),
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
      
                            // add extra sugar..
                            icon: Icon(Icons.keyboard_arrow_down_sharp,color: GRAY_CLR.withOpacity(0.5),size: 30,),
                            iconSize: 30,
                           
      
                          ),
                        ),
                      ),
      
      
                                          
                      Row(
                       
                        children:<Widget>[
                          SizedBox(
                            width: 20,
                            height: 20,
                            child: Radio(
                            activeColor: GREEN_CLR,
                            value: "male", 
                            groupValue: gender, 
                            onChanged: (value){
                              setState(() {
                                  gender = value.toString(); 
                              });
                            },
                  ),
                          ),
                          SizedBox(width: w*0.030,),

                  styleText("Male", DARK_CLR, FontWeight.normal, 15),
                    
                     Radio(
                    
                     activeColor: GREEN_CLR,
                  
                      value: "female", 
                      groupValue: gender, 
                      onChanged: (value){
                        setState(() {
                            gender = value.toString();
                        });
                      },
                  ),
                         styleText("Female", DARK_CLR, FontWeight.normal, 15),
                        ],
                      ),
      
              
              
      
                          Container(
                            height: h*0.065,
                         
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
                            value: weightDropdoun,
                            onChanged: (String? newValue) =>
                                setState(() => weightDropdoun = newValue!),
                            items: weightItems
                                .map<DropdownMenuItem<String>>(
                                    (String value) =>
                                    DropdownMenuItem<String>(
                                    
      
                                      value: value,
                                      child: Text(value,style: TextStyle(color: GRAY_CLR,fontSize: 14),),
                                    ))
                                .toList(),
      
                            // add extra sugar..
                            icon: Row(
                              children: [
                                Text("KG",style: TextStyle(color: GRAY_CLR,fontSize: 15),),
                                
                                Icon(Icons.keyboard_arrow_down_sharp,color: GRAY_CLR.withOpacity(0.5),size: 30,),
                              ],
                            ),
                            iconSize: 30,
                           
      
                          ),
                        ),
                      ),
      
      
                         
                                    Container(
                            height: h*0.065,
                            margin: EdgeInsets.only(top: h*0.020),
                        decoration: BoxDecoration(
                          color: WHITE_CLR,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: BORDER_CLR,width: 1)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15,right: 15),
                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("$_currentdate1",style: TextStyle(color: GRAY_CLR,fontSize: 14),),
                                 
                               
      
                           
                            GestureDetector(
                              onTap: (){
                                _datechange1(context);
                              },
                              child: Icon(Icons.calendar_month,color: GRAY_CLR.withOpacity(0.5),size: 18,))]
                           
                           
      
                          ),
                        ),
                      ),
      
                          
                                          
      
      
        Container(
                    alignment: Alignment.center,
                    height: h*0.16,
                    width: w*1,
                    margin: EdgeInsets.only(top: h*0.020),
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
      
      
        ],),
      ),
    );
  }



}


