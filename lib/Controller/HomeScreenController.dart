import 'package:get/get.dart';
import 'package:techblog/Const/api_Constant.dart';
import 'package:techblog/Models/Article_Model.dart';
import 'package:techblog/Models/Podcast_Model.dart';
import 'package:techblog/Models/Tags_model.dart';
import 'package:techblog/Services/DioService.dart';
import '../Models/PosterModel.dart';

class HomeScreenController extends GetxController {
  
  Rx<PosterModel> poster = PosterModel().obs;
  RxList<TagsModel> tagsList = RxList();
  RxList<ArticleModel> topVisitedList = RxList();
  RxList<PodcastModel> topPodcastList = RxList();

  RxBool loading = false.obs;


  onInit(){
    super.onInit();
    getHomeItems();
  }

  getHomeItems() async {

    loading.value = true;

    var response = await DioService().getmeth(ApiURLConstant.GetHomeItems);

    if (response.statusCode == 200) {

      response.data['top_visited'].forEach((element) {
        topVisitedList.add(ArticleModel.fromJson(element));
      });

      response.data['top_podcasts'].forEach((element){
        topPodcastList.add(PodcastModel.fromJson(element));
      });

      response.data['tags'].forEach((element){
        tagsList.add(TagsModel.fromJson(element));
      });

      
      poster.value = PosterModel.fromJson(response.data['poster']);

      loading.value = false;
    }
  }
}
