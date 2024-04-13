import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ict4c/features/onboard/onboarding_screen.dart';
import 'features/onboard/controller/onbaord_controller.dart';
import 'l10n/l10n.dart';
import 'package:ict4c/utils/color.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
  FlutterNativeSplash.remove();
}



class MyApp extends StatelessWidget {
   MyApp({super.key});
  //ColorsApp couleur=ColorsApp();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FlutterSizer(builder: (context, orientation, screenType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ICT4C',
        theme: ThemeData(
          primarySwatch:ColorsApp.couleurPrimaire,
          useMaterial3: false,
        ),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        supportedLocales: L10n.all,
        home: OnboardingParentWidget(),
        //Center(child: Text(AppLocalizations.of(context)?.hello_word ?? 'Fallback Text'))
        // transalte texte see online doc for intl package
      );
    });
  }
}
