// create file/folder for displaying different type reusable widget
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ict4c/utils/color.dart';
import 'package:ict4c/utils/utils.dart';
//title page
Container title({required BuildContext context,required String titlePage,required double sizeWidth,required double sizeHeight}){
  return Container(
    width: getWidth(sizeWidth, context),
    height: getHeight(sizeHeight, context),
    margin: EdgeInsets.all(5),
    child: Text(titlePage,
      textAlign: TextAlign.center,
      style: TextStyle(color: ColorsApp.neutralColor,
          fontSize:getWidth(20, context),
          fontWeight: FontWeight.bold),
    ),
  );
}
Container subTitle({required BuildContext context,required String titlePage,required double sizeWidth,required double sizeHeight}){
  return Container(
    width: getWidth(sizeWidth, context),
    height: getHeight(sizeHeight, context),
    margin: EdgeInsets.all(5),
    alignment: Alignment.center,
    child: Text(titlePage,
      textAlign: TextAlign.center,
      style: TextStyle(color: ColorsApp.neutralColor,
          fontSize:getWidth(14, context),
          fontWeight: FontWeight.w500),
    ),
  );
}
Container textfieldAuthentification({required BuildContext context,required double sizeWidth,required double sizeHeight,required Icon iconRepresentation}){
  return Container(
    width: getWidth(sizeWidth, context),
    height: getHeight(sizeHeight, context),
    alignment: Alignment.center,
    margin: EdgeInsets.all(25),
    padding: EdgeInsets.only(left: 10),
    decoration: BoxDecoration(
      border: Border.all(color: ColorsApp.greyColor), // Couleur de la bordure
      borderRadius: BorderRadius.circular(20), // Forme de la bordure
    ),
    child: TextField(
      decoration: InputDecoration(
        hintText: 'Email',
        hintStyle: TextStyle(color: ColorsApp.neutralColor),
        suffixIcon: (iconRepresentation),
      ),
    ),
  );
}