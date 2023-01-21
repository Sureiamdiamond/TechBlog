



   import 'package:techblog/Const/api_Constant.dart';

class PosterModel{

   String? id;
   String? title;
   String? image;

   PosterModel({

      this.id,
      this.title,
      this.image,
   });

   PosterModel.fromJson(Map<String , dynamic> elementt){

       id = elementt["id"];
       title = elementt["title"];
       image = ApiURLConstant.hostdlUrl + elementt["image"];
   }
   }
