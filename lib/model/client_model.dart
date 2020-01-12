import 'package:technical_login_test_prj/model/package_model.dart';

class ClientEntity {
  int id;
  String name;
  String description;
  String address;
  String image;
  String phone;
  String email;
  String guid;
  PackageEntity packageId;
  String createdAt;
  String updatedAt;
  String remark;
  String usedBy;
  String status;

  ClientEntity(
      {this.id,
      this.name,
      this.description,
      this.address,
      this.image,
      this.phone,
      this.email,
      this.guid,
      this.packageId,
      this.createdAt,
      this.updatedAt,
      this.remark,
      this.usedBy,
      this.status});

  ClientEntity.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['Name'];
    description = json['Description'];
    address = json['Address'];
    image = json['Image'];
    phone = json['Phone'];
    email = json['Email'];
    guid = json['Guid'];
    packageId = json['PackageId'] != null
        ? PackageEntity.fromJson(json['PackageId'])
        : null;
    createdAt = json['CreatedAt'];
    updatedAt = json['UpdatedAt'];
    remark = json['Remark'];
    usedBy = json['UsedBy'];
    status = json['Status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Id'] = this.id;
    data['Name'] = this.name;
    data['Description'] = this.description;
    data['Address'] = this.address;
    data['Image'] = this.image;
    data['Phone'] = this.phone;
    data['Email'] = this.email;
    data['Guid'] = this.guid;
    if (this.packageId != null) {
      data['PackageId'] = this.packageId.toJson();
    }
    data['CreatedAt'] = this.createdAt;
    data['UpdatedAt'] = this.updatedAt;
    data['Remark'] = this.remark;
    data['UsedBy'] = this.usedBy;
    data['Status'] = this.status;
    return data;
  }
}
