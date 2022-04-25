import 'dart:convert';

/// data : [{"_id":"625d3d8e84aabf9334e560ef","images":["https://firebasestorage.googleapis.com/v0/b/baratapp1.appspot.com/o/Area%20images%2Fscaled_image_picker5995819633350121822.jpg?alt=media&token=d72b5324-6afe-4833-b933-de884eb82cca","https://firebasestorage.googleapis.com/v0/b/baratapp1.appspot.com/o/Area%20images%2Fscaled_image_picker4857176575623208176.jpg?alt=media&token=efc11799-0563-4c9b-b065-b48aeb2d344e"],"OwnerName":"Mishbah","hallName":"Arrange GOLD","OwnerContact":"0","OwnerEmail":"mish@gmail.com","HallAddress":"s-23 adress","HallCapacity":800,"PricePerHead":600,"CateringPerHead":450,"EventPlanner":true,"areaId":"624712e4a2c1db5113510647","hallOwnerId":"6257e4dfb73e94f448202ad5","createdAt":"2022-04-18T10:29:34.008Z","updatedAt":"2022-04-18T10:29:34.008Z","__v":0}]

GetHallsByID getHallsByIDFromJson(String str) =>
    GetHallsByID.fromJson(json.decode(str));
String getHallsByIDToJson(GetHallsByID data) => json.encode(data.toJson());

class GetHallsByID {
  GetHallsByID({
    List<Data>? data,
  }) {
    _data = data;
  }

  GetHallsByID.fromJson(dynamic json) {
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

/// _id : "625d3d8e84aabf9334e560ef"
/// images : ["https://firebasestorage.googleapis.com/v0/b/baratapp1.appspot.com/o/Area%20images%2Fscaled_image_picker5995819633350121822.jpg?alt=media&token=d72b5324-6afe-4833-b933-de884eb82cca","https://firebasestorage.googleapis.com/v0/b/baratapp1.appspot.com/o/Area%20images%2Fscaled_image_picker4857176575623208176.jpg?alt=media&token=efc11799-0563-4c9b-b065-b48aeb2d344e"]
/// OwnerName : "Mishbah"
/// hallName : "Arrange GOLD"
/// OwnerContact : "0"
/// OwnerEmail : "mish@gmail.com"
/// HallAddress : "s-23 adress"
/// HallCapacity : 800
/// PricePerHead : 600
/// CateringPerHead : 450
/// EventPlanner : true
/// areaId : "624712e4a2c1db5113510647"
/// hallOwnerId : "6257e4dfb73e94f448202ad5"
/// createdAt : "2022-04-18T10:29:34.008Z"
/// updatedAt : "2022-04-18T10:29:34.008Z"
/// __v : 0

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    String? id,
    List<String>? images,
    String? ownerName,
    String? hallName,
    String? ownerContact,
    String? ownerEmail,
    String? hallAddress,
    int? hallCapacity,
    int? pricePerHead,
    int? cateringPerHead,
    bool? eventPlanner,
    String? areaId,
    String? hallOwnerId,
    String? createdAt,
    String? updatedAt,
    int? v,
  }) {
    _id = id;
    _images = images;
    _ownerName = ownerName;
    _hallName = hallName;
    _ownerContact = ownerContact;
    _ownerEmail = ownerEmail;
    _hallAddress = hallAddress;
    _hallCapacity = hallCapacity;
    _pricePerHead = pricePerHead;
    _cateringPerHead = cateringPerHead;
    _eventPlanner = eventPlanner;
    _areaId = areaId;
    _hallOwnerId = hallOwnerId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
  }

  Data.fromJson(dynamic json) {
    _id = json['_id'];
    _images = json['images'] != null ? json['images'].cast<String>() : [];
    _ownerName = json['OwnerName'];
    _hallName = json['hallName'];
    _ownerContact = json['OwnerContact'];
    _ownerEmail = json['OwnerEmail'];
    _hallAddress = json['HallAddress'];
    _hallCapacity = json['HallCapacity'];
    _pricePerHead = json['PricePerHead'];
    _cateringPerHead = json['CateringPerHead'];
    _eventPlanner = json['EventPlanner'];
    _areaId = json['areaId'];
    _hallOwnerId = json['hallOwnerId'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
  }
  String? _id;
  List<String>? _images;
  String? _ownerName;
  String? _hallName;
  String? _ownerContact;
  String? _ownerEmail;
  String? _hallAddress;
  int? _hallCapacity;
  int? _pricePerHead;
  int? _cateringPerHead;
  bool? _eventPlanner;
  String? _areaId;
  String? _hallOwnerId;
  String? _createdAt;
  String? _updatedAt;
  int? _v;

  String? get id => _id;
  List<String>? get images => _images;
  String? get ownerName => _ownerName;
  String? get hallName => _hallName;
  String? get ownerContact => _ownerContact;
  String? get ownerEmail => _ownerEmail;
  String? get hallAddress => _hallAddress;
  int? get hallCapacity => _hallCapacity;
  int? get pricePerHead => _pricePerHead;
  int? get cateringPerHead => _cateringPerHead;
  bool? get eventPlanner => _eventPlanner;
  String? get areaId => _areaId;
  String? get hallOwnerId => _hallOwnerId;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  int? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['images'] = _images;
    map['OwnerName'] = _ownerName;
    map['hallName'] = _hallName;
    map['OwnerContact'] = _ownerContact;
    map['OwnerEmail'] = _ownerEmail;
    map['HallAddress'] = _hallAddress;
    map['HallCapacity'] = _hallCapacity;
    map['PricePerHead'] = _pricePerHead;
    map['CateringPerHead'] = _cateringPerHead;
    map['EventPlanner'] = _eventPlanner;
    map['areaId'] = _areaId;
    map['hallOwnerId'] = _hallOwnerId;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    return map;
  }
}
