import 'package:flutter/material.dart';
import 'package:ict4c/utils/color.dart';
import 'package:ict4c/utils/utils.dart';
import 'package:ict4c/widget/widget.dart';

class LoginScreen extends StatefulWidget{
  @override
    LoginScreenState createState()=>LoginScreenState();
}
 class LoginScreenState extends State<LoginScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
          height: getHeight(MediaQuery.of(context).size.height, context),
          width: getWidth(MediaQuery.of(context).size.width, context),
          color: ColorsApp.primaryColor,
        alignment:Alignment.center ,
        child: Center(
          child:Container(
            alignment: Alignment.center,
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                title(context: context, titlePage: "Binevenue chers users", sizeWidth: 250, sizeHeight:30),
                subTitle(context: context, titlePage:"Bienvenue a nouveau nous vous attendions impatiement", sizeWidth: 250, sizeHeight: 30),
                textfieldAuthentification(context: context, sizeWidth: 300, sizeHeight: 50,iconRepresentation:Icon(Icons.mail))
              ],
            ),
          )
        ),
          ),
    );
  }
 }