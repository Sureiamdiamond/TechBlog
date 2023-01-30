
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
late var playList;

RxBool playState = false.obs;

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

}