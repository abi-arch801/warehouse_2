import 'dart:convert';

class StoreWarehouseRequestModel {
  final String name;
  final String code;
  final String location;
  final String? picName;
  final String? picPhone;
  final bool? isActive;

  StoreWarehouseRequestModel({
    required this.name,
    required this.code,
    required this.location,
    this.picName,
    this.picPhone,
    this.isActive,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'code': code,
      'location': location,
      'pic_name': picName,
      'pic_phone': picPhone,
      'is_active': isActive,
    };
  }

  String toJson() => jsonEncode(toMap());
}

class UpdateWarehouseRequestModel {
  final String? name;
  final String? code;
  final String? location;
  final String? picName;
  final String? picPhone;
  final bool? isActive;

  UpdateWarehouseRequestModel({
    this.name,
    this.code,
    this.location,
    this.picName,
    this.picPhone,
    this.isActive,
  });

  Map<String, dynamic> toMap() {
    return {
      if (name != null) 'name': name,
      if (code != null) 'code': code,
      if (location != null) 'location': location,
      if (picName != null) 'pic_name': picName,
      if (picPhone != null) 'pic_phone': picPhone,
      if (isActive != null) 'is_active': isActive,
    };
  }

  String toJson() => jsonEncode(toMap());
}


