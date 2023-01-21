
  import 'package:get/get.dart';
import 'package:techblog/Const/api_Constant.dart';
import 'package:techblog/Models/PodCastFileModel.dart';
import 'package:techblog/Services/DioService.dart';

class SinglePodCastController extends GetxController{

  var id;

  SinglePodCastController({this.id});

  RxBool Loading = false.obs;

  Rx<PodCastFileModel> podcastFileModel = PodCastFileModel().obs;

  RxList<PodCastFileModel> podCastfileList = RxList();

  @override
  onInit(){
    super.onInit();
    getPodCastFiles(); //ListFile Haro besaze

  }



  getPodCastFiles() async {
    Loading.value = true;

    var response = await DioService().getmeth(ApiURLConstant.podCastFiles+id);
    if(response.statusCode ==200){
      for (var element in response.data["files"]){
        podCastfileList.add(PodCastFileModel.fromJson(element));
      }
      Loading.value = false;
    }

  }

}