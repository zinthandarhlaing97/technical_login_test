class RoleEntity {
  int id;
  String name;
  String description;
  String createdAt;
  String modified;

  RoleEntity(
      {this.id, this.name, this.description, this.createdAt, this.modified});

  RoleEntity.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['Name'];
    description = json['Description'];
    createdAt = json['CreatedAt'];
    modified = json['Modified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Name'] = this.name;
    data['Description'] = this.description;
    data['CreatedAt'] = this.createdAt;
    data['Modified'] = this.modified;
    return data;
  }
}
