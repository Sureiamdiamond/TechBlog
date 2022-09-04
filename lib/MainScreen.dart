import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:techblog/Colors.dart';
import 'package:techblog/Strings.dart';
import 'package:techblog/gen/assets.gen.dart';

import 'Models/FakeData.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ///theme text
    var txttheme = Theme.of(context).textTheme;

    ///size app
    var size = MediaQuery.of(context).size;

    ///fasleh az rast
    double _bodymargin = size.width / 12.5;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 13, 0, 0),
            child: Column(
              children: [
                ///appbar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.menu),
                    Image(
                      image: Image.asset(Assets.images.logo.path).image,
                      height: size.height / 13.6,
                    ),
                    Icon(CupertinoIcons.search)
                  ],
                ),

                SizedBox(height: 8),

                ///cover poster and shadow of it and text on cover pic
                Stack(
                  children: [
                    ///cover poster and shadow
                    Container(
                      width: size.width / 1.20,
                      height: size.height / 4.20,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          image: DecorationImage(
                              image: Image.asset(homePagePosterMap["imageAsset"])
                                  .image,
                              fit: BoxFit.cover)),

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
                      right: 0,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                homePagePosterMap["writer"] +
                                    " - " +
                                    homePagePosterMap["date"],
                                style: txttheme.subtitle1,
                              ),
                              Row(
                                children: [
                                  Text(
                                    homePagePosterMap["view"],
                                    style: txttheme.subtitle1,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Icon(
                                    Icons.remove_red_eye_sharp,
                                    color: Colors.white,
                                    size: 17.4,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Text(
                            "دوازده قدم برای برنامه نویسی یک دوره ی ... ",
                            style: txttheme.headline1,
                          )
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 15),

                ///Hashtags [listview]
                SizedBox(
                  height: 60,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: tagList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.fromLTRB(
                            0, 8, index == 0 ? _bodymargin : 15, 8),
                        child: Container(
                          //width nemidim ke motaghayer bana be text toosh begire
                          height: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(23)),
                              gradient: LinearGradient(
                                  colors: GradiantColors.tags,
                                  begin: Alignment.centerRight,
                                  end: Alignment.centerLeft)),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                            child: Row(
                              children: [
                                //image icon chon ham ax bashe ham khasiat icon
                                ImageIcon(
                                    Image.asset(Assets.icons.tag.path).image,
                                    color: Colors.white,
                                    size: 16),
                                SizedBox(width: 8),
                                Text(
                                  tagList[index].title,
                                  style: txttheme.headline2,
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                SizedBox(
                  height: 30,
                ),

                ///Hotest Blog title
                Padding(
                  padding: EdgeInsets.only(right: _bodymargin, bottom: 8),
                  child: Row(
                    children: [
                      ImageIcon(
                        Image.asset(Assets.icons.pencilIcon.path).image,
                        color: SolidColors.seeMore,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        MyStrings.viewHotestBlog,
                        style: txttheme.headline3,
                      )
                    ],
                  ),
                ),

                ///Hotest Blog listview
                SizedBox(
                  height: size.height / 3.5,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: blogList.getRange(0, 5).length,
                    itemBuilder: (context, index) {
                      ///blog item
                      return Padding(
                        padding: EdgeInsets.only(right :index == 0 ? _bodymargin : 15),
                        child: Column(
                          children: [
                            ///pictures
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: SizedBox(
                                height: size.height / 5.5,
                                width: size.width / 2.4,
                                child: Stack(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(15)),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                blogList[index].imageUrl),
                                            fit: BoxFit.cover),
                                      ),
                                      foregroundDecoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(15)),
                                        gradient: LinearGradient(
                                            colors: GradiantColors.blogPost,
                                            begin: Alignment.bottomCenter,
                                            end: Alignment.topCenter),
                                      ),
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
                                            blogList[index].writer,
                                            style: txttheme.subtitle1,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                blogList[index].views,
                                                style: txttheme.subtitle1,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Icon(
                                                Icons.remove_red_eye_sharp,
                                                color: Colors.white,
                                                size: 17.4,
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

                            ///title zir
                            SizedBox(
                                width: size.width / 2.4,
                                child: Text(
                                  blogList[index].title,
                                  //age gharare matne toolani bashe va overflow bokone to bia 3 ta noghte bezar
                                  overflow: TextOverflow.ellipsis,
                                  //hadeaxar tedad khotoot
                                  maxLines:2 ,
                                ))
                          ],
                        ),
                      );
                    },
                  ),
                ),

                SizedBox(height: 10),

                ///Hotest podcast title
                Padding(
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
                ),

                ///Hotest podcasts listview
                SizedBox(
                  height: size.height / 3.5,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: blogList.getRange(0, 3).length,
                    itemBuilder: (context, index) {
                      ///blog item
                      return Padding(
                        padding: EdgeInsets.only(right :index == 0 ? _bodymargin : 15),
                        child: Column(
                          children: [
                            ///pictures
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: SizedBox(
                                height: size.height / 4.5,
                                width: size.width / 1.6,
                                child: Stack(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                podcastlist[index].imageUrl),
                                            fit: BoxFit.cover),
                                      ),
                                      foregroundDecoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                        gradient: LinearGradient(
                                            colors: GradiantColors.podPost,
                                            begin: Alignment.bottomCenter,
                                            end: Alignment.topCenter),
                                      ),
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
                                            podcastlist[index].title,
                                            style: txttheme.subtitle1,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                podcastlist[index].views,
                                                style: txttheme.subtitle1,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Icon(
                                                Icons.play_arrow,
                                                color: Colors.white,
                                                size: 25.4,
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


                          ],
                        ),
                      );
                    },
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
