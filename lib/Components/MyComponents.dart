

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:techblog/Components/TextStyle.dart';
import 'package:techblog/Controller/HomeScreenController.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Const/Colors.dart';
import '../Models/FakeData.dart';
import '../gen/assets.gen.dart';


class TechDivider extends StatelessWidget {
  const TechDivider({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: SolidColors.dividerColor,
      indent: size.width/7,
      endIndent: size.width/7,
      thickness: 0.5,
    );
  }
}

class MainTags extends StatelessWidget {
   MainTags({
    Key? key,
    required this.txttheme,
    required this.index
  }) : super(key: key);

  final TextTheme txttheme;
  var index;

  @override
  Widget build(BuildContext context) {
    return Container(
      //width nemidim ke motaghayer bana be text toosh begire
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(23)),
          gradient: LinearGradient(
              colors: GradiantColors.tags,
              begin: Alignment.centerRight,
              end: Alignment.centerLeft)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(6, 6, 6, 6),
        child: Row(
          children: [
            //image icon chon ham ax bashe ham khasiat icon
            ImageIcon(
                Image.asset(Assets.icons.tag.path).image,
                color: Colors.white,
                size: 15),
            SizedBox(width: 8),
            Text(
              Get.find<HomeScreenController>().tagsList[index].title!,
              style: txttheme.headline2,
            )
          ],
        ),
      ),
    );
  }
}

 MylaunchUrl (String url) async {

    var uri = Uri.parse(url);

   if (await canLaunchUrl(uri)) {

     await launchUrl(uri);

  } else {

     log("Could not launch ${uri.toString()}");
   }
}

class MyLoadingSpinkit extends StatelessWidget {
  const MyLoadingSpinkit({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpinKitFadingCube(size: 30 ,color: SolidColors.primaryColor);
  }
}

PreferredSize MYAppbar(String title) {
  return PreferredSize(
    preferredSize: Size.fromHeight(60),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 14),
            child: Center(child: Text(title , style: appBarTextStyle)),
          )
        ],
        leading: Padding(
          padding: const EdgeInsets.only(right: 12),
          child: Container(
            height: 35,
            width: 35,
            child: IconButton(

               icon : Icon(Icons.keyboard_arrow_right),
              onPressed: (){
                 Get.back();
              },
            ),

            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: SolidColors.primaryColor.withAlpha(185)
            ),
          ),
        ) ,
      ),
    ),
  );
}

class HomePage_BlogBlueTitle extends StatelessWidget {
  const HomePage_BlogBlueTitle({
    Key? key,
    required double bodymargin,
    required this.txttheme,
    required this.title,
  })  : _bodymargin = bodymargin,
        super(key: key);

  final double _bodymargin;
  final TextTheme txttheme;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: _bodymargin, bottom: 8),
      child: Row(
        children: [
          ImageIcon(
            Image.asset(Assets.icons.pencilIcon.path).image,
            color: SolidColors.seeMore,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            title,
            style: txttheme.headline3,
          )
        ],
      ),
    );
  }
}