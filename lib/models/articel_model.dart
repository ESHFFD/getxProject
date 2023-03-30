import 'package:blog_app/constant/api_constant.dart';

class ArticelModel {
  String? id;
  String? title;
  String? image;
  String? catId;
  String? catName;
  String? author;
  String? view;
  String? status;
  String? createdAt;
  ArticelModel({
    required this.id,
    required this.title,
    required this.image,
    required this.catId,
    required this.catName,
    required this.author,
    required this.view,
    required this.status,
    required this.createdAt,
  });

  ArticelModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = ApiConstant.uploadImageHome + json['image'];
    catId = json['cat_id'];
    catName = json['cat_name'];
    author = json['author'];
    view = json['view'];
    status = json['status'];
    createdAt = json['created_at'];
  }
}


//  "id": "1",
//             "title": "۵ بازی مشابه Assassin’s Creed Valhalla که باید بازی کنید",
//             "image": "/Techblog/assets/upload/images/article/valhalla.jpg",
//             "cat_id": "1",
//             "cat_name": "اخبار و مقالات",
//             "author": "بهرام امینی",
//             "view": "1426",
//             "status": "1",
//             "created_at": "۱۴۰۱/۲/۱۶"