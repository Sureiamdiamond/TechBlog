import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:techblog/Components/Dimens.dart';
import 'package:techblog/Const/Colors.dart';
import 'package:techblog/Components/MyComponents.dart';
import 'package:techblog/Controller/Article/ManageArticleController.dart';
import 'package:techblog/Controller/FileController.dart';
import 'package:techblog/Controller/HomeScreenController.dart';
import 'package:techblog/Services/PickFile.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'Article_Content_Editor.dart';


// ignore: must_be_immutable
class SingleManageArticleScreen extends StatelessWidget {
  var manageArticleController = Get.find<ManageArticleController>();


  getTitle(){
    Get.defaultDialog(
      title: " عنوان مقاله",
      content: TextField(

        controller: manageArticleController.titleTextEditingController,
        keyboardType: TextInputType.text,
        style: TextStyle(
        color: SolidColors.colorTitle),
        decoration: InputDecoration(
          hintText: "اینجا بنویس ...",
        ),
      ),
      backgroundColor: SolidColors.primaryColor,
      radius: 8 ,
      titleStyle: TextStyle(
       color: SolidColors.scaffoldBg),
      confirm: ElevatedButton (
       onPressed: (){

         manageArticleController.updateTitle();
        Get.back();

         },
          style:ButtonStyle(

              backgroundColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.pressed)) {
                   return Color(0xea8d5623);
                  }
                  return Color(0xeaf49642);
                    }),

             fixedSize: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.pressed)) {
                  return Size(Get.width / 2.55, Get.height/23.5);
                }
                return Size(Get.width / 2.46, Get.height/23.2);
              }),

          ),
          child: Text("ثبت" ))
    );
  }

  @override
  Widget build(BuildContext context) {
    var txttheme = Theme.of(context).textTheme;

    FilePickerController filePickerController = Get.put(FilePickerController());

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Obx(
            () => Column(
              children: [
                //cover and appbar buttom
                Stack(
                  children: [

                    SizedBox(
                      width: Get.width,
                      height: Get.height/3,
                      child: filePickerController.file.value.name=='Nothing'
                          ?
                      CachedNetworkImage(
                        imageUrl:
                        manageArticleController.articleInfoModel.value.image!,
                        imageBuilder: (context, imageProvider) =>
                            Image(image: imageProvider),
                        placeholder: (context, url) => MyLoadingSpinkit(),
                        errorWidget: (context, url, error) =>
                            Image.asset(Assets.images.singlePlaceHolder.path, fit: BoxFit.cover,),
                      )
                          :
                      Image.file(
                        File(filePickerController.file.value.path!),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(width: 10),
                              GestureDetector(
                                  onTap: () => Get.back(),
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                  )),
                              Expanded(
                                child: SizedBox(),
                              ),
                            ],
                          ),
                          height: 60,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors:
                                      GradiantColors.SingleManageScreenAppbar)),
                        )),
                    Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: GestureDetector(
                            onTap: (){
                              pickFile();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: SolidColors.primaryColor,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(9),
                                      topRight: Radius.circular(9))),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "انتخاب تصویر",
                                    style: txttheme.headline2,
                                  ),
                                  Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 20.5,
                                  )
                                ],
                              ),
                              height: 32,
                              width: Get.width / 3.10,
                            ),
                          ),
                        ))
                  ],
                ),
                SizedBox(height: 22),

                Padding(
                  padding:  EdgeInsets.only(right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: Get.width / 2.12,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Color(0xd7653dcb),
                            shadowColor:  Color(0xff1b2f5f),
                              elevation: 0.3,
                              backgroundColor: Color(0xf5ffffff)
                          ),
                          onPressed: (){
                            getTitle();
                          },
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
                                'ویرایش عنوان مقاله'
                                ,
                                style: txttheme.headline3,
                              )
                            ],
                          ),

                          // child: HomePage_BlogBlueTitle(
                          //   bodymargin: Dimens.HalfBodyMargin, txttheme: txttheme, title: 'ویرایش عنوان مقاله',),

                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding:  EdgeInsets.fromLTRB(Dimens.HalfBodyMargin, 1, Dimens.HalfBodyMargin,15),
                  child: Text(
                    manageArticleController.articleInfoModel.value.title!,
                    maxLines: 2,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        color: Color(0xd8121212)),
                  ),
                ),
                // GestureDetector(
                //   onTap: ()=> Get.to(()=>ArticleContentEditor()),
                //   child: HomePage_BlogBlueTitle(
                //     bodymargin: Dimens.HalfBodyMargin, txttheme: txttheme, title: 'ویرایش متن اصلی مقاله',),
                // ),
                Padding(
                  padding:  EdgeInsets.only(right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: Get.width / 1.95,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Color(0xd7653dcb),
                            shadowColor:  Color(0xff1b2f5f),
                            animationDuration: Duration(milliseconds: 1500),
                            elevation: 0.31,
                            backgroundColor: Color(0xf5ffffff)

                          ),
                          onPressed: (){
                            Get.to(()=>ArticleContentEditor());
                          },
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
                                'ویرایش متن اصلی مقاله'
                                ,
                                style: txttheme.headline3,
                              )
                            ],
                          ),

                          // child: HomePage_BlogBlueTitle(
                          //   bodymargin: Dimens.HalfBodyMargin, txttheme: txttheme, title: 'ویرایش عنوان مقاله',),

                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.fromLTRB(Dimens.HalfBodyMargin, 1, Dimens.HalfBodyMargin,15),
                  child: HtmlWidget(
                    manageArticleController.articleInfoModel.value.content!,
                    textStyle: txttheme.caption,
                    enableCaching: true,
                    onLoadingBuilder: (context, element, loadingProgress) =>
                        MyLoadingSpinkit(),
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                // GestureDetector(
                //   onTap: (){
                //     chooseCatsBottomSheet(txttheme);
                //   },
                //   child: HomePage_BlogBlueTitle(
                //     bodymargin: Dimens.HalfBodyMargin, txttheme: txttheme, title: 'انتخاب دسته بندی',),
                // ),
                Padding(
                  padding:  EdgeInsets.only(right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: Get.width / 2.12,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Color(0xd7653dcb),
                            shadowColor:  Color(0xff1b2f5f),
                            animationDuration: Duration(milliseconds: 1400),
                              elevation: 0.3,
                              backgroundColor: Color(0xf5ffffff)

                          ),
                          onPressed: (){
                            chooseCatsBottomSheet(txttheme);
                          },
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
                                'انتخاب دسته بندی'
                                ,
                                style: txttheme.headline3,
                              )
                            ],
                          ),

                          // child: HomePage_BlogBlueTitle(
                          //   bodymargin: Dimens.HalfBodyMargin, txttheme: txttheme, title: 'ویرایش عنوان مقاله',),

                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Padding(
                  padding:  EdgeInsets.fromLTRB(Dimens.HalfBodyMargin, 1, 23 ,0),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          manageArticleController.articleInfoModel.value.catName==null
                              ?
                          "هیچ دسته بندی ای انتخاب نشد! "
                              :
                        "# " + manageArticleController.articleInfoModel.value.catName! ,

                          maxLines: 2,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff1b1031)),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 63.0),
                  child: ElevatedButton(
                      onPressed: () async => await manageArticleController.storeArticle(),
                      child: Text(
                        manageArticleController.Loading.value
                            ?
                            "لطفا صبر کنید"
                            :
                          "ارسال مطلب"
                      )
                  ),
                ),
                SizedBox(height: 12)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget cats(txttheme) {

    var homeScreenController = Get.find<HomeScreenController>();

    return SizedBox(
      height: Get.height/1.75,
      child: Padding(
        padding: const EdgeInsets.only(left: 5.0 , right: 11),
        child: GridView.builder(
           gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
               crossAxisCount: 3 , ///TEDAD SOTON
               crossAxisSpacing: 5 , /// FAZAYE OFOGHI
                mainAxisSpacing: 5 /// FAZAYE AMOODI
           ),
            scrollDirection: Axis.vertical,
            itemCount: homeScreenController.tagsList.length,
            itemBuilder: ((context, index) {
              return GestureDetector(

                onTap: () async {
                  manageArticleController.articleInfoModel.update((val) {
                    val?.catName = homeScreenController.tagsList[index].title!;
                    val?.catId = homeScreenController.tagsList[index].id!;
                  });
                  Get.back();
                },

                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Container(
                    height: 55,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(24)),
                        color: SolidColors.primaryColor),
                    child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                        child: Center(
                          child: Text(
                            homeScreenController.tagsList[index].title!,
                            style: txttheme.headline2,
                          ),
                        )),
                  ),
                ),
              );
            })),
      ),
    );
  }

  chooseCatsBottomSheet(TextTheme textTheme){

    Get.bottomSheet(
      Container(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text("انتخاب دسته ‌بندی"),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8),
                child: cats(textTheme),
              )
            ],
          ),
        ),
        height: Get.height/1.5,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only( topLeft:Radius.circular(15)  , topRight: Radius.circular(15))
        ),
      ),
      isScrollControlled: true,
      persistent: true
    );
  }

}
