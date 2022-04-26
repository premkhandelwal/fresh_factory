import 'dart:convert';

import 'package:flutter/foundation.dart';

class CarouselItem {
  String id;
  String name;
  String creativeTypeId;
  List<Map<String, String>> images;
  CarouselItem({
    required this.id,
    required this.name,
    required this.creativeTypeId,
    required this.images,
  });
  

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'creativeTypeId': creativeTypeId,
      'images': images,
    };
  }

  factory CarouselItem.fromMap(Map<String, dynamic> map) {
    return CarouselItem(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      creativeTypeId: map['creativeTypeId'] ?? '',
      images: List<Map<String, String>>.from(map['Images']?.map((x) => Map<String, String>.from(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory CarouselItem.fromJson(String source) => CarouselItem.fromMap(json.decode(source));

static List<CarouselItem> fromJsonList(String source) =>
      (json.decode(source)["payload"] as List)
          .map((i) => CarouselItem.fromMap(i))
          .toList();
}
