import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:techblog/Components/MyComponents.dart';
import 'package:techblog/Const/Strings.dart';
import 'package:techblog/Controller/Article/ManageArticleController.dart';
import 'package:techblog/Controller/RegisterController.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/main.dart';
import 'package:validators/validators.dart';


// ignore: must_be_immutable
class ManageArticles extends StatelessWidget {
ManageArticles({super.key});

//binding ast
var articleManageController = Get.find<ManageArticleController>();

  @override
  Widget build(BuildContext context) {
    ///theme text
    var txttheme = Theme.of(context).textTheme;

    ///size app
     var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: MYAppbar("مدیریت مقاله ها"),
      body: Obx(
              ()=>articleManageController.Loading.value
                  ?
              MyLoadingSpinkit()
                  :
              articleManageController.articleList.isNotEmpty ? Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: articleManageController.articleList.length ,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () async {
                          //route to singlemanage

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
                              imageUrl: articleManageController.articleList[index].image!,
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
                                child: Text(articleManageController.articleList[index].title!,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,

                                ),
                              ),
                              SizedBox(height: 15),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(articleManageController.articleList[index].author!, style: txttheme.caption),
                                  SizedBox(width: 16),
                                  Text(articleManageController.articleList[index].view! + " بازدید" , style: txttheme.caption,)
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
          articleEmptystate(txttheme)
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(top: 1.0),
        child: Padding(
          padding: const EdgeInsets.fromLTRB( 18 , 8 , 18, 35),
          child: ElevatedButton(
            style:  ButtonStyle(
              fixedSize:  MaterialStateProperty.all(Size(Get.width / 3 , 50))
            ),
            onPressed: (() {
              Get.toNamed(Namedroute.routeSingleManageArticle);

            }),
            child: Text(
              "بریم برای نوشتن یه مقاله ی باحال!",
            ),
          ),
        ),
      ),
    );
  }

  Widget articleEmptystate(TextTheme txttheme) {
    return Center(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SvgPicture.asset(
        Assets.images.sadbot,
        height: 100,
      ),
      Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: MyStrings.ArticleEmpty, style: txttheme.headline4)),
      ),

    ],
  ),
    );
  }
}


