
import 'package:techblog/Const/api_Constant.dart';

class ArticleModel {

   String? id;
   String? title;
   String? image;
   String? cat_id;
   String? cat_name;
   String? author;
   String? view;
   String? status;
   // String? isFavorite;
   String? created_at;


    ArticleModel({

        this.id,
        this.title,
        this.image,
        this.cat_id,
        this.cat_name,
        this.author,
        this.view,
        this.status,
       // required this.isFavorite,
        this.created_at,

    });

    ArticleModel.fromJson(Map < String , dynamic > elementt) {

         id = elementt["id"] ;
        title = elementt["title"];
        image = ApiURLConstant.hostdlUrl + elementt["image"];
        cat_id = elementt["cat_id"];
        cat_name = elementt["cat_name"];
        author = elementt["author"];
        view = elementt["view"];
        status = elementt["status"];
        created_at = elementt["created_at"];
    }

}




