import 'package:flutter/material.dart';

import '../Colors/COLORS.dart';
import '../UTILS/Utils.dart';
class Help1 extends StatefulWidget {
  const Help1({Key? key}) : super(key: key);

  @override
  State<Help1> createState() => _Help1State();
}

class _Help1State extends State<Help1> {
  var h;
  var w;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: WHITE70_CLR,
      appBar: AppBar(
        toolbarHeight: h*0.08,
        centerTitle: true,
        backgroundColor: WHITE70_CLR,
        elevation: 1,
        title: styleText( "Help & Support", DARK_CLR, FontWeight.bold, 17),
      ),
      body: Padding(
        padding:  EdgeInsets.only(top: h*0.03,left: w*0.04,right: w*0.04),
        child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        style: TextStyle(color: GREEN_CLR,fontWeight: FontWeight.normal,fontSize: 15),
          textAlign: TextAlign.start,
        ),
      ),
    );
  }
}