
  class ApiURLConstant {

  static const hostdlUrl = "https://techblog.sasansafari.com";
  static const baseUrl = "https://techblog.sasansafari.com/Techblog/api/";
  static const GetHomeItems = baseUrl + "home/?command=index";
  static const GetArticleList = baseUrl + "article/get.php?command=new&user_id=1";
  static const publishedByMe = baseUrl + "article/get.php?command=published_by_me&user_id=";
  static const PostRegister = baseUrl + "register/action.php";
  static const ArticlePost = baseUrl + "article/post.php";
  static const podCastFiles = baseUrl + "podcast/get.php?command=get_files&podcats_id=";


  }

  class ApiArticleKeyConstant {

  static const title = "title";
  static const content = "content";
  static const catId = "cat_id";
  static const tag_list = "tag_list";
  static const userId = "user_id";
  static const image = "image";
  static const command = "command";




  }