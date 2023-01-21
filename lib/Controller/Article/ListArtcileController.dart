import 'package:get/get.dart';
import 'package:techblog/Const/api_Constant.dart';
import 'package:techblog/Models/Article_Model.dart';
import 'package:techblog/Services/DioService.dart';

class ListArcticleController extends GetxController {
  RxList<ArticleModel> articleList = RxList();
  RxBool loading = false.obs;

  @override
  onInit() {
    super.onInit();
    getList();
  }

  getList() async {
    loading.value = true;
    var response = await DioService().getmeth(ApiURLConstant.GetArticleList);

    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticleModel.fromJson(element));
      });

      loading.value = false;
    }
  }

  getArticleListWithTagsId(String id) async {
    articleList.clear();
    loading.value = true;
    var response = await DioService().getmeth(ApiURLConstant.baseUrl +
        'article/get.php?command=get_articles_with_tag_id&tag_id=$id&user_id=');

    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticleModel.fromJson(element));
      });

      loading.value = false;
    }
  }
}