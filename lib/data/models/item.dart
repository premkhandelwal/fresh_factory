import 'dart:convert';

import 'package:flutter/foundation.dart';

class Item {
  String id;
  String name;
  String? tags;
  double? mrp;
  bool? cessApplicable;
  double? applicableCess;
  int? minPurchaseQty;
  String? sku;
  bool? shippingCharges;
  double? shippingChargesCost;
  String? image;
  String? video;
  String? videoLink;
  int? publish;
  double? cess;
  bool? status;
  String? desc;
  List<dynamic>? category;
  List<dynamic>? subcategory;
  List<dynamic>? brand;
  double? taxPercent;
  Item({
    required this.id,
    required this.name,
    this.tags,
    this.mrp,
    this.cessApplicable,
    this.applicableCess,
    this.minPurchaseQty,
    this.sku,
    this.shippingCharges,
    this.image,
    this.video,
    this.videoLink,
    this.publish,
    this.cess,
    this.status,
    this.desc,
    this.category,
    this.subcategory,
    this.brand,
    this.taxPercent,
    this.shippingChargesCost
  });

  Item copyWith({
    String? id,
    String? name,
    String? tags,
    double? mrp,
    bool? cessApplicable,
    double? applicableCess,
    int? minPurchaseQty,
    String? sku,
    bool? shippingCharges,
    String? image,
    String? video,
    String? videoLink,
    int? publish,
    double? cess,
    bool? status,
    String? desc,
    List<Map<String, dynamic>>? category,
    List<Map<String, dynamic>>? subcategory,
    List<Map<String, dynamic>>? brand,
    double? taxPercent,
  }) {
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      tags: tags ?? this.tags,
      mrp: mrp ?? this.mrp,
      cessApplicable: cessApplicable ?? this.cessApplicable,
      applicableCess: applicableCess ?? this.applicableCess,
      minPurchaseQty: minPurchaseQty ?? this.minPurchaseQty,
      sku: sku ?? this.sku,
      shippingCharges: shippingCharges ?? this.shippingCharges,
      image: image ?? this.image,
      video: video ?? this.video,
      videoLink: videoLink ?? this.videoLink,
      publish: publish ?? this.publish,
      cess: cess ?? this.cess,
      status: status ?? this.status,
      desc: desc ?? this.desc,
      category: category ?? this.category,
      subcategory: subcategory ?? this.subcategory,
      brand: brand ?? this.brand,
      taxPercent: taxPercent ?? this.taxPercent,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'tags': tags,
      'mrp': mrp,
      'cessApplicable': cessApplicable,
      'applicableCess': applicableCess,
      'minPurchaseQty': minPurchaseQty,
      'sku': sku,
      'ShippingCharges': shippingCharges,
      'ShippingChargesCost': shippingChargesCost,
      'Image': image,
      'video': video,
      'videoLink': videoLink,
      'publish': publish,
      'cess': cess,
      'Status': status,
      'desc': desc,
      'category': category,
      'subCategory': subcategory,
      'brand': brand,
      'taxpercent': taxPercent,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      tags: map['tags'],
      mrp: map['mrp']?.toDouble(),
      cessApplicable: map['Cessapplicable'],
      applicableCess: map['ApplicableCess']?.toDouble(),
      minPurchaseQty: map['MinPurchaseQuantity']?.toInt(),
      sku: map['sku'],
      shippingCharges: map['ShippingCharges'],
      shippingChargesCost: map['ShippingChargesCost'],
      image: map['Image'],
      video: map['video'],
      videoLink: map['videoLink'],
      publish: map['publish']?.toInt(),
      cess: map['cess']?.toDouble(),
      status: map['Status'],
      desc: map['desc'],
      category: map['category'],
      subcategory: map['subCategory'],
      brand: map['brand'],
      taxPercent: map['taxpercent']?.toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source));


static List<Item> fromJsonList(String source) =>
      (json.decode(source)["payload"] as List)
          .map((i) => Item.fromMap(i))
          .toList();
  @override
  String toString() {
    return 'Item(id: $id, name: $name, tags: $tags, mrp: $mrp, cessApplicable: $cessApplicable, applicableCess: $applicableCess, minPurchaseQty: $minPurchaseQty, sku: $sku, shippingCharges: $shippingCharges, image: $image, video: $video, videoLink: $videoLink, publish: $publish, cess: $cess, status: $status, desc: $desc, category: $category, subcategory: $subcategory, brand: $brand, taxPercent: $taxPercent)';
  }
}
/*  
{
      "id": "9a56b88e-d59f-45d5-9e05-a6889bf44760",
      "name": "Nokia",
      "tags": "samsung mobile,smartphone",
      "mrp": 17000.0,
      "Cessapplicable": false,
      "ApplicableCess": null,
      "MinPurchaseQuantity": 1,
      "sku": "JHFDJHOI",
      "ShippingCharges": false,
      "ShippingChargesCost": null,
      "Image": null,
      "video": "/media/videos/SampleVideo_1280x720_1mb_CoVFrsO.mp4",
      "videoLink": "",
      "publish": 0,
      "cess": 10.0,
      "Status": true,
      "desc": "Power of technology",
      "category": [
        {
          "Name": "Electronics"
        }
      ],
      "subCategory": [
        {
          "Name": "Mobile phone"
        }
      ],
      "brand": [
        {
          "BrandName": "samsung"
        }
      ],
      "taxpercent": 14
    }
*/