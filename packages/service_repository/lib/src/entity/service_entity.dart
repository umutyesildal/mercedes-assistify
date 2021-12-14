import 'dart:convert';

import 'package:maintenance_repository/maintenance_repository.dart';

class ServiceEntity {
  final String service_id;
  final String gelis_tarihi;
  final String teslim_tarihi;
  final String ownership;
  final int bakim_asamasi;
  final MaintenanceEntity maintenance;
  ServiceEntity({
    required this.service_id,
    required this.gelis_tarihi,
    required this.teslim_tarihi,
    required this.ownership,
    required this.bakim_asamasi,
    required this.maintenance,
  });

  ServiceEntity copyWith({
    String? service_id,
    String? gelis_tarihi,
    String? teslim_tarihi,
    String? ownership,
    int? bakim_asamasi,
    MaintenanceEntity? maintenance,
  }) {
    return ServiceEntity(
      service_id: service_id ?? this.service_id,
      gelis_tarihi: gelis_tarihi ?? this.gelis_tarihi,
      teslim_tarihi: teslim_tarihi ?? this.teslim_tarihi,
      ownership: ownership ?? this.ownership,
      bakim_asamasi: bakim_asamasi ?? this.bakim_asamasi,
      maintenance: maintenance ?? this.maintenance,
    );
  }

  ServiceEntity.empty()
      : this(
          service_id: "",
          gelis_tarihi: "",
          teslim_tarihi: "",
          ownership: "",
          bakim_asamasi: 0,
          maintenance: MaintenanceEntity(
            serviceType: '',
            extraServices: [],
          ),
        );

  Map<String, dynamic> toMap() {
    return {
      'service_id': service_id,
      'gelis_tarihi': gelis_tarihi,
      'teslim_tarihi': teslim_tarihi,
      'ownership': ownership,
      'bakim_asamasi': bakim_asamasi,
      'maintenance': maintenance.toMap(),
    };
  }

  factory ServiceEntity.fromMap(Map<String, dynamic> map) {
    return ServiceEntity(
      service_id: map['service_id'] ?? '',
      gelis_tarihi: map['gelis_tarihi'] ?? '',
      teslim_tarihi: map['teslim_tarihi'] ?? '',
      ownership: map['ownership'] ?? '',
      bakim_asamasi: map['bakim_asamasi']?.toInt() ?? 0,
      maintenance: MaintenanceEntity.fromMap(map['maintenance']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ServiceEntity.fromJson(String source) =>
      ServiceEntity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ServiceEntity(service_id: $service_id, gelis_tarihi: $gelis_tarihi, teslim_tarihi: $teslim_tarihi, ownership: $ownership, bakim_asamasi: $bakim_asamasi, maintenance: $maintenance)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ServiceEntity &&
        other.service_id == service_id &&
        other.gelis_tarihi == gelis_tarihi &&
        other.teslim_tarihi == teslim_tarihi &&
        other.ownership == ownership &&
        other.bakim_asamasi == bakim_asamasi &&
        other.maintenance == maintenance;
  }

  @override
  int get hashCode {
    return service_id.hashCode ^
        gelis_tarihi.hashCode ^
        teslim_tarihi.hashCode ^
        ownership.hashCode ^
        bakim_asamasi.hashCode ^
        maintenance.hashCode;
  }
}
