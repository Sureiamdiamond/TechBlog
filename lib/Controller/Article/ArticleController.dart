
  import 'package:get/get.dart';
import 'package:techblog/Const/api_Constant.dart';
import 'package:techblog/Models/Article_Model.dart';
import 'package:techblog/Services/DioService.dart';
import 'package:techblog/View/Article/ArticleListScreen.dart';

  class ArticleController extends GetxController{

    RxList<ArticleModel> articleList = RxList();
    RxBool loading = false.obs;


    @override
  void onInit() {
    super.onInit();
    getListitems();
  }

  getListitems() async{
      loading.value = true;
      //TODO : get User id  from getStorage + ApiConstant.GetArticleList
      var respon3 =  await DioService().getmeth(ApiURLConstant.GetArticleList);

      if(respon3.statusCode == 200){
        respon3.data.forEach((element){
        articleList.add(ArticleModel.fromJson(element));
        });

        loading.value = false;
      }
  }

  }