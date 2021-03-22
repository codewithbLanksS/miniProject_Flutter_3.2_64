import 'dart:convert';

class bookingModel {
  final String typeroom;
  final int allprice;
  final int daybook;
  final String dayout;
  final String dayin;
  bookingModel({
    this.typeroom,
    this.allprice,
    this.daybook,
    this.dayout,
    this.dayin,
  });

  bookingModel copyWith({
    String typeroom,
    int allprice,
    int daybook,
    String dayout,
    String dayin,
  }) {
    return bookingModel(
      typeroom: typeroom ?? this.typeroom,
      allprice: allprice ?? this.allprice,
      daybook: daybook ?? this.daybook,
      dayout: dayout ?? this.dayout,
      dayin: dayin ?? this.dayin,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'typeroom': typeroom,
      'allprice': allprice,
      'daybook': daybook,
      'dayout': dayout,
      'dayin': dayin,
    };
  }

  factory bookingModel.fromMap(Map<String, dynamic> map) {
    return bookingModel(
      typeroom: map['typeroom'],
      allprice: map['allprice'],
      daybook: map['daybook'],
      dayout: map['dayout'],
      dayin: map['dayin'],
    );
  }

  String toJson() => json.encode(toMap());

  factory bookingModel.fromJson(String source) =>
      bookingModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'bookingModel(typeroom: $typeroom, allprice: $allprice, daybook: $daybook, dayout: $dayout, dayin: $dayin)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is bookingModel &&
        other.typeroom == typeroom &&
        other.allprice == allprice &&
        other.daybook == daybook &&
        other.dayout == dayout &&
        other.dayin == dayin;
  }

  @override
  int get hashCode {
    return typeroom.hashCode ^
        allprice.hashCode ^
        daybook.hashCode ^
        dayout.hashCode ^
        dayin.hashCode;
  }
}
