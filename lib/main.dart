import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:techblog/Const/Colors.dart';
import 'package:techblog/View/Article/ManagerArticle.dart';
import 'package:techblog/View/Article/SingleManageArticleScreen.dart';
import 'package:techblog/View/MainScreens/MainScreen.dart';
import 'package:techblog/View/Article/SingleScreen.dart';
import 'package:techblog/View/PodCast/SinglePodcast.dart';
import 'package:techblog/View/SplashScreen.dart';
import 'package:get_storage/get_storage.dart';
import 'package:techblog/binding.dart';
import 'package:techblog/my_http_overrides.dart';


Future<void> main() async {
  HttpOverrides.global = MyHttpOverrides();
  SystemChrome.setSystemUIOverlayStyle(

      /// phone ui statusbar
      SystemUiOverlayStyle(
    statusBarColor: SolidColors.statusBarColor,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: SolidColors.systemNavigationBarColor,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var txttheme = Theme.of(context).textTheme;

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: Locale('fa'),
      theme: LightTheme(txttheme),
      getPages: [
        GetPage(
            name: Namedroute.routeMainScreen,
            page: () => MainScreen(),
            binding: RegisterBinding()),
        GetPage(
            name: Namedroute.routeSingleArticle,
            page: () => SingleScreen(),
            binding: ArticleBinding()),
        GetPage(
            name: Namedroute.routeManageArticle,
            page: () => ManageArticles(),
            binding: ArticleManagerBinding()),
        GetPage(
            name: Namedroute.routeSingleManageArticle,
            page: () => SingleManageArticleScreen(),
            binding: ArticleManagerBinding()),
        GetPage(
            name: Namedroute.routeSinglePodcast,
            page: () => SinglePodcast()),
      ],
      home: SplashScreen(),
    );
  }


  ThemeData LightTheme(TextTheme txttheme) {
    return ThemeData(
        inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(width: 1.8),
            ),
            filled: true,
            fillColor: Colors.white),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(

            animationDuration: Duration(seconds: 1),
            fixedSize: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return Size(Get.width / 1.46, Get.height/22.5);
              }
              return Size(Get.width / 1.42, Get.height/20);
            }),

            // textStyle: MaterialStateProperty.resolveWith((states) {
            //   if (states.contains(MaterialState.pressed)) {
            //     return txttheme.headline1;
            //   }
            //   return txttheme.subtitle1;
            // }),

            backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return Color(0xc0381c5f);
              }
              return SolidColors.primaryColor;
            }),

          ),
        ),
        fontFamily: 'dana',
        textTheme: TextTheme(
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
              color: SolidColors.primaryColor,
              fontFamily: 'dana',
              fontSize: 17,
              fontWeight: FontWeight.bold),
          headline6: TextStyle(
              color: SolidColors.hintText,
              fontFamily: 'dana',
              fontSize: 17,
              fontWeight: FontWeight.bold),
        ));
  }
}



 class Namedroute{

  Namedroute._();
   //PageRoutingNames
   static String routeMainScreen = "/MainScreen";
   static String routeSingleArticle = "/SingleArticle";
   static String routeManageArticle = "/ManageArticle";
   static String routeSingleManageArticle = "/SingleManageArticle";
   static String routeSinglePodcast = "/SinglePodcast";

 }