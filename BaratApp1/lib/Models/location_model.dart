import 'dart:convert';

/// data : [{"_id":"62433f36c2ce9ecea55d227c","areaImage":"https://firebasestorage.googleapis.com/v0/b/baratapp1.appspot.com/o/Area%20images%2Fscaled_image_picker3003101623031360310.jpg?alt=media&token=e4a3b515-6323-4bd2-abd3-1ec018529b24","areaName":"Defence Phase 1","hallsId":["1"],"createdAt":"2022-03-29T17:17:42.440Z","updatedAt":"2022-03-29T17:17:42.440Z","__v":0}]

LocationModel locationModelFromJson(String str) =>
    LocationModel.fromJson(json.decode(str));
String locationModelToJson(LocationModel data) => json.encode(data.toJson());

class LocationModel {
  LocationModel({
    List<Data>? data,
  }) {
    _data = data;
  }

  LocationModel.fromJson(dynamic json) {
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

/// _id : "62433f36c2ce9ecea55d227c"
/// areaImage : "https://firebasestorage.googleapis.com/v0/b/baratapp1.appspot.com/o/Area%20images%2Fscaled_image_picker3003101623031360310.jpg?alt=media&token=e4a3b515-6323-4bd2-abd3-1ec018529b24"
/// areaName : "Defence Phase 1"
/// hallsId : ["1"]
/// createdAt : "2022-03-29T17:17:42.440Z"
/// updatedAt : "2022-03-29T17:17:42.440Z"
/// __v : 0

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    String? id,
    String? areaImage,
    String? areaName,
    List<String>? hallsId,
    String? createdAt,
    String? updatedAt,
    int? v,
  }) {
    _id = id;
    _areaImage = areaImage;
    _areaName = areaName;
    _hallsId = hallsId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
  }

  Data.fromJson(dynamic json) {
    _id = json['_id'];
    _areaImage = json['areaImage'];
    _areaName = json['areaName'];
    _hallsId = json['hallsId'] != null ? json['hallsId'].cast<String>() : [];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
  }
  String? _id;
  String? _areaImage;
  String? _areaName;
  List<String>? _hallsId;
  String? _createdAt;
  String? _updatedAt;
  int? _v;

  String? get id => _id;
  String? get areaImage => _areaImage;
  String? get areaName => _areaName;
  List<String>? get hallsId => _hallsId;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  int? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['areaImage'] = _areaImage;
    map['areaName'] = _areaName;
    map['hallsId'] = _hallsId;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    return map;
  }
}
