import 'dart:convert';

/// data : [{"_id":"6256bbfd4ced99a81d9b95b6","UserName":"ahdjkh","FullName":"lakjfdk@gmail.com","UserEmail":"lakjfdk@gmail.com","phoneNumber":"65465465","password":"$2b$10$/wndcdokTWGDHs3Lw6zMbOekwPM4tJdxYstsbn9Ij0peYZXTDTsY2","userRoll":1,"createdAt":"2022-04-13T12:03:09.917Z","updatedAt":"2022-04-13T12:03:09.917Z","__v":0},{"_id":"6257e4dfb73e94f448202ad5","UserName":"halluserf1","FullName":"F1@gmail.com","UserEmail":"F1@gmail.com","phoneNumber":"54646546546","password":"$2b$10$SiSiHE73Ay.t5RidwUOfdOjdFvEZ0bkQo5GBs7VJBqPd3.K0vGp4S","userRoll":2,"createdAt":"2022-04-14T09:09:51.065Z","updatedAt":"2022-04-14T09:09:51.065Z","__v":0},{"_id":"6257e591b73e94f448202ad8","UserName":"1","FullName":"1@gmail.com","UserEmail":"1@gmail.com","phoneNumber":"4654","password":"$2b$10$wt9cSzqNXrkGAvDsBbCDjOt67xy.HOhkQEkV/O6jV/LDYi102A7Oy","userRoll":2,"createdAt":"2022-04-14T09:12:49.601Z","updatedAt":"2022-04-14T09:12:49.601Z","__v":0},{"_id":"6257e637b73e94f448202ade","UserName":"2","FullName":"3@gmail.com","UserEmail":"3@gmail.com","phoneNumber":"4546","password":"$2b$10$clyN7pIl3KmkOmBwqoyjrOpBBl0/0PEGygDVO3yN/hDw2G7HyxxV6","userRoll":2,"createdAt":"2022-04-14T09:15:35.811Z","updatedAt":"2022-04-14T09:15:35.811Z","__v":0},{"_id":"625954c60077792ad14b2820","UserName":"a1","FullName":"a1@gmail.com","UserEmail":"a1@gmail.com","phoneNumber":"54646","password":"$2b$10$zlEik/KKGrsIMiktRyXjl.Uf3SJ9JWX0yXboBbMCPZAUh9cABH4VW","userRoll":0,"createdAt":"2022-04-15T11:19:34.947Z","updatedAt":"2022-04-15T11:19:34.947Z","__v":0},{"_id":"625d30a884aabf9334e56088","UserName":"user1","FullName":"user1@gmail.com","UserEmail":"user1@gmail.com","phoneNumber":"454584585454","password":"$2b$10$NchV9qym5xrZcvdN/RQE3eU5QWB5NR3LJ2Z7AxCyd.GGwC00UVI76","userRoll":2,"createdAt":"2022-04-18T09:34:32.278Z","updatedAt":"2022-04-18T09:34:32.278Z","__v":0}]

HallOwnerModel hallOwnerModelFromJson(String str) =>
    HallOwnerModel.fromJson(json.decode(str));
String hallOwnerModelToJson(HallOwnerModel data) => json.encode(data.toJson());

class HallOwnerModel {
  HallOwnerModel({
    List<Data>? data,
  }) {
    _data = data;
  }

  HallOwnerModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  List<Data>? _data;

  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// _id : "6256bbfd4ced99a81d9b95b6"
/// UserName : "ahdjkh"
/// FullName : "lakjfdk@gmail.com"
/// UserEmail : "lakjfdk@gmail.com"
/// phoneNumber : "65465465"
/// password : "$2b$10$/wndcdokTWGDHs3Lw6zMbOekwPM4tJdxYstsbn9Ij0peYZXTDTsY2"
/// userRoll : 1
/// createdAt : "2022-04-13T12:03:09.917Z"
/// updatedAt : "2022-04-13T12:03:09.917Z"
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
