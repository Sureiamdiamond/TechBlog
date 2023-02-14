

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
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

  late SinglePodCastController Controller;
  late PodcastModel podcastModel;

  SinglePodcast(){
    podcastModel = Get.arguments;
    Controller = Get.put(SinglePodCastController(id:podcastModel.id));
  }

  @override
  Widget build(BuildContext context) {

    print(Controller.id);
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
                            itemCount: Controller.podCastfileList.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: ()async{
                                  await Controller.player.seek(Duration.zero , index: index);
                                  Controller.currentPodIndex.value = Controller.player.currentIndex!;
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.1),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          ImageIcon(Image.asset(Assets.icons.micIcon.path).image , color: SolidColors.seeMore,),
                                          SizedBox(width: 8),
                                          SizedBox(

                                          child:Obx(
                                              ()=>
                                                Text(
                                                    Controller.podCastfileList[index].title!
                                                    , style:
                                                    Controller.currentPodIndex.value== index
                                                    ?
                                                txttheme.headline3
                                                    :
                                                txttheme.headline4
                                                ),
                                              ),
                                            width: Get.width / 1.7,
                                          )
                                        ],
                                      ),
                                      Text(Controller.podCastfileList[index].lenght! + " دقیقه")
                                    ],
                                  ),
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
                    padding: const EdgeInsets.all(11.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [

                        Obx(
                        ()=> ProgressBar(
                            thumbGlowRadius: 14,
                            thumbRadius: 9,
                            buffered: Controller.bufferedBarValue.value,
                            timeLabelTextStyle: TextStyle(color:Color(0xffd4d3d3) , fontSize: 13),
                            progressBarColor: Color(0xffcb6105),
                            thumbColor: Color(0xfff0b339),
                            baseBarColor: Color(0xffd4d3d3),
                            progress: Controller.progressBarValue.value,
                            total: Controller.player.duration??Duration(seconds: 0),

                            onSeek:(position) {
                              Controller.player.seek(position);

                              Controller.player.playing
                                  ?
                              Controller.startProgress()
                                  :
                              Controller.timer!.cancel();
                            },
                          ),
                        ),

                        Row(

                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [

                            //SEEK TO NEXT ICON
                            GestureDetector(
                              onTap: () async {
                                await Controller.player.seekToNext();
                                Controller.currentPodIndex.value = Controller.player.currentIndex!;
                                Controller.timerCheck();
                              },
                                child: Icon(Icons.skip_next , color: Colors.white,)),

                            //PLAY ICON
                            GestureDetector(
                              onTap: (){

                                Controller.player.playing
                                    ?
                                Controller.timer!.cancel()
                                    :
                                Controller.startProgress();



                                Controller.player.playing
                                    ?
                                Controller.player.pause()
                                    :
                                Controller.player.play();



                                Controller.playState.value = Controller.player.playing;
                                Controller.currentPodIndex.value = Controller.player.currentIndex!;

                              },
                                child: Obx(
                                  ()=> Icon(
                                    Controller.playState.value
                                        ?
                                    Icons.pause_circle_filled_rounded
                                        :
                                    Icons.play_circle_filled_rounded ,

                                    color: Colors.white, size: 55,),
                                )),

                            //SEEK PERV Icon
                            GestureDetector(
                              onTap: ()async{
                                await Controller.player.seekToPrevious();
                                Controller.currentPodIndex.value = Controller.player.currentIndex!;
                                Controller.timerCheck();
                              },
                                child: Icon(Icons.skip_previous , color: Colors.white,)),

                            SizedBox(),
                            Obx(
                              ()=> GestureDetector(
                                onTap: (){
                                  Controller.setLoopMode();
                                },
                                child: Icon(Icons.repeat,
                                  color: Controller.isLoopAll.value //age true bood abi kon
                                         ?
                                   Color(0xfff0b339)
                                         :
                                   Colors.white

                                ),
                              )
                            ),
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
