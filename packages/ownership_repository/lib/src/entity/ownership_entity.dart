import 'dart:convert';

class OwnershipEntity {

  final String benzin;
  final String car;
  final String km;
  OwnershipEntity({
    required this.benzin,
    required this.car,
    required this.km,
  });





  OwnershipEntity copyWith({
    String? benzin,
    String? car,
    String? km,
  }) {
    return OwnershipEntity(
      benzin: benzin ?? this.benzin,
      car: car ?? this.car,
      km: km ?? this.km,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'benzin': benzin,
      'car': car,
      'km': km,
    };
  }

   OwnershipEntity.empty()
      : this(
      benzin: "",
      car: "",
      km: "",
        );

  factory OwnershipEntity.fromMap(Map<String, dynamic> map) {
    return OwnershipEntity(
      benzin: map['benzin'],
      car: map['car'],
      km: map['km'],
    );
  }

  String toJson() => json.encode(toMap());

  factory OwnershipEntity.fromJson(String source) => OwnershipEntity.fromMap(json.decode(source));

  @override
  String toString() => 'OwnershipEntity(benzin: $benzin, car: $car, km: $km)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is OwnershipEntity &&
      other.benzin == benzin &&
      other.car == car &&
      other.km == km;
  }

  @override
  int get hashCode => benzin.hashCode ^ car.hashCode ^ km.hashCode;
}
