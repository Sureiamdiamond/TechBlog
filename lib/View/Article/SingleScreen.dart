import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:techblog/Const/Colors.dart';
import 'package:techblog/Components/MyComponents.dart';
import 'package:techblog/Const/Strings.dart';
import 'package:techblog/Controller/Article/ListArtcileController.dart';
import 'package:techblog/Controller/Article/SingleArticleController.dart';
import 'package:techblog/View/Article/ArticleListScreen.dart';
import 'package:techblog/gen/assets.gen.dart';



class SingleScreen extends StatelessWidget {

    var singleArticleController = Get.find<SingleArticleController>();

    @override
   Widget build(BuildContext context) {

      var txttheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Obx(
            ()=> singleArticleController.articleInfoModel.value.title ==null
                ?
                SizedBox(
                  height: Get.height,
                    child: MyLoadingSpinkit())
                :
                Column(
              children: [
                //cover and appbar buttom
                Stack(
                  children: [
                    CachedNetworkImage(
                        imageUrl: singleArticleController.articleInfoModel.value.image! ,
                     imageBuilder: (context, imageProvider) => Image(image: imageProvider),
                      placeholder: (context, url) => MyLoadingSpinkit(),
                      errorWidget: (context, url, error) =>  Image.asset(Assets.images.singlePlaceHolder.path),
                    ),
                    Positioned(
                      top: 0, left: 0,right: 0,
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(width: 10),
                              GestureDetector(
                                onTap: (){Get.back();},
                                  child: Icon(Icons.arrow_back, color: Colors.white,)),
                              Expanded(child: SizedBox(),),
                              Icon(Icons.bookmark_border_rounded, color: Colors.white,),
                              SizedBox(width: 10),
                              IconButton(
                                  onPressed: () async {
                                   await Share.share(MyStrings.shareText);
                                   },
                                  icon: Icon(Icons.share, color: Colors.white),),
                              SizedBox(width: 12,)
                            ],
                          ),
                          height: 60,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: GradiantColors.SingleScreenAppbar
                            )
                          ),
                        )
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(singleArticleController.articleInfoModel.value.title!,
                  maxLines: 2,
                    style: TextStyle(fontSize: 18 , fontWeight: FontWeight.w900 , color: Color(
                        0xd8121212)) ,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Image(
                        image: Image.asset(Assets.images.profileAvatar.path).image,
                      height: 33,),
                      SizedBox(width: 11,),
                      Text(singleArticleController.articleInfoModel.value.author!, style: txttheme.headline4),
                      SizedBox(width: 25,),
                      Text(singleArticleController.articleInfoModel.value.createdAt!  , style: txttheme.caption)

                    ]),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: HtmlWidget(
                    singleArticleController.articleInfoModel.value.content!,
                    textStyle: txttheme.caption,
                    enableCaching: true,
                    onLoadingBuilder: (context, element, loadingProgress) => MyLoadingSpinkit(),
                  ),
                ),
                SizedBox(
                  height: 10,),
                tags(txttheme),
                SizedBox(
                  height: 30,),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8,8,8,8),
                      child: Image(image:Image.asset(Assets.icons.pencilIcon.path).image, height: 20, ),
                    ),
                    Text("مقالات مرتبت" , style: txttheme.headline3,),
                  ],
                ),
                SizedBox(
                  height: 5),
                Related(txttheme),

              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget tags(txttheme){
      return SizedBox(
        height: 36,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: singleArticleController.tagList.length,
            itemBuilder: ((context, index) {
              return GestureDetector(
                onTap: () async {
                  String tagName = singleArticleController.tagList[index].title!;
                  var tagId = singleArticleController.tagList[index].id!;
                  await Get.find<ListArcticleController>().getArticleListWithTagsId(tagId.toString());
                  Get.to(ArticleListScreen(title : tagName));
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Container(
                    height: 55,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(24)),
                        color: Colors.grey),
                    child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                        child: Text(
                          singleArticleController.tagList[index].title!,
                          style: txttheme.headline2,
                        )),
                  ),
                ),
              );
            })),
      );
  }

    Widget Related(txttheme) {
      return SizedBox(
        height: Get.height / 3.5,
        child: ListView.builder(
            itemCount: singleArticleController.releatedList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: ((context, index) {
              //blog item
              return GestureDetector(
                onTap: (() {
                  singleArticleController.getArticleInfo(singleArticleController.releatedList[index].id);
                }),
                child: Padding(
                  padding:
                  EdgeInsets.only(right: index == 0 ? Get.width / 15 : 15),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: Get.height / 5.3,
                          width: Get.width / 2.4,
                          child: Stack(
                            children: [
                              CachedNetworkImage(
                                imageUrl: singleArticleController
                                    .releatedList[index].image!,
                                imageBuilder: ((context, imageProvider) =>
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(16)),
                                        image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover),
                                      ),
                                      foregroundDecoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(16)),
                                          gradient: LinearGradient(
                                              begin: Alignment.bottomCenter,
                                              end: Alignment.topCenter,
                                              colors: GradiantColors.blogPost)),
                                    )),
                                placeholder: ((context, url) => const MyLoadingSpinkit()),
                                errorWidget: ((context, url, error) => const Icon(
                                  Icons.image_not_supported_outlined,
                                  size: 50,
                                  color: Colors.grey,
                                )),
                              ),
                              Positioned(
                                bottom: 8,
                                left: 0,
                                right: 0,
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      singleArticleController
                                          .releatedList[index].author!,
                                      style: txttheme.subtitle1,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          singleArticleController
                                              .releatedList[index].view!,
                                          style: txttheme.subtitle1,
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        const Icon(
                                          Icons.remove_red_eye_sharp,
                                          color: Colors.white,
                                          size: 16,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                          width: Get.width / 2.4,
                          child: Text(
                            singleArticleController.releatedList[index].title!,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ))
                    ],
                  ),
                ),
              );
            })),
      );
    }
}