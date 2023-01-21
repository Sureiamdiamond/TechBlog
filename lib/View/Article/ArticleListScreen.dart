
  import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techblog/Components/MyComponents.dart';
import 'package:techblog/Controller/Article/ListArtcileController.dart';
import 'package:techblog/Controller/Article/SingleArticleController.dart';
import 'package:techblog/View/Article/SingleScreen.dart';
import 'package:techblog/binding.dart';
import 'package:techblog/main.dart';


// ignore: must_be_immutable
class ArticleListScreen extends StatelessWidget{
  ArticleListScreen({required this.title});
  late String title;

  ListArcticleController listArticleController = Get.put(ListArcticleController());
  SingleArticleController singleArticleController = Get.put(SingleArticleController());


  @override
  Widget build(BuildContext context) {
    var txttheme = Theme.of(context).textTheme;

    return SafeArea(
        child: Scaffold(
          appBar: MYAppbar(title),
          body: Obx(
            ()=> !singleArticleController.loading.value ? Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: listArticleController.articleList.length ,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () async {
                          await singleArticleController.getArticleInfo(listArticleController.articleList[index].id);
                          Get.toNamed(Namedroute.routeSingleArticle);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: Get.width/3,
                                height: Get.height/6,
                                child: CachedNetworkImage(
                                    imageUrl: listArticleController.articleList[index].image!,
                                  imageBuilder: (context, imageProvider) {
                                    return Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(15)),
                                        image: DecorationImage(image: imageProvider , fit: BoxFit.cover)
                                      ),
                                    );},
                                  placeholder: (context, url) => MyLoadingSpinkit(),
                                  errorWidget: (context, url, error) => Icon(Icons.image_not_supported_rounded , size: 44,color:Colors.grey,),
                                ),
                              ),
                              SizedBox(width: 13),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: Get.width / 1.87,
                                    child: Text(listArticleController.articleList[index].title!,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,

                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(listArticleController.articleList[index].author!, style: txttheme.caption),
                                      SizedBox(width: 16),
                                      Text(listArticleController.articleList[index].view! + " بازدید" , style: txttheme.caption,)
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                ),
              ),
            )
                :
                MyLoadingSpinkit()
          ),
        )
    );
  }
}

