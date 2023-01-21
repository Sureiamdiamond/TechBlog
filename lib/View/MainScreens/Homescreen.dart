import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techblog/Controller/HomeScreenController.dart';
import 'package:techblog/Controller/Article/ListArtcileController.dart';
import 'package:techblog/Controller/Article/SingleArticleController.dart';
import 'package:techblog/View/Article/ArticleListScreen.dart';
import 'package:techblog/main.dart';
import '../../Const/Colors.dart';
import '../../Models/FakeData.dart';
import '../../Components/MyComponents.dart';
import '../../Const/Strings.dart';
import '../../gen/assets.gen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    Key? key,
    required this.size,
    required this.txttheme,
    required double bodymargin,
  })  : _bodymargin = bodymargin,
        super(key: key);

  HomeScreenController homeScreenController = Get.put(HomeScreenController());
  SingleArticleController singleArticleController =
      Get.put(SingleArticleController());
  ListArcticleController listArcticleController =
      Get.put(ListArcticleController());

  final Size size;
  final TextTheme txttheme;
  final double _bodymargin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Obx(
        () => Padding(
            padding: const EdgeInsets.fromLTRB(0, 13, 0, 0),
            child: homeScreenController.loading.value == false
                ? Column(
                    children: [
                      Poster(),

                      SizedBox(height: 15),

                      TagList(),

                      SizedBox(
                        height: 30,
                      ),

                      //HotestMaghale
                      GestureDetector(
                          onTap: () {
                            String tagName = "مقالات جدید";
                            Get.to(ArticleListScreen(title: tagName));
                          },
                          child: HomePage_BlogBlueTitle(
                              bodymargin: _bodymargin, txttheme: txttheme, title: 'مشاهده ی داغ ترین نوشته ها',)),

                      TopVisited(),

                      SizedBox(height: 10),

                      HomePage_PodCastBlueTitle(
                          bodymargin: _bodymargin, txttheme: txttheme),

                      TopPodcats(),

                      //Faseleh batraye ghati nashodan ba buttomnav
                      SizedBox(
                        height: size.height / 11,
                      )
                    ],
                  )
                : SizedBox(
                    height: Get.height / 1.8, child: MyLoadingSpinkit())),
      ),
    );
  }

  Widget TopVisited() {
    return SizedBox(
      height: size.height / 3.5,
      child: Obx(
        () => ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: homeScreenController.topVisitedList.length,
          itemBuilder: (context, index) {
            ///blog item
            return GestureDetector(
              onTap: () {
                singleArticleController.getArticleInfo(
                    homeScreenController.topVisitedList[index].id);
              },
              child: Padding(
                padding: EdgeInsets.only(right: index == 0 ? _bodymargin : 15),
                child: Column(
                  children: [
                    ///pictures
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: SizedBox(
                        height: size.height / 5.5,
                        width: size.width / 2.4,
                        child: CachedNetworkImage(
                          imageUrl:
                              homeScreenController.topVisitedList[index].image!,
                          imageBuilder: (context, imageProvider) {
                            return Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16)),
                                  image: DecorationImage(
                                      image: imageProvider, fit: BoxFit.cover)),
                            );
                          },
                          placeholder: (context, url) => MyLoadingSpinkit(),
                          errorWidget: (context, url, error) => Icon(
                            Icons.image_not_supported_outlined,
                            color: Colors.grey,
                            size: 32,
                          ),
                        ),
                      ),
                    ),

                    ///title zir
                    SizedBox(
                        width: size.width / 2.4,
                        child: Text(
                          homeScreenController.topVisitedList[index].title!,
                          //age gharare matne toolani bashe va overflow bokone to bia 3 ta noghte bezar
                          overflow: TextOverflow.ellipsis,
                          //hadeaxar tedad khotoot
                          maxLines: 2,
                        ))
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget TopPodcats() {
    return SizedBox(
      height: size.height / 3.2,
      child: Obx(
        () => ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: homeScreenController.topPodcastList.length,
          itemBuilder: (context, index) {
            ///blog item
            return GestureDetector(
              onTap: (){
                Get.toNamed( Namedroute.routeSinglePodcast , arguments:  homeScreenController.topPodcastList[index]);
              },
              child: Padding(
                padding: EdgeInsets.only(right: index == 0 ? _bodymargin : 10),
                child: Column(
                  children: [
                    ///pictures
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: SizedBox(
                          height: size.height / 4.6,
                          width: size.width / 1.8,
                          child: CachedNetworkImage(
                            imageUrl: homeScreenController
                                .topPodcastList[index].poster!,
                            imageBuilder: (context, imageProvider) {
                              return Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(14)),
                                    image: DecorationImage(
                                        image: imageProvider, fit: BoxFit.cover)),
                              );
                            },
                            placeholder: (context, url) => MyLoadingSpinkit(),
                            errorWidget: (context, url, error) => Icon(
                              Icons.image_not_supported_outlined,
                              size: 40,
                              color: Colors.grey,
                            ),
                          )),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                            width: size.width / 2.4,
                            child: Text(
                              homeScreenController.topPodcastList[index].title!,
                              //age gharare matne toolani bashe va overflow bokone to bia 3 ta noghte bezar
                              overflow: TextOverflow.ellipsis,
                              //hadeaxar tedad khotoot
                              maxLines: 2,
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget Poster() {
    return Stack(
      children: [
        ///cover poster and shadow
        Container(
          width: size.width / 1.20,
          height: size.height / 4.20,
          child: CachedNetworkImage(
            imageUrl: homeScreenController.poster.value.image!,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover)),
            ),
            placeholder: (context, url) => MyLoadingSpinkit(),
            errorWidget: (context, url, error) => Icon(
              Icons.image_not_supported_outlined,
              size: 45,
            ),
          ),

          /// shadow
          foregroundDecoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              gradient: LinearGradient(
                  colors: GradiantColors.HomePosterCoverGradiant,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
        ),

        ///text on cover pic
        Positioned(
          bottom: 8,
          left: 0,
          right: 7,
          child: Column(
            children: [
              Text(
                homeScreenController.poster.value.title!,
                style: txttheme.headline1,
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget TagList() {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tagList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () async {
              String tagName = homeScreenController.tagsList[index].title!;
              var tagId = homeScreenController.tagsList[index].id!;
              await Get.find<ListArcticleController>()
                  .getArticleListWithTagsId(tagId.toString());
              Get.to(ArticleListScreen(title: tagName));
            },
            child: Padding(
              padding:
                  EdgeInsets.fromLTRB(0, 8, index == 0 ? _bodymargin : 15, 8),
              child: MainTags(
                txttheme: txttheme,
                index: index,
              ),
            ),
          );
        },
      ),
    );
  }
}

class HomePage_PodCastBlueTitle extends StatelessWidget {
  const HomePage_PodCastBlueTitle({
    Key? key,
    required double bodymargin,
    required this.txttheme,
  })  : _bodymargin = bodymargin,
        super(key: key);

  final double _bodymargin;
  final TextTheme txttheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: _bodymargin, bottom: 8),
      child: Row(
        children: [
          ImageIcon(
            Image.asset(Assets.icons.micIcon.path).image,
            color: SolidColors.seeMore,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            MyStrings.viewHotestPodCasts,
            style: txttheme.headline3,
          )
        ],
      ),
    );
  }
}


