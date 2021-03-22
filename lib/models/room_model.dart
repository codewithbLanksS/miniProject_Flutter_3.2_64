import 'dart:convert';

class RoomModel {
  final String name;
  final String cover;
  final String pdf;
  RoomModel({
    this.name,
    this.cover,
    this.pdf,
  });

  RoomModel copyWith({
    String name,
    String cover,
    String pdf,
  }) {
    return RoomModel(
      name: name ?? this.name,
      cover: cover ?? this.cover,
      pdf: pdf ?? this.pdf,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'cover': cover,
      'pdf': pdf,
    };
  }

  factory RoomModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return RoomModel(
      name: map['name'],
      cover: map['cover'],
      pdf: map['pdf'],
    );
  }

  String toJson() => json.encode(toMap());

  factory RoomModel.fromJson(String source) =>
      RoomModel.fromMap(json.decode(source));

  @override
  String toString() => 'RoomModel(name: $name, cover: $cover, pdf: $pdf)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is RoomModel && o.name == name && o.cover == cover && o.pdf == pdf;
  }

  @override
  int get hashCode => name.hashCode ^ cover.hashCode ^ pdf.hashCode;
}
