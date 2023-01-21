import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:techblog/Components/Decorations.dart';
import 'package:techblog/Components/Dimens.dart';
import 'package:techblog/Const/Colors.dart';
import 'package:techblog/Components/MyComponents.dart';
import 'package:techblog/Const/Strings.dart';
import 'package:techblog/Controller/RegisterController.dart';
import 'package:techblog/View/Register/RegisterIntro.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'Homescreen.dart';
import 'ProfileScreen.dart';


final GlobalKey<ScaffoldState> _key = GlobalKey();

class MainScreen extends StatelessWidget {

  ///on index entekhab
  RxInt selectedPageIndex = 0.obs ;

  @override
  Widget build(BuildContext context) {


    ///theme text
    var txttheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;




    return Scaffold(
      key: _key,
      backgroundColor: Color.fromARGB(255, 255, 255, 255),

      ///Drawer
      drawer: Drawer (
        backgroundColor: SolidColors.scaffoldBg,
        child: Padding(
          padding:  EdgeInsets.only(right: Dimens.bodymargin , left: Dimens.bodymargin),
          child: ListView(
            children: [
              DrawerHeader(
                  child: Image.asset(Assets.images.logo.path, scale: 2.5,)),
              ListTile(
                title: Text("پروفایل کاربری", style: txttheme.headline4),
                onTap: (){},
              ),
              Divider(
                color: SolidColors.dividerColor,
              ),
              ListTile(
                title: Text("درباره ی تک بلاگ", style: txttheme.headline4),
                onTap: (){},
              ),
              Divider(
                color: SolidColors.dividerColor,
              ),
              ListTile(
                title: Text("اشتراک گذاری تک بلاگ", style: txttheme.headline4),
                onTap: () async {
                  await Share.share(MyStrings.shareText);
                },
              ),
              Divider(
                color: SolidColors.dividerColor,
              ),
              ListTile(
                title: Text("تک بلاگ در گیت هاب", style: txttheme.headline4),
                onTap: (){
                  MylaunchUrl(MyStrings.techBlogGithubUrl);
                },
              ),

            ],
          ),
        ),
      ) ,

      ///APPBAR
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: (){

                _key.currentState!.openDrawer();

              },
                child: Icon(Icons.menu , color: Colors.black,)),
            Image(
              image: Image.asset(Assets.images.logo.path).image,
              height: size.height / 13.6,
            ),
            Icon(CupertinoIcons.search , color: Colors.black,)
          ],
        ),
      ),

      ///BODY
      body: Stack(
        children: [

          ///Main screen contents
          Positioned.fill(
            ///avaz kardan pages
              child: Obx(() =>
                  IndexedStack(
                    index: selectedPageIndex.value,
                    children: [
                      HomeScreen(size: size, txttheme: txttheme, bodymargin:Dimens.bodymargin),//0
                      ProfileScreen(size: size, txttheme: txttheme, bodymargin: Dimens.bodymargin),//1
                      RegisterIntro()//2
                ],
              ))
          ),

          ///BottomNavigationBar
          ButtomNavigationBar(size: size, bodymargin: Dimens.bodymargin,
              changeScreen: (int value){

                  selectedPageIndex.value = value;

              }),
        ],
      ),

    );
  }


}




class ButtomNavigationBar extends StatelessWidget {
   ButtomNavigationBar({
    Key? key,
    required this.size,
    required this.changeScreen,
    required double bodymargin,
  }) : _bodymargin = bodymargin, super(key: key);

  final Size size;
  final double _bodymargin;

  ///Gharare main screen ro taghir bede
  final Function (int)  changeScreen;




  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 6,
      right: 0,
      left: 0,
      child: Container(
        height: size.height/11.5,
        decoration: BoxDecoration(
         borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5)),
            gradient: LinearGradient(
                colors: GradiantColors.buttomNavBack,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter
            )
        ),
        child: Padding(
          padding:  EdgeInsets.only(right: _bodymargin, left: _bodymargin ),
          child: Container(
            height: size.height/8,
            decoration: myDecoration.mainGradiant,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed:(() => changeScreen(0)),
                  icon: ImageIcon(Image.asset(Assets.icons.navhomeIcon.path ).image, color: Colors.white),
                ),///home
                IconButton(
                  onPressed:(){
                    Get.find<RegisterController>().toggleLogin();
                  },
                  icon: ImageIcon(Image.asset(Assets.icons.navWriteicon.path).image,color: Colors.white),
                ),///write
                IconButton(
                  onPressed:(() => changeScreen(1)),
                  icon: ImageIcon(Image.asset(Assets.icons.navusericon.path).image, color: Colors.white,),
                ),///user

              ],
            ),
          ),
        ),
      ),
    );
  }
}


