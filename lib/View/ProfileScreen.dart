
import 'package:flutter/material.dart';
import '../Components/Colors.dart';

import '../Components/MyComponents.dart';
import '../Components/Strings.dart';
import '../gen/assets.gen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    Key? key,
    required this.size,
    required this.txttheme,
    required double bodymargin,
  }) : super(key: key);

  final Size size;
  final TextTheme txttheme;

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          SizedBox(height: 55),
          Image(image:Image.asset(Assets.images.profileAvatar.path).image, height:110),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageIcon(Image.asset(Assets.icons.pencilIcon.path).image, color: SolidColors.seeMore ),
              SizedBox(width: 5),
              Text(MyStrings.imageProfileEdit, style: txttheme.headline3,)
            ],
          ),
          SizedBox(height: 60),
          Text("فاطمه امیری", style: txttheme.headline5,),
          SizedBox(height: 5),
          Text("FatemehAmiri@gmail.com", style: txttheme.headline4,),
          SizedBox(height: 50),
          TechDivider(size: size), // in component file
          InkWell(
            onTap: () {},
            splashColor: SolidColors.primaryColor,
            child: SizedBox(
              height: 45,
                child: Center(
                    child: Text(MyStrings.myFavBlog, style: txttheme.headline4,))),
          ),
          TechDivider(size: size), // in component file
          InkWell(
            onTap: () {},
            splashColor: SolidColors.primaryColor,
            child: SizedBox(
              height: 45,
                child: Center(
                    child: Text(MyStrings.myFavPodcast, style: txttheme.headline4,))),
          ),
          TechDivider(size: size), // in component file
          InkWell(
            onTap: () {},
            splashColor: SolidColors.primaryColor,
            child: SizedBox(
              height: 45,
                child: Center(
                    child: Text(MyStrings.logOut, style: txttheme.headline4,))),
          ),
          SizedBox(height: 65),


        ],
      )
    );
  }
}


