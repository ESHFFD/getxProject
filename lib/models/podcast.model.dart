// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:blog_app/constant/api_constant.dart';

// class PodcastModel {
//   String? id;
//   String? title;
//   String? poster;
//   String? catName;
//   String? author;
//   String? view;
//   String? status;
//   String? createdAt;
//   PodcastModel({
//     required this.id,
//     required this.title,
//     required this.poster,
//     required this.catName,
//     required this.author,
//     required this.view,
//     required this.status,
//     required this.createdAt,
//   });
//   PodcastModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     title = json['title'];
//     poster = ApiConstant.uploadImageHome + json['poster'] ?? '';
//     catName = json['cat_name'];
//     author = json['author'];
//     view = json['view'];
//     status = json['status'];
//     createdAt = json['created_at'];
//   }
// }
