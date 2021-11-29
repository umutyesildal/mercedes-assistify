import 'dart:convert';

import 'package:flutter/foundation.dart';

class ServiceEntity {
  final String gelis_tarihi;
  final String teslim_tarihi;
  final String ownership;
  final String bakim_asamasi;
  final List<String> maintenance;
  ServiceEntity({
    required this.gelis_tarihi,
    required this.teslim_tarihi,
    required this.ownership,
    required this.bakim_asamasi,
    required this.maintenance,
  });

  ServiceEntity copyWith({
    String? gelis_tarihi,
    String? teslim_tarihi,
    String? ownership,
    String? bakim_asamasi,
    List<String>? maintenance,
  }) {
    return ServiceEntity(
      gelis_tarihi: gelis_tarihi ?? this.gelis_tarihi,
      teslim_tarihi: teslim_tarihi ?? this.teslim_tarihi,
      ownership: ownership ?? this.ownership,
      bakim_asamasi: bakim_asamasi ?? this.bakim_asamasi,
      maintenance: maintenance ?? this.maintenance,
    );
  }

  ServiceEntity.empty()
      : this(
      gelis_tarihi: "",
      teslim_tarihi: "",
      ownership: "",
      bakim_asamasi:"",
      maintenance: [],
        );

  Map<String, dynamic> toMap() {
    return {
      'gelis_tarihi': gelis_tarihi,
      'teslim_tarihi': teslim_tarihi,
      'ownership': ownership,
      'bakim_asamasi': bakim_asamasi,
      'maintenance': maintenance,
    };
  }

  factory ServiceEntity.fromMap(Map<String, dynamic> map) {
    return ServiceEntity(
      gelis_tarihi: map['gelis_tarihi'],
      teslim_tarihi: map['teslim_tarihi'],
      ownership: map['ownership'],
      bakim_asamasi: map['bakim_asamasi'],
      maintenance: List<String>.from(map['maintenance']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ServiceEntity.fromJson(String source) => ServiceEntity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ServiceEntity(gelis_tarihi: $gelis_tarihi, teslim_tarihi: $teslim_tarihi, ownership: $ownership, bakim_asamasi: $bakim_asamasi, maintenance: $maintenance)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ServiceEntity &&
      other.gelis_tarihi == gelis_tarihi &&
      other.teslim_tarihi == teslim_tarihi &&
      other.ownership == ownership &&
      other.bakim_asamasi == bakim_asamasi &&
      listEquals(other.maintenance, maintenance);
  }

  @override
  int get hashCode {
    return gelis_tarihi.hashCode ^
      teslim_tarihi.hashCode ^
      ownership.hashCode ^
      bakim_asamasi.hashCode ^
      maintenance.hashCode;
  }
}
