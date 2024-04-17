import 'package:flutter/material.dart';
import 'package:ict4c/features/auth/login_screen.dart';
import 'package:ict4c/utils/color.dart';
import 'package:ict4c/utils/utils.dart';

class MainScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Container(
          //margin: EdgeInsets.all(MediaQuery.of(context).size.width/10),
          color: ColorsApp.primaryColor,
          height: getHeight(MediaQuery.of(context).size.height, context),
          width: getWidth(MediaQuery.of(context).size.width, context),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
                  Spacer(),
                  Container(
                    margin: EdgeInsets.only(top:MediaQuery.of(context).size.width/10,left:MediaQuery.of(context).size.width/10,
                        right:MediaQuery.of(context).size.width/10,bottom:MediaQuery.of(context).size.width/85),
                    child:Text("Start your experience on ICT4C Programming",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: getWidth(getWidth(20, context), context),
                        fontWeight: FontWeight.bold,
                        color: ColorsApp.neutralColor,
                      ),
                    ) ,
                  ),
               Container(
                 margin: EdgeInsets.only(top:MediaQuery.of(context).size.width/10,left:MediaQuery.of(context).size.width/10,
                     right:MediaQuery.of(context).size.width/10,bottom:MediaQuery.of(context).size.width/15),
                 child:Text("You can start your experience by creating an account or "
                   "quickly browsing the  anonymous account created  by ICT4C Programming",
                 textAlign: TextAlign.center,
                 style: TextStyle(color: ColorsApp.greyColor),
               ) ,
               ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsApp.secondColor,
                  fixedSize: Size(getWidth(MediaQuery.of(context).size.width/2, context),MediaQuery.of(context).size.height/20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22),
                  )
              ),
              onPressed:(){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext ctx) {
                    return LoginScreen();
                  }),
                );
              } ,
              child: Text("Connect",
                style: TextStyle(color: ColorsApp.neutralColor,
                  fontSize: getWidth(17, context),
                ),
              ),
            ),
              Spacer(),
              Container(
                margin: EdgeInsets.only(bottom: getHeight(10, context)),
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: (){},
                  child: Text("Accedez a l'apllication",
                    style: TextStyle(color: ColorsApp.secondColor,
                    fontSize: getWidth(15, context)
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}