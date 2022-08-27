
import 'package:flutter/material.dart';
import 'package:techblog/Colors.dart';
import 'package:techblog/gen/assets.gen.dart';


class MainScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    ///size app
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255,255, 255,255),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(0,13,0,0),
          child: Column(
            children: [
              ///appbar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.menu),
                  Image(image: Image.asset(Assets.images.logo.path).image , height: size.height/13.6,),
                  Icon(Icons.search)
                ],
              ),
              SizedBox(height: 8),
              Stack(
                children: [
                  ///cover poster
                  Container(

                    width: size.width/1.20,
                    height: size.height/4.20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                     image: DecorationImage(
                       image:  Image.asset(Assets.images.programming.path).image,
                       fit: BoxFit.cover
                     )
                    ),

                  ),
                  ///cover poster shadow
                  Container(

                    width: size.width/1.20,
                    height: size.height/4.20,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        gradient: LinearGradient(
                          colors: GradiantColors.HomePosterCoverGradiant,
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter
                        )
                    ),

                  ),
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}