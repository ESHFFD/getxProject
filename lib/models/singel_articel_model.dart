// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:blog_app/constant/api_constant.dart';

class SingelArticelInfoModel {
  String? id;
  String? title;
  String? content;
  String? image;
  String? catId;
  String? catName;
  String? author;
  String? view;
  String? status;
  String? createdAt;
  bool? isFavorite;
  SingelArticelInfoModel(
      {this.id,
      this.title,
      this.content,
      this.image,
      this.catId,
      this.catName,
      this.author,
      this.view,
      this.status,
      this.createdAt,
      this.isFavorite});
  SingelArticelInfoModel.fromJson(Map<String, dynamic> json) {
    var info = json['info'];
    id = info['id'];
    title = info['title'];
    content = info['content'];
    image = ApiConstant.uploadImageHome + info['image'];
    catId = info['cat_id'];
    author = info['author'];
    catName = info['cat_name'];
    view = info['view'];
    status = info['status'];
    createdAt = info['created_at'];
    isFavorite = json['isFavorite'];
  }
}
