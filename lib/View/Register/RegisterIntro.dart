import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:techblog/Const/Strings.dart';
import 'package:techblog/Controller/RegisterController.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:validators/validators.dart';


// ignore: must_be_immutable
class RegisterIntro extends StatelessWidget {
RegisterIntro({super.key});

//binding ast
var registerController = Get.find<RegisterController>();

  @override
  Widget build(BuildContext context) {
    ///theme text
    var txttheme = Theme.of(context).textTheme;

    ///size app
     var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          Assets.images.robot,
          height: 100,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: MyStrings.welcom, style: txttheme.headline4)),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 35.0),
          child: ElevatedButton(
            onPressed: (() {
              _showEmailButtonSheet(context, size, txttheme);
            }),
            child: Text(
              "بزن بریم!",
            ),
          ),
        )
      ],
    ),
      ),
    );
  }
Future<dynamic> _showEmailButtonSheet (

    BuildContext context , Size size , TextTheme txttheme){

  return showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) {
      return Padding(
        ///baraye vaghtiye ke keyboard miyad bala nare roye text field
        padding:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          height: size.height/2,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25),
                  topLeft: Radius.circular(25)
              )
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  MyStrings.insertYourEmail , style: txttheme.headline4,),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24,20,24,0),
                  child: TextField(
                    controller: registerController.emailTextEditingController,
                    onChanged: (value) {

                      //regexp
                      //print(value + "is Email = " + isEmail.hasMatch(value).toString());

                      ///validator package
                      isEmail(value);
                      print(value+" is email ? " + isEmail(value).toString());

                    },
                    style: txttheme.headline6,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: "techblog@gmail.com",
                      hintStyle: txttheme.headline6,

                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: ElevatedButton(
                      onPressed: (){
                        registerController.register();
                        Navigator.pop(context);
                        ActivatedCode(context, size, txttheme);

                      },
                      child: Text("ادامـه")
                  ),
                )
              ],
            ),
          ),
        ),
      );
    },);
}

Future<dynamic> ActivatedCode (
    BuildContext context , Size size , TextTheme txttheme){

  // RegExp isEmail = RegExp('^[a-z-0-9]+@');

  return showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) {
      return Padding(
        ///baraye vaghtiye ke keyboard miyad bala nare roye text field
        padding:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          height: size.height/2,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25),
                  topLeft: Radius.circular(25))),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  MyStrings.activateCode , style: txttheme.headline4,),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24,20,24,0),
                  child: TextField(
                    controller: registerController.activeCodeTextEditingController,
                    ///onchange mige harchi toye tesxtfield taghier kardo bede bbinam
                    onChanged: (value) {
                      //regexp
                      //print(value + "is Email = " + isEmail.hasMatch(value).toString());

                      ///validator package
                      isEmail(value);
                      print(value+" is email ? " + isEmail(value).toString());

                    },
                    style: txttheme.headline6,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: "* * * * * *",
                      hintStyle: txttheme.headline6,

                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: ElevatedButton(
                      onPressed: (){
                        registerController.verify();

                      },
                      child: Text("تایید")
                  ),
                )
              ],
            ),
          ),
        ),
      );
    },);
  }
}


