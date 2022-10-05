class TodoModel {
  String? id;
  String? name;
  bool? completed;

  TodoModel({
    this.name,
    this.completed,
  });

  TodoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    completed = json['completed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    //id ??
    data['name'] = name;
    data['completed'] = completed;
    return data;
  }

  
}
