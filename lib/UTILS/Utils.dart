import 'package:flutter/material.dart';
import 'package:pet_app/Colors/COLORS.dart';


//Default Button
class DefaultButton extends StatelessWidget {
  final String text;
  final double height;
  final double width;
  final Function() ontap;
  final double fontsize;

  const DefaultButton({
    Key? key,
    required this.text,
        required this.ontap,
    required this.fontsize,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
          alignment: Alignment.center,
          height: height,
          width: width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: GREEN_CLR),
          child: Text(text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: WHITE70_CLR,
                fontSize: fontsize,
        

              ))),
    );
  }
}





//Default Navigator
Navigate_to( BuildContext context, Widget widget)
{
return Navigator.push(context, MaterialPageRoute(builder: (ctx)=>widget));
}



AppBar DefaultAppBar(
  String _text
){
  return  AppBar(centerTitle: true,
      toolbarHeight: 70,
      backgroundColor: WHITE70_CLR,
      elevation: 1,
      title: styleText( _text, DARK_CLR, FontWeight.bold, 17), 
      );
}

//DefultText
Text styleText(
    String _value, Color _color, FontWeight _weight, double _fontSize,) {
  return Text(
    _value,
    style: TextStyle(color: _color, fontWeight: _weight, fontSize: _fontSize),
    textAlign: TextAlign.start,
  );
}




Text TutorialText(
    String _value, Color _color, FontWeight _weight, double _fontSize,) {
  return Text(
    _value,
    style: TextStyle(color: _color, fontWeight: _weight, fontSize: _fontSize),
    textAlign: TextAlign.center,
  );
}


  class DefaultRadioButton extends StatelessWidget{


final String text;
final int groupValue;
final int value;

 
  final Function(int?) ontap;

  const DefaultRadioButton({
    Key? key,
    required this.text,
     required this.groupValue,
     required this.value,
     
        required this.ontap,
    
  }) : super(key: key);
  
 
  @override
  Widget build(BuildContext context) {
    return   Container(
                                      padding: EdgeInsets.only(left: 10,right: 10),
                                        alignment: Alignment.center,
                                        height: 50,
                                        margin: EdgeInsets.only(top: 20),
                                    decoration: BoxDecoration(
                                
                                      color: WHITE_CLR,
                                      borderRadius: BorderRadius.circular(10),
                                     border: Border.all(color: BORDER_CLR,width: 1)
                                      
                                    ),
                                        child:    Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [


                                            styleText(text, GREEN_CLR, FontWeight.normal, 15),
                                            SizedBox(
                    height: 20,
                    width: 20,
                    child: Radio(
                      value: value,
                      groupValue: groupValue,
                      activeColor:GREEN_CLR,
                      onChanged: ontap,
                    )
                                            )
                                          ]
                                        )
    );
    
                  
  }

  
 
  
 
}