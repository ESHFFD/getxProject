class ApiConstant {
  static const baseUrl = 'https://techblog.sasansafari.com/Techblog/api';
  static const uploadImageHome = 'https://techblog.sasansafari.com';
  static const getHomePageData = '$baseUrl/home/?command=index';

  static const getArticelWithId =
      '$baseUrl/article/get.php?command=get_articles_with_tag_id&tag_id=1&user_id=';
  static const articelList = '$baseUrl/article/get.php?command=new&user_id=';
  static const articelInfo =
      '$baseUrl/article/get.php?command=info&id=16&user_id=';
  static const postRegister = '$baseUrl/register/action.php';
}
