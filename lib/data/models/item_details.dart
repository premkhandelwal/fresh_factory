import 'dart:convert';


class ItemDetails {
  List<String> imageList;
  List attributes;
  ItemDetails({
    required this.imageList,
    required this.attributes,
  });

  Map<String, dynamic> toMap() {
    return {
      'imageList': imageList,
      'attributes': attributes,
    };
  }

  factory ItemDetails.fromMap(Map<String, dynamic> map) {
    return ItemDetails(
      imageList: List<String>.from(map['data']['image']),
      attributes: List.from(map['data']['attributes']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemDetails.fromJson(String source) => ItemDetails.fromMap(json.decode(source));

  @override
  String toString() => 'ItemDetails(imageList: $imageList, attributes: $attributes)';
}
