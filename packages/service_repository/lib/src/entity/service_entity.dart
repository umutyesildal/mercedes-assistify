import 'dart:convert';

import 'package:flutter/foundation.dart';

class ServiceEntity {
  final String gelis_tarihi;
  final String teslim_tarihi;
  final String ownership;
  final List<String> maintenance;
  ServiceEntity({
    required this.gelis_tarihi,
    required this.teslim_tarihi,
    required this.ownership,
    required this.maintenance,
  });

  ServiceEntity copyWith({
    String? gelis_tarihi,
    String? teslim_tarihi,
    String? ownership,
    List<String>? maintenance,
  }) {
    return ServiceEntity(
      gelis_tarihi: gelis_tarihi ?? this.gelis_tarihi,
      teslim_tarihi: teslim_tarihi ?? this.teslim_tarihi,
      ownership: ownership ?? this.ownership,
      maintenance: maintenance ?? this.maintenance,
    );
  }

  ServiceEntity.empty()
      : this(
      gelis_tarihi: "",
      teslim_tarihi: "",
      ownership: "",
      maintenance: [],
        );

  Map<String, dynamic> toMap() {
    return {
      'gelis_tarihi': gelis_tarihi,
      'teslim_tarihi': teslim_tarihi,
      'ownership': ownership,
      'maintenance': maintenance,
    };
  }

  factory ServiceEntity.fromMap(Map<String, dynamic> map) {
    return ServiceEntity(
      gelis_tarihi: map['gelis_tarihi'],
      teslim_tarihi: map['teslim_tarihi'],
      ownership: map['ownership'],
      maintenance: List<String>.from(map['maintenance']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ServiceEntity.fromJson(String source) => ServiceEntity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ServiceEntity(gelis_tarihi: $gelis_tarihi, teslim_tarihi: $teslim_tarihi, ownership: $ownership, maintenance: $maintenance)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ServiceEntity &&
      other.gelis_tarihi == gelis_tarihi &&
      other.teslim_tarihi == teslim_tarihi &&
      other.ownership == ownership &&
      listEquals(other.maintenance, maintenance);
  }

  @override
  int get hashCode {
    return gelis_tarihi.hashCode ^
      teslim_tarihi.hashCode ^
      ownership.hashCode ^
      maintenance.hashCode;
  }
}
