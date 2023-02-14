
  import 'dart:async';

import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:techblog/Const/api_Constant.dart';
import 'package:techblog/Models/PodCastFileModel.dart';
import 'package:techblog/Services/DioService.dart';

class SinglePodCastController extends GetxController{
  var id;
  SinglePodCastController({this.id});
  RxBool Loading = false.obs;
  RxList<PodCastFileModel> podCastfileList = RxList();

final player = AudioPlayer();
late ConcatenatingAudioSource playList;
RxBool playState = false.obs;
RxInt currentPodIndex = 0.obs;
RxBool isLoopAll = false.obs;


  @override
  onInit() async{
    super.onInit();

    //AudioPlayer
    playList = ConcatenatingAudioSource(
      useLazyPreparation: true,
        children: []
    );

    await getPodCastFiles();
    //ListFile Haro besaze

    await player.setAudioSource(
      playList , initialIndex:  0 , initialPosition:  Duration.zero
    );

  }


  getPodCastFiles() async {
    Loading.value = true;

    var response = await DioService().getmeth(ApiURLConstant.podCastFiles+id);
    if(response.statusCode ==200){
      for (var element in response.data["files"]){
        podCastfileList.add(PodCastFileModel.fromJson(element));
        playList.add(AudioSource.uri(Uri.parse(PodCastFileModel.fromJson(element).file!)));
      }
      Loading.value = false;
    }

  }

  // RxDouble progressValue = 0.0.obs;
  // startProgress(){
  //
  //   const tick = Duration(seconds: 1);
  //   int duration = player.duration!.inSeconds; //maslan age 3 min bashe mishe 3 x 60 = 180second
  //   var step = 1/duration; //1 ke max ast taghsim bar kol duration be saniye
  //
  //   timer = Timer.periodic(tick, (timer) {
  //     duration --;
  //     progressValue.value += step;
  //     if(duration<=0){
  //       timer.cancel();
  //     }
  //   });
  //
  // }

 Rx<Duration> progressBarValue = Duration(seconds: 0).obs;
 Rx<Duration> bufferedBarValue = Duration(seconds: 0).obs;
 Timer? timer;
 startProgress (){
   const tick = Duration(seconds: 1);
   int duration = player.duration!.inSeconds - player.position.inSeconds;

   if(timer!=null){
     if(timer!.isActive){
       timer!.cancel();
       timer = null;
     }
   }

   timer = Timer.periodic(tick, (timer) {
     duration--;
     progressBarValue.value = player.position;
     bufferedBarValue.value = player.bufferedPosition;

     if(duration<=0){
         timer.cancel();
         progressBarValue.value = Duration(seconds: 0);
         bufferedBarValue.value = Duration(seconds: 0);
     }

   });
 }


 setLoopMode(){

   if(isLoopAll.value){//age true bood

     isLoopAll.value = false;
     player.setLoopMode(LoopMode.off);

   } else {//age false bood

     isLoopAll.value = true;
     player.setLoopMode(LoopMode.all);
   }
 }

}




