

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:techblog/Const/api_Constant.dart';
import 'package:techblog/Services/DioService.dart';
import 'package:techblog/Const/Storage_const.dart';

import 'package:techblog/View/MainScreens/MainScreen.dart';
import 'package:techblog/View/Register/RegisterIntro.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/main.dart';


class RegisterController extends GetxController{

TextEditingController emailTextEditingController = TextEditingController();
TextEditingController activeCodeTextEditingController = TextEditingController();
 var email = '';
 var user_id ;

 register() async {
   Map <String, dynamic> map = {

     'email': emailTextEditingController.text,
     'command': 'register'

   };

   var response =  await DioService().postmeth(map, ApiURLConstant.PostRegister);

    email = emailTextEditingController.text;
    user_id = response.data['user_id'];
    print(response);

     }


  verify() async {
    Map <String, dynamic> map = {

    'email': email,
    'user_id': user_id,
    'code': activeCodeTextEditingController.text,
    'command' : "verify"

    };

    print(map);

  var response =  await DioService().postmeth(map, ApiURLConstant.PostRegister);

  debugPrint(response.data.toString());
  var status = response.data['response'];

  switch (status){
    case 'verified' :

        var box = GetStorage();
        box.write(Storagekey.token, response.data['token']);
        box.write(Storagekey.userId, response.data['user_id']);

        print("➡︎ READ :" + box.read(Storagekey.token));
        print("➡︎ READ :" + box.read(Storagekey.userId));

        Get.offAll(MainScreen());
      break;

      case 'incorrect_code' :
        Get.snackbar('خطا', 'کد فعال سازی اشتباه است');
      break;

      case 'expired' :
      Get.snackbar('خطا', 'کد فعال سازی منقضی شده است');
      break;

  }


}

  toggleLogin(){
     if(GetStorage().read(Storagekey.token) == null ){
       Get.to(RegisterIntro());
     } else{
       routeTowriteBottomsheet();
     }
  }




  routeTowriteBottomsheet(){
 Get.bottomSheet(
   Container(
     child: Padding(
       padding: const EdgeInsets.all(13.0),
       child: Column(
         children: [
           Row(
             children: [
               SvgPicture.asset(Assets.images.robot , height: 55,),
               SizedBox(width: 14),
               Text("دونسته هاتو با بقیه به اشتراک بذار...")
             ],
           ),
           SizedBox(
               height: 13),
           Text(
               """ فکر کن !! اینجا بودنت به این معناست که یک گیگ تکنولوژی هستی. دونسته هات رو با جامعه ی گیک های فارسی زبان به اشتراک بذار ;)"""),
           Expanded(
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [
                   GestureDetector(
                     onTap: (){
                       debugPrint("write article");
                       Get.toNamed(Namedroute.routeManageArticle);
                     },
                     child: Container(
                       color: Colors.white,
                       height: 36,
                       child: Row(
                         children: [
                           Image.asset(Assets.images.pencilbtsheet.path , height: 29,),
                           SizedBox(width: 10,),
                           Text("مدیریت مقاله ها")
                         ],
                       ),
                     ),
                   ),
                   GestureDetector(
                     onTap: (){
                       debugPrint("write Podcast");
                     },
                     child: Container(
                       color:
                       Colors.white,
                       height: 36,
                       child: Row(
                         children: [
                           Image.asset(Assets.images.micbtshhet.path , height: 35,),
                           SizedBox(width: 10,),
                           Text("مدیریت پادکست ها")
                         ],
                       ),
                     ),
                   )
               ],
             ),
           )
         ],
       ),
     ),
     height: Get.height / 2.8 ,
     decoration: BoxDecoration(
       color: Colors.white,
       borderRadius: BorderRadius.only(topRight: Radius.circular(15) , topLeft: Radius.circular(15)),
     ),
   )
 );
  }

  }



