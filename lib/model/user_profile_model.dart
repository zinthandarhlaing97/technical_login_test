import 'package:technical_login_test_prj/model/client_model.dart';
import 'package:technical_login_test_prj/model/role_model.dart';

class UserProfileEntity {
  String authKey;
  String createdAt;
  String email;
  int id;
  int empId;
  String modifiedAt;
  String passwordHash;
  String passwordResetToken;
  String refno;
  String remark;
  RoleEntity roleId;
  ClientEntity clientId;
  String status;
  String usedBy;
  String username;
  int version;
  String password;
  String from;
  String to;
  String warehouse;
  String outlet;
  String photo;

  UserProfileEntity(
      {this.authKey,
      this.createdAt,
      this.email,
      this.id,
      this.empId,
      this.modifiedAt,
      this.passwordHash,
      this.passwordResetToken,
      this.refno,
      this.remark,
      this.roleId,
      this.clientId,
      this.status,
      this.usedBy,
      this.username,
      this.version,
      this.password,
      this.from,
      this.to,
      this.warehouse,
      this.outlet,
      this.photo});

  UserProfileEntity.fromJson(Map<String, dynamic> json) {
    authKey = json['AuthKey'];
    createdAt = json['CreatedAt'];
    email = json['Email'];
    id = json['Id'];
    empId = json['EmpId'];
    modifiedAt = json['ModifiedAt'];
    passwordHash = json['PasswordHash'];
    passwordResetToken = json['PasswordResetToken'];
    refno = json['Refno'];
    remark = json['Remark'];
    roleId =
        json['RoleId'] != null ? RoleEntity.fromJson(json['RoleId']) : null;
    clientId = json['ClientId'] != null
        ? ClientEntity.fromJson(json['ClientId'])
        : null;
    status = json['Status'];
    usedBy = json['UsedBy'];
    username = json['Username'];
    version = json['Version'];
    password = json['Password'];
    from = json['From'];
    to = json['To'];
    warehouse = json['Warehouse'];
    outlet = json['Outlet'];
    photo = json['Photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['AuthKey'] = this.authKey;
    data['CreatedAt'] = this.createdAt;
    data['Email'] = this.email;
    data['Id'] = this.id;
    data['EmpId'] = this.empId;
    data['ModifiedAt'] = this.modifiedAt;
    data['PasswordHash'] = this.passwordHash;
    data['PasswordResetToken'] = this.passwordResetToken;
    data['Refno'] = this.refno;
    data['Remark'] = this.remark;
    if (this.roleId != null) {
      data['RoleId'] = this.roleId.toJson();
    }
    if (this.clientId != null) {
      data['ClientId'] = this.clientId.toJson();
    }
    data['Status'] = this.status;
    data['UsedBy'] = this.usedBy;
    data['Username'] = this.username;
    data['Version'] = this.version;
    data['Password'] = this.password;
    data['From'] = this.from;
    data['To'] = this.to;
    data['Warehouse'] = this.warehouse;
    data['Outlet'] = this.outlet;
    data['Photo'] = this.photo;
    return data;
  }
}
