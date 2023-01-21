
  import 'dart:developer';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:techblog/Const/Command.dart';
import 'package:techblog/Const/Storage_const.dart';
import 'package:techblog/Const/api_Constant.dart';
import 'package:techblog/Controller/FileController.dart';
import 'package:techblog/Models/ArticleInfoModel.dart';
import 'package:techblog/Models/Article_Model.dart';
import 'package:techblog/Models/Tags_model.dart';
import 'package:techblog/Services/DioService.dart';


class ManageArticleController extends GetxController {

  RxList<ArticleModel> articleList = RxList.empty();
  RxList<TagsModel> tagList = RxList.empty();
  RxBool Loading = false.obs;
  TextEditingController titleTextEditingController = TextEditingController();
  Rx<ArticleInfoModel> articleInfoModel = ArticleInfoModel(
    'ابنجا عنوان مقاله قرار میگیره! پس یه عنوان جذاب انتخاب کن.',
     '''من متن و بدنه اصلی هستم. اگه می‌ خوای من رو ویرایش کنی و یه مقاله ی جذاب بنویسی. نوشته آبی رنگ بالا که نوشته ( ویرایش متن ) رو لمس کن تا وارد ویرایش گر بشی''',
    ''

  ).obs;

  @override
  onInit(){
    super.onInit();
    getManageArticle();
  }

  getManageArticle() async {

    Loading.value = true;

    // var response = await DioService().getmeth(ApiConstant.publishedByMe + GetStorage().read(Storagekey.userId));
    var response = await DioService().getmeth(ApiURLConstant.publishedByMe + "1");


    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticleModel.fromJson(element));
      });
      Loading.value = false;

    }

  }

  updateTitle(){

    articleInfoModel.update((val) {
      val!.title = titleTextEditingController.text;
    });

  }


  storeArticle() async {

    var fileController = Get.find<FilePickerController>();

    Loading.value = true;

    Map <String , dynamic> map = {
      ApiArticleKeyConstant.title : articleInfoModel.value.title,
      ApiArticleKeyConstant.content : articleInfoModel.value.content,
      ApiArticleKeyConstant.catId : articleInfoModel.value.catId,
      ApiArticleKeyConstant.userId : GetStorage().read(Storagekey.userId),
      ApiArticleKeyConstant.image : await dio.MultipartFile.fromFile(fileController.file.value.path!),
      ApiArticleKeyConstant.command :Commands.store,
      ApiArticleKeyConstant.tag_list :"[]",


    };

    var response = await DioService().postmeth(map, ApiURLConstant.ArticlePost);
    log(response.data.toString());
    Loading.value = false;



 }


}