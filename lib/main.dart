import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:techblog/Components/Colors.dart';
import 'package:techblog/View/MainScreen.dart';
import 'package:techblog/View/RegisterIntro.dart';





void main() {

  SystemChrome.setSystemUIOverlayStyle(
    /// phone ui statusbar
      SystemUiOverlayStyle(
        statusBarColor: SolidColors.statusBarColor,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: SolidColors.systemNavigationBarColor,
        systemNavigationBarIconBrightness: Brightness.dark,
      )
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    var txttheme = Theme.of(context).textTheme;


    return MaterialApp(
      debugShowCheckedModeBanner: false,

      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('fa', ''), // Farsi
      ],

      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(width: 1.8),
          ),
          filled: true,
          fillColor: Colors.white
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return txttheme.headline1;
              }
              return txttheme.subtitle1;
            }),
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return SolidColors.seeMore;
              }
              return SolidColors.primaryColor;
            }),
          ),
        ),
        fontFamily: 'dana',
        textTheme: const TextTheme(
          headline1: TextStyle(
              color: SolidColors.posterTitle,
              fontFamily: 'dana',
              fontSize: 16,
              fontWeight: FontWeight.w700),

          subtitle1: TextStyle(
              color: SolidColors.posterSubTitle,
              fontFamily: 'dana',
              fontSize: 13.8,
              fontWeight: FontWeight.w300),

          bodyText1: TextStyle(
              color: Colors.black,
              fontFamily: 'dana',
              fontSize: 13,
              fontWeight: FontWeight.w300),

          headline2: TextStyle(
              color: Colors.white,
              fontFamily: 'dana',
              fontSize: 14,
              fontWeight: FontWeight.w300),

          headline3: TextStyle(
              color: SolidColors.seeMore,
              fontFamily: 'dana',
              fontSize: 14,
              fontWeight: FontWeight.w700),

          headline4: TextStyle(
              color: Colors.black,
              fontFamily: 'dana',
              fontSize: 14,
              fontWeight: FontWeight.w700),

          headline5: TextStyle(
              color:  SolidColors.primaryColor,
              fontFamily: 'dana',
              fontSize: 17,
              fontWeight: FontWeight.bold),

          headline6: TextStyle(
              color:  SolidColors.hintText,
              fontFamily: 'dana',
              fontSize: 17,
              fontWeight: FontWeight.bold),

        )),
      home: MainScreen(),
    );
  }
}


