import 'package:flutter/material.dart';
import 'package:ict4c/features/onboard/screens/main_screen.dart';
import 'package:provider/provider.dart';
import 'package:ict4c/utils/color.dart';
import 'controller/onbaord_controller.dart';
import 'screens/onboard_content.dart';
import 'package:ict4c/utils/utils.dart';
import 'package:ict4c/l10n/l10n.dart';
import 'package:ict4c/utils/color.dart';
//import 'package:ict4c/features/onboard/controller/onbaord_controller.dart';

class OnboardingScreen extends StatelessWidget{
  final liste=OnboardContent();
  @override
  Widget build(BuildContext context) {
    final onboardControllerNotifier = Provider.of<OnboardingProvider>(context);
    return Scaffold(
     body: Consumer<OnboardingProvider>(
       builder: (context,onboardingProvider,_){
         return Column(
           children: [
             Expanded(
                 child: PageView(
                   controller: onboardingProvider.pageController,
                   onPageChanged: (index){
                     onboardingProvider.setCurrentPageIndex(index);
                   },
                   children: [
                     onboardAffich(liste, 0,context),
                     onboardAffich(liste, 1,context),
                     onboardAffich(liste, 2,context),
                   ],
                 ),
                ),
             Container(
               color:ColorsApp.primaryColor,
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: _buildPageIndicator(context, onboardingProvider.currentPageIndex),
               ),
             ),
           ],
         );
       },
     ),
   );
  }
  Container onboardAffich(OnboardContent liste,int i,BuildContext context) {
    return Container(
      color: ColorsApp.primaryColor,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/25,bottom: MediaQuery.of(context).size.height/5),
            child: skipButton(context, i),
          ),
          //Spacer(),
          //Column(),
          Container(
              width: getHeight(300, context),
              height: getWidth(300, context),
              child: Image.asset(liste.displayList[i].imagePath,fit: BoxFit.contain,),
          ),
          //Spacer(flex: 1,),
          //Text(AppLocalizations.of(context)?.hello_word ?? 'Fallback Text')
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left:getWidth(20, context),right: getWidth(20, context),),
            child:Text(liste.displayList[i].textDescription,
              textAlign: TextAlign.center,
              style: TextStyle(
                decoration: TextDecoration.none,
                color: Colors.white,
                fontWeight:FontWeight.bold,
                fontStyle: FontStyle.italic,
                fontSize: getWidth(20, context),
              ),
            ),
          ),
            Spacer(),
            Container(
              child: getStartedButton(context, i),
            ),
            Spacer(),
        ],
      ),
    );
  }
  Container? skipButton(BuildContext context,int index){
    if(index==0 || index==1){
      return Container(
        width: getWidth(MediaQuery.of(context).size.width, context),
        alignment: Alignment.bottomRight,
        child: TextButton(
          //style: ButtonStyle(backgroundColor:ColorsApp.secondColor),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (BuildContext ctx) {
                return onboardAffich(liste, 2, context);
              }),
            );
          },
          child: Text(
            "Skip",
            style: TextStyle(
              decoration: TextDecoration.none,
              color: ColorsApp.secondColor,
              fontSize:getWidth(18, context),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    }
    else return null;
  }
  ElevatedButton? getStartedButton(BuildContext context,int index){
    if(index==2){
      return ElevatedButton(
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
                return MainScreen();
              }),
            );
          } ,
          child: Text("Get Started",
            style: TextStyle(color: ColorsApp.neutralColor,
              fontSize: getWidth(17, context),
            ),
          ),
      );
    }
    else return null;
  }
}
List<Widget> _buildPageIndicator(BuildContext context, int currentIndex) {
  List<Widget> indicators = [];
  final pageControllerNotifier = Provider.of<OnboardingProvider>(context);

  for (int i = 0; i < 3; i++) {
    indicators.add(
      Container(
        width: 8,
        height: 8,
        margin: EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: currentIndex == i ? ColorsApp.secondColor : ColorsApp.neutralColor,
        ),
      ),
    );
  }
  return indicators;
}
class OnboardingParentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<OnboardingProvider>(
      create: (context) => OnboardingProvider(),
      child: OnboardingScreen(),
    );
  }
}
