
import 'package:flutter/material.dart';
import '../Components/Colors.dart';
import '../Models/FakeData.dart';
import '../Components/MyComponents.dart';
import '../Components/Strings.dart';
import '../gen/assets.gen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
    required this.size,
    required this.txttheme,
    required double bodymargin,
  }) : _bodymargin = bodymargin, super(key: key);

  final Size size;
  final TextTheme txttheme;
  final double _bodymargin;

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 13, 0, 0),

        child: Column(
          children: [
            HomePage_POSTER(size: size, txttheme: txttheme),

            SizedBox(height: 15),

            HomePage_HASHTAGLISTVIEW(bodymargin: _bodymargin, txttheme: txttheme),

            SizedBox(
              height: 30,
            ),

            HomePage_BlogBlueTitle(bodymargin: _bodymargin, txttheme: txttheme),

            HomePage_HottestBlogListView(size: size, bodymargin: _bodymargin, txttheme: txttheme),

            SizedBox(height: 10),

            HomePage_PodCastBlueTitle(bodymargin: _bodymargin, txttheme: txttheme),

            HomePage_HottestPodCastListView(size: size, bodymargin: _bodymargin, txttheme: txttheme),

            //Faseleh batraye ghati nashodan ba buttomnav
            SizedBox(height: size.height/11,)

          ],
        ),
      ),
    );
  }
}

class HomePage_HottestPodCastListView extends StatelessWidget {
  const HomePage_HottestPodCastListView({
    Key? key,
    required this.size,
    required double bodymargin,
    required this.txttheme,
  }) : _bodymargin = bodymargin, super(key: key);

  final Size size;
  final double _bodymargin;
  final TextTheme txttheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
    );
  }
}

class HomePage_PodCastBlueTitle extends StatelessWidget {
  const HomePage_PodCastBlueTitle({
    Key? key,
    required double bodymargin,
    required this.txttheme,
  }) : _bodymargin = bodymargin, super(key: key);

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

class HomePage_HottestBlogListView extends StatelessWidget {
  const HomePage_HottestBlogListView({
    Key? key,
    required this.size,
    required double bodymargin,
    required this.txttheme,
  }) : _bodymargin = bodymargin, super(key: key);

  final Size size;
  final double _bodymargin;
  final TextTheme txttheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
    );
  }
}

class HomePage_BlogBlueTitle extends StatelessWidget {
  const HomePage_BlogBlueTitle({
    Key? key,
    required double bodymargin,
    required this.txttheme,
  }) : _bodymargin = bodymargin, super(key: key);

  final double _bodymargin;
  final TextTheme txttheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}

class HomePage_HASHTAGLISTVIEW extends StatelessWidget {
  const HomePage_HASHTAGLISTVIEW({
    Key? key,
    required double bodymargin,
    required this.txttheme,
  }) : _bodymargin = bodymargin, super(key: key);

  final double _bodymargin;
  final TextTheme txttheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tagList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.fromLTRB(
                0, 8, index == 0 ? _bodymargin : 15, 8),
            child: MainTags(txttheme: txttheme, index: index,),
          );
        },
      ),
    );
  }
}



class HomePage_POSTER extends StatelessWidget {
  const HomePage_POSTER({
    Key? key,
    required this.size,
    required this.txttheme,
  }) : super(key: key);

  final Size size;
  final TextTheme txttheme;

  @override
  Widget build(BuildContext context) {
    return Stack(
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
    );
  }
}