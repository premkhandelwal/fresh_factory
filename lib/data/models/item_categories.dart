import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:fresh/data/models/item.dart';

class ItemCategory extends Equatable{
  final String id;
  final String name;
  final int? priorty;
  final String? bannerImage;
  final String? icon;
  final String? metaTitle;
  final String? metaDescription;
  final String? tags;
  final String? type;
  final String? masterCategory;
  final String? brandName;
  final List<Item> items;
  ItemCategory(
      {required this.id,
      required this.name,
      this.priorty,
      this.bannerImage,
      this.icon,
      this.metaTitle,
      this.metaDescription,
      this.tags,
      this.type,
      this.masterCategory,
      this.brandName,
      }) : items = []  ;

  Map<String, dynamic> toMap() {
    return {
      "category_id": id,
      "Name": name,
      "Priority": priorty,
      "BannerImage": bannerImage,
      "Icon": icon,
      "MetaTitle": metaTitle,
      "MetaDiscription": metaDescription,
      "Tags": tags,
      "Status": true,
      "Type": type,
      "Mastercat": masterCategory,
      "Brand": brandName,
    };
  }

  factory ItemCategory.fromMap(Map<String, dynamic> map) {
    return ItemCategory(
        id: map['category_id'] ?? '',
        name: map['Name'] ?? '',
        priorty: map['Priority'] ?? '',
        bannerImage: map['BannerImage'] ?? '',
        icon: map['Icon'] ?? '',
        metaTitle: map['MetaTitle'] ?? '',
        tags: map['Tags'] ?? '',
        type: map['Type'] ?? '',
        masterCategory: map['Mastercat'] ?? '',
        brandName: map['Brand'] ?? '',
        metaDescription: map['MetaDiscription']);
  }

  String toJson() => json.encode(toMap());

  static List<ItemCategory> fromJsonList(String source) =>
      (json.decode(source)["payload"] as List)
          .map((i) => ItemCategory.fromMap(i))
          .toList();

  factory ItemCategory.fromJson(String source) =>
      ItemCategory.fromMap(json.decode(source));

  @override
  String toString() {
    // return 'items:$items';
    return 'ItemCategory(id: $id, name: $name, priorty: $priorty, bannerImage: $bannerImage, icon: $icon, metaTitle: $metaTitle, tags: $tags, type: $type, masterCategory: $masterCategory, brandName: $brandName, items: $items)';
  }

  @override
  List<Object?> get props => [name];
}

/*
"id": "368dbe05-c767-4129-a615-602cca0ad5d9",
      "category_id": "CH12RR6",
      "Name": "Electronics",
      "Priority": 1,
      "BannerImage": "/media/catimage/wallpaper.jpg",
      "Icon": "/media/caticon/WhatsApp_Image_2021-11-24_at_19.46.03.jpeg",
      "MetaTitle": "Bags for kids",
      "MetaDiscription": "mobile phone , smarts",
      "Tags": "Touch,keypad",
      "Status": true,
      "Type": "Other",
      "Mastercat": "1ce02491-694c-4ee0-b53a-a63a8e689e2d",
      "Brand": "445d0574-8655-4351-8f0b-990f70d05850"

*/