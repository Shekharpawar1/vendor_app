class LoginModel {
  String? remark;
  String? status;
  Message? message;
  Data? data;

  LoginModel({this.remark, this.status, this.message, this.data});

  LoginModel.fromJson(Map<String, dynamic> json) {
    remark = json['remark'];
    status = json['status'];
    message =
    json['message'] != null ? new Message.fromJson(json['message']) : null;
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['remark'] = this.remark;
    data['status'] = this.status;
    if (this.message != null) {
      data['message'] = this.message!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Message {
  List<String>? success;

  Message({this.success});

  Message.fromJson(Map<String, dynamic> json) {
    success = json['success'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    return data;
  }
}

class Data {
  User? user;
  String? accessToken;
  String? tokenType;

  Data({this.user, this.accessToken, this.tokenType});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    accessToken = json['access_token'];
    tokenType = json['token_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['access_token'] = this.accessToken;
    data['token_type'] = this.tokenType;
    return data;
  }
}

class User {
  int? id;
  int? parentId;
  int? roleId;
  String? firstname;
  String? lastname;
  String? email;
  Null? image;
  String? countryCode;
  String? mobile;
  Address? address;
  int? isFeatured;
  int? reqStep;
  int? status;
  Null? verCodeSendAt;
  int? ts;
  int? tv;
  Null? tsc;
  List<FormData>? formData;
  Null? banReason;
  String? expireAt;
  String? avgRating;
  int? autoPayment;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
        this.parentId,
        this.roleId,
        this.firstname,
        this.lastname,
        this.email,
        this.image,
        this.countryCode,
        this.mobile,
        this.address,
        this.isFeatured,
        this.reqStep,
        this.status,
        this.verCodeSendAt,
        this.ts,
        this.tv,
        this.tsc,
        this.formData,
        this.banReason,
        this.expireAt,
        this.avgRating,
        this.autoPayment,
        this.createdAt,
        this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    parentId = json['parent_id'];
    roleId = json['role_id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    email = json['email'];
    image = json['image'];
    countryCode = json['country_code'];
    mobile = json['mobile'];
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
    isFeatured = json['is_featured'];
    reqStep = json['req_step'];
    status = json['status'];
    verCodeSendAt = json['ver_code_send_at'];
    ts = json['ts'];
    tv = json['tv'];
    tsc = json['tsc'];
    if (json['form_data'] != null) {
      formData = <FormData>[];
      json['form_data'].forEach((v) {
        formData!.add(new FormData.fromJson(v));
      });
    }
    banReason = json['ban_reason'];
    expireAt = json['expire_at'];
    avgRating = json['avg_rating'];
    autoPayment = json['auto_payment'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['parent_id'] = this.parentId;
    data['role_id'] = this.roleId;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['email'] = this.email;
    data['image'] = this.image;
    data['country_code'] = this.countryCode;
    data['mobile'] = this.mobile;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    data['is_featured'] = this.isFeatured;
    data['req_step'] = this.reqStep;
    data['status'] = this.status;
    data['ver_code_send_at'] = this.verCodeSendAt;
    data['ts'] = this.ts;
    data['tv'] = this.tv;
    data['tsc'] = this.tsc;
    if (this.formData != null) {
      data['form_data'] = this.formData!.map((v) => v.toJson()).toList();
    }
    data['ban_reason'] = this.banReason;
    data['expire_at'] = this.expireAt;
    data['avg_rating'] = this.avgRating;
    data['auto_payment'] = this.autoPayment;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Address {
  String? address;
  String? city;
  String? state;
  String? zip;
  String? country;

  Address({this.address, this.city, this.state, this.zip, this.country});

  Address.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    city = json['city'];
    state = json['state'];
    zip = json['zip'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['city'] = this.city;
    data['state'] = this.state;
    data['zip'] = this.zip;
    data['country'] = this.country;
    return data;
  }
}

class FormData {
  String? name;
  String? type;
  String? value;

  FormData({this.name, this.type, this.value});

  FormData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    type = json['type'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['type'] = this.type;
    data['value'] = this.value;
    return data;
  }
}
