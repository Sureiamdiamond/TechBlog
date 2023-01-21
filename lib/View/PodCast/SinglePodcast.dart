

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:techblog/Components/Decorations.dart';
import 'package:techblog/Components/Dimens.dart';
import 'package:techblog/Components/MyComponents.dart';
import 'package:techblog/Const/Colors.dart';
import 'package:techblog/Controller/PodCasts/SinglePodCastController.dart';
import 'package:techblog/gen/assets.gen.dart';

import '../../Models/Podcast_Model.dart';


class SinglePodcast extends StatelessWidget {

  late SinglePodCastController singlePodCastController;
  late PodcastModel podcastModel;

  SinglePodcast(){
    podcastModel = Get.arguments;
    singlePodCastController = Get.put(SinglePodCastController(id:podcastModel.id));
  }

  @override
  Widget build(BuildContext context) {

    print(singlePodCastController.id);
    var txttheme = Theme.of(context).textTheme;


    return  SafeArea(
      child: Scaffold(
        body : Stack(
          children: [
            Positioned(
              top: 0,
                right: 0,
                left: 0,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      //cover and appbar buttom
                      Stack(
                        children: [
                          SizedBox(
                            child: CachedNetworkImage(
                              imageUrl: podcastModel.poster!,
                              imageBuilder: (context, imageProvider) => Image(image: imageProvider , fit: BoxFit.fill), /// ///
                              placeholder: (context, url) => MyLoadingSpinkit(),
                              errorWidget: (context, url, error) =>  Image.asset(Assets.images.singlePlaceHolder.path),
                            ),
                            height: Get.height/3,
                            width: double.infinity,
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
                                    Icon(Icons.share, color: Colors.white,),
                                    SizedBox(width: 10),
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
                        padding: const EdgeInsets.only(right: 11.1, top: 11 , bottom: 5) ,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(podcastModel.title!,
                            maxLines: 2,
                            style: TextStyle(fontSize: 18 , fontWeight: FontWeight.w900 , color: Color(
                                0xd8121212)) ,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 9.0 , top: 9),
                        child: Row(
                            children: [
                              Image(
                                image: Image.asset(Assets.images.profileAvatar.path).image,
                                height: 33,),
                              SizedBox(width: 11,),
                              Text(podcastModel.publisher!, style: txttheme.headline4),
                            ]),
                      ),

                      //FileList
                      Obx(
                          ()=>
                              Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: singlePodCastController.podCastfileList.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.1),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        ImageIcon(Image.asset(Assets.icons.micIcon.path).image , color: SolidColors.seeMore,),
                                        SizedBox(width: 8),
                                        SizedBox(

                                            child:Text(
                                                singlePodCastController.podCastfileList[index].title!
                                                , style: txttheme.headline4),
                                          width: Get.width / 1.7,
                                        )
                                      ],
                                    ),
                                    Text(singlePodCastController.podCastfileList[index].lenght! + " دقیقه")
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
            ),
            Positioned(
              bottom: 15,
                right: Dimens.bodymargin,
                left:Dimens.bodymargin ,
                child: Container(
                  height: Get.height / 7,
                  decoration: myDecoration.mainGradiant,

                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        LinearPercentIndicator(

                          percent: 1.0,
                          backgroundColor: Colors.white,
                          progressColor: Colors.orange,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(Icons.skip_next , color: Colors.white,),
                            Icon(Icons.play_circle_fill_rounded , color: Colors.white, size: 55,),
                            Icon(Icons.skip_previous , color: Colors.white,),
                            SizedBox(),
                            Icon(Icons.repeat  , color: Colors.white,),
                          ],
                        )
                      ],
                    ),
                  ) ,
                )
            )
          ],
        )
      ),
    );
  }
}
