class ItemModel {
  String? id;
  String? name;
  bool? completed;

  ItemModel({this.id, this.name, this.completed});

  ItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    completed = json['completed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['completed'] = completed;
    return data;
  }
}
