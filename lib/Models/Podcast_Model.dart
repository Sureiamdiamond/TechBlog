

 import 'package:techblog/Const/api_Constant.dart';

class PodcastModel {
   String? id;
   String? title;
   String? poster;
   String? publisher;
   String? view;
   String? created_at;


   PodcastModel({
     required this.id,
     required this.title,
     required this.poster,
     required this.publisher,
     required this.view,
     required this.created_at,

   });

   PodcastModel.fromJson( Map <String , dynamic> elementt){
      id = elementt ["id"];
       title = elementt ["title"];
       poster = ApiURLConstant.hostdlUrl + elementt ["poster"];
       publisher = elementt ["author"];
       view = elementt ["view"];
       created_at = elementt ["created_at"];

   }




 }


