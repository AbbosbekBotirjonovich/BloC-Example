class Model {
  String? id;
  String? url;
  int? width;
  int? height;

  Model({this.url, this.id, this.width, this.height});

  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(
      url: json['url'],
      id: json['id'],
      width: json['width'],
      height: json['height']
    );
  }
}
