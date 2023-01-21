
  import 'package:get/get.dart';
import 'package:techblog/Controller/Article/ListArtcileController.dart';
import 'package:techblog/Controller/Article/ManageArticleController.dart';
import 'package:techblog/Controller/RegisterController.dart';
import 'package:techblog/Controller/Article/SingleArticleController.dart';

class ArticleBinding implements Bindings {
  @override
  void dependencies() {

   Get.put(ListArcticleController());

   Get.lazyPut(() => SingleArticleController());

  }
}



class  ArticleManagerBinding implements Bindings {
  @override
  void dependencies() {

   Get.lazyPut(() => ManageArticleController());

  }
}



class RegisterBinding implements Bindings {
  @override
  void dependencies() {
   Get.put(RegisterController());

  }
}