
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:techblog/Const/Colors.dart';
import 'package:techblog/main.dart';
import '../gen/assets.gen.dart';

class SplashScreen extends StatefulWidget{
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // 2.1 saniye sabr bokon bad boro saafe dige
    Future.delayed(Duration(milliseconds: 1750)).then((value) {
      Get.offAndToNamed(Namedroute.routeMainScreen);
    });

   super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255,255, 255,255),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Assets.images.logo.path, height: 64,),
            SizedBox(height: 30,),
            SpinKitFadingCube(
              color: SolidColors.primaryColor,
              size: 35,
            )
          ],
        ),
      ),
    );
  }
}