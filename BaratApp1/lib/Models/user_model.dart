import 'dart:convert';

/// data : {"_id":"625954c60077792ad14b2820","UserName":"a1","FullName":"a1@gmail.com","UserEmail":"a1@gmail.com","phoneNumber":"54646","password":"$2b$10$zlEik/KKGrsIMiktRyXjl.Uf3SJ9JWX0yXboBbMCPZAUh9cABH4VW","userRoll":0,"createdAt":"2022-04-15T11:19:34.947Z","updatedAt":"2022-04-15T11:19:34.947Z","__v":0}

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));
String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    Data? data,
  }) {
    _data = data;
  }

  UserModel.fromJson(dynamic json) {
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  Data? _data;

  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

/// _id : "625954c60077792ad14b2820"
/// UserName : "a1"
/// FullName : "a1@gmail.com"
/// UserEmail : "a1@gmail.com"
/// phoneNumber : "54646"
/// password : "$2b$10$zlEik/KKGrsIMiktRyXjl.Uf3SJ9JWX0yXboBbMCPZAUh9cABH4VW"
/// userRoll : 0
/// createdAt : "2022-04-15T11:19:34.947Z"
/// updatedAt : "2022-04-15T11:19:34.947Z"
/// __v : 0

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    String? id,
    String? userName,
    String? fullName,
    String? userEmail,
    String? phoneNumber,
    String? password,
    int? userRoll,
    String? createdAt,
    String? updatedAt,
    int? v,
  }) {
    _id = id;
    _userName = userName;
    _fullName = fullName;
    _userEmail = userEmail;
    _phoneNumber = phoneNumber;
    _password = password;
    _userRoll = userRoll;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
  }

  Data.fromJson(dynamic json) {
    _id = json['_id'];
    _userName = json['UserName'];
    _fullName = json['FullName'];
    _userEmail = json['UserEmail'];
    _phoneNumber = json['phoneNumber'];
    _password = json['password'];
    _userRoll = json['userRoll'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
  }
  String? _id;
  String? _userName;
  String? _fullName;
  String? _userEmail;
  String? _phoneNumber;
  String? _password;
  int? _userRoll;
  String? _createdAt;
  String? _updatedAt;
  int? _v;

  String? get id => _id;
  String? get userName => _userName;
  String? get fullName => _fullName;
  String? get userEmail => _userEmail;
  String? get phoneNumber => _phoneNumber;
  String? get password => _password;
  int? get userRoll => _userRoll;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  int? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['UserName'] = _userName;
    map['FullName'] = _fullName;
    map['UserEmail'] = _userEmail;
    map['phoneNumber'] = _phoneNumber;
    map['password'] = _password;
    map['userRoll'] = _userRoll;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    return map;
  }
}
