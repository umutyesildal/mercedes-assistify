import 'dart:convert';

class MaintenanceEntity {
  final String a_bakimi;
  final String b_bakimi;
  final String bakim_bir;
  final String bakim_iki;
  final String motor_yagi;
  final String yag_filtresi;
  MaintenanceEntity({
    required this.a_bakimi,
    required this.b_bakimi,
    required this.bakim_bir,
    required this.bakim_iki,
    required this.motor_yagi,
    required this.yag_filtresi,
  });



  MaintenanceEntity copyWith({
    String? a_bakimi,
    String? b_bakimi,
    String? bakim_bir,
    String? bakim_iki,
    String? motor_yagi,
    String? yag_filtresi,
  }) {
    return MaintenanceEntity(
      a_bakimi: a_bakimi ?? this.a_bakimi,
      b_bakimi: b_bakimi ?? this.b_bakimi,
      bakim_bir: bakim_bir ?? this.bakim_bir,
      bakim_iki: bakim_iki ?? this.bakim_iki,
      motor_yagi: motor_yagi ?? this.motor_yagi,
      yag_filtresi: yag_filtresi ?? this.yag_filtresi,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'a_bakimi': a_bakimi,
      'b_bakimi': b_bakimi,
      'bakim_bir': bakim_bir,
      'bakim_iki': bakim_iki,
      'motor_yagi': motor_yagi,
      'yag_filtresi': yag_filtresi,
    };
  }

   MaintenanceEntity.empty()
      : this(
      a_bakimi: "",
      b_bakimi: "",
      bakim_bir: "",
      bakim_iki: "",
      motor_yagi: "",
      yag_filtresi: "",
        );

  factory MaintenanceEntity.fromMap(Map<String, dynamic> map) {
    return MaintenanceEntity(
      a_bakimi: map['a_bakimi'],
      b_bakimi: map['b_bakimi'],
      bakim_bir: map['bakim_bir'],
      bakim_iki: map['bakim_iki'],
      motor_yagi: map['motor_yagi'],
      yag_filtresi: map['yag_filtresi'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MaintenanceEntity.fromJson(String source) => MaintenanceEntity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MaintenanceEntity(a_bakimi: $a_bakimi, b_bakimi: $b_bakimi, bakim_bir: $bakim_bir, bakim_iki: $bakim_iki, motor_yagi: $motor_yagi, yag_filtresi: $yag_filtresi)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is MaintenanceEntity &&
      other.a_bakimi == a_bakimi &&
      other.b_bakimi == b_bakimi &&
      other.bakim_bir == bakim_bir &&
      other.bakim_iki == bakim_iki &&
      other.motor_yagi == motor_yagi &&
      other.yag_filtresi == yag_filtresi;
  }

  @override
  int get hashCode {
    return a_bakimi.hashCode ^
      b_bakimi.hashCode ^
      bakim_bir.hashCode ^
      bakim_iki.hashCode ^
      motor_yagi.hashCode ^
      yag_filtresi.hashCode;
  }
}
