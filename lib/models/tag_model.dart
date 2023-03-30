class TagModel {
  String? title;
  String? id;
  TagModel({required this.title, required this.id});

  TagModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }
}
