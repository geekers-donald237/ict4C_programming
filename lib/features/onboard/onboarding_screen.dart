import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ict4c/utils/color.dart';
import 'controller/onbaord_controller.dart';
import 'screens/onboard_content.dart';
import 'package:ict4c/utils/utils.dart';
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
               color:ColorsApp.couleurPrimaire,
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
      color: ColorsApp.couleurPrimaire,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(),
          //Column(),
          Container(
              width: getHeight(300, context),
              height: getWidth(300, context),
              child: Image.asset(liste.listesAffiche[i].imagePath,fit: BoxFit.contain,),
          ),
          //Spacer(flex: 1,),
          //Text(AppLocalizations.of(context)?.hello_word ?? 'Fallback Text')
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left:getWidth(20, context),right: getWidth(20, context),),
            child:Text(liste.listesAffiche[i].textDescrip,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight:FontWeight.bold,
                fontStyle: FontStyle.italic,
                fontSize: getWidth(20, context),
              ),
            ),
          ),
            Spacer(),
          Container(
            width: getWidth(MediaQuery.of(context).size.width, context),
            child:nextButton(i,context),
          )
        ],
      ),
    );
  }
  Container? nextButton(int index,BuildContext context){
    if(index==2){
      return Container(
        alignment: Alignment.bottomRight,
        child: IconButton(
              onPressed:(){},
              icon:Icon(Icons.arrow_forward,size: getWidth(30, context),),color: Colors.white,)
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
          color: currentIndex == i ? ColorsApp.couleurSecondaire : ColorsApp.couleurNeutre,
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
