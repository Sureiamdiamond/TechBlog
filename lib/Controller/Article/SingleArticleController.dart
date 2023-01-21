
  import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:techblog/Const/api_Constant.dart';
import 'package:techblog/Models/ArticleInfoModel.dart';
import 'package:techblog/Models/Article_Model.dart';
import 'package:techblog/Models/Tags_model.dart';
import 'package:techblog/Services/DioService.dart';
import 'package:techblog/View/Article/SingleScreen.dart';


  class SingleArticleController extends GetxController{
    RxBool loading = false.obs;
    RxInt id = RxInt(0);
    Rx<ArticleInfoModel> articleInfoModel = ArticleInfoModel(null , null ,null).obs;
    RxList<TagsModel> tagList = RxList();
    RxList<ArticleModel> releatedList = RxList();


  getArticleInfo(var id) async{
    articleInfoModel = ArticleInfoModel(null , null ,null).obs;
      loading.value = true;
      var userId = '';
    debugPrint(ApiURLConstant.baseUrl +
          'article/get.php?command=info&id=$id&user_id=$userId');

      var respon3 =  await DioService().getmeth(ApiURLConstant.baseUrl + 'article/get.php?command=info&id=$id&user_id=$userId');

      if(respon3.statusCode == 200) {
        articleInfoModel.value = ArticleInfoModel.fromJson(respon3.data);

        loading.value = false;

        tagList.clear();
        respon3.data['tags'].forEach((element) {
          tagList.add(TagsModel.fromJson(element));
        });

        releatedList.clear();
        respon3.data['related'].forEach((element) {
          releatedList.add(ArticleModel.fromJson(element));
        });
         Get.to(SingleScreen());
      }

      }
  }

