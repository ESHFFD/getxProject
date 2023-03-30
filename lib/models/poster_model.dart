// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:blog_app/constant/api_constant.dart';

class PosterModel {
  String? id;
  String? title;
  String? image;
  PosterModel({
    this.id,
    this.title,
    this.image,
  });

  PosterModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = ApiConstant.uploadImageHome + json['image'];
  }
}
