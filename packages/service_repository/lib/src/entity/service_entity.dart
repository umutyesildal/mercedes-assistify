import 'dart:convert';

import 'package:maintenance_repository/maintenance_repository.dart';

class ServiceEntity {
  final String gelis_tarihi;
  final String teslim_tarihi;
  final String ownership;
  final String bakim_asamasi;
  final MaintenanceEntity maintenance;
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
    MaintenanceEntity? maintenance,
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
          bakim_asamasi: "",
          maintenance: MaintenanceEntity(
            serviceType: '',
            extraServices: [],
          ),
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
      maintenance: map['maintenance'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ServiceEntity.fromJson(String source) =>
      ServiceEntity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ServiceEntity(gelis_tarihi: $gelis_tarihi, teslim_tarihi: $teslim_tarihi, ownership: $ownership, bakim_asamasi: $bakim_asamasi, maintenance: $maintenance)';
  }
}
