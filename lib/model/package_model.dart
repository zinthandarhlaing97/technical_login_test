class PackageEntity {
  int id;
  String name;
  int allowedOutlets;
  String descriptions;
  String status;
  String createdAt;
  String modifiedAt;
  String remarks;
  String usedBy;

  PackageEntity(
      {this.id,
      this.name,
      this.allowedOutlets,
      this.descriptions,
      this.status,
      this.createdAt,
      this.modifiedAt,
      this.remarks,
      this.usedBy});

  PackageEntity.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['Name'];
    allowedOutlets = json['AllowedOutlets'];
    descriptions = json['Descriptions'];
    status = json['Status'];
    createdAt = json['CreatedAt'];
    modifiedAt = json['ModifiedAt'];
    remarks = json['Remarks'];
    usedBy = json['UsedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Name'] = this.name;
    data['AllowedOutlets'] = this.allowedOutlets;
    data['Descriptions'] = this.descriptions;
    data['Status'] = this.status;
    data['CreatedAt'] = this.createdAt;
    data['ModifiedAt'] = this.modifiedAt;
    data['Remarks'] = this.remarks;
    data['UsedBy'] = this.usedBy;
    return data;
  }
}
