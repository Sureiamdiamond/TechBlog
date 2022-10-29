import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:techblog/Components/Colors.dart';
import 'package:techblog/View/RegisterIntro.dart';

import 'package:techblog/gen/assets.gen.dart';


import 'Homescreen.dart';
import 'ProfileScreen.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {


  final GlobalKey<ScaffoldState> _key = GlobalKey();


  ///on index entekhab
  var selectedPageIndex = 0 ;

  @override
  Widget build(BuildContext context) {

    ///theme text
    var txttheme = Theme.of(context).textTheme;

    ///size app
    var size = MediaQuery.of(context).size;

    ///fasleh az rast
    double _bodymargin = size.width / 12.5;


    return SafeArea(
      child: Scaffold(
        key: _key,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),

        ///Drawer
        drawer: Drawer (
          backgroundColor: SolidColors.scaffoldBg,
          child: Padding(
            padding:  EdgeInsets.only(right: _bodymargin , left: _bodymargin),
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
                  onTap: (){},
                ),
                Divider(
                  color: SolidColors.dividerColor,
                ),
                ListTile(
                  title: Text("تک بلاگ در گیت هاب", style: txttheme.headline4),
                  onTap: (){},
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
                child: IndexedStack(
                  index: selectedPageIndex,
                  children: [
                    HomeScreen(size: size, txttheme: txttheme, bodymargin: _bodymargin),//0
                    ProfileScreen(size: size, txttheme: txttheme, bodymargin: _bodymargin),//1
                    RegisterIntro()//2
                  ],
                )
            ),

            ///BottomNavigationBar
            ButtomNavigationBar(
                size: size,
                bodymargin: _bodymargin ,
                changeScreen: (int value){
                  setState( () {
                    selectedPageIndex = value;
                  });
                }),
          ],
        ),

      ),
    );
  }
}










class ButtomNavigationBar extends StatelessWidget {
  const ButtomNavigationBar({
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
      bottom: 0,
      right: 0,
      left: 0,
      child: Container(
        height: size.height/10,
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
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              gradient: LinearGradient(
                  colors: GradiantColors.buttomNav
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed:(() => changeScreen(0)),
                  icon: ImageIcon(Image.asset(Assets.icons.navhomeIcon.path ).image, color: Colors.white),
                ),///home
                IconButton(
                  onPressed:()=> changeScreen(2),
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


