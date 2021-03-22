import 'dart:convert';

class ActivitiesModel {
  final String name;
  final String cover;
  final String image;
  ActivitiesModel({
    this.name,
    this.cover,
    this.image,
  });

  ActivitiesModel copyWith({
    String name,
    String cover,
    String image,
  }) {
    return ActivitiesModel(
      name: name ?? this.name,
      cover: cover ?? this.cover,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'cover': cover,
      'image': image,
    };
  }

  factory ActivitiesModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ActivitiesModel(
      name: map['name'],
      cover: map['cover'],
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ActivitiesModel.fromJson(String source) =>
      ActivitiesModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'ActivitiesModel(name: $name, cover: $cover, image: $image)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ActivitiesModel &&
        o.name == name &&
        o.cover == cover &&
        o.image == image;
  }

  @override
  int get hashCode => name.hashCode ^ cover.hashCode ^ image.hashCode;
}
