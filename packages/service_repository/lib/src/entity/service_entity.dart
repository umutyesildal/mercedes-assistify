import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:maintenance_repository/maintenance_repository.dart';

class ServiceEntity {
  final String arriveDate;
  final String ownership;
  final int phase;
  final List<String> extraServices;
  ServiceEntity({
    required this.arriveDate,
    required this.ownership,
    required this.phase,
    required this.extraServices,
  });

  ServiceEntity copyWith({
    String? arriveDate,
    String? ownership,
    int? phase,
    List<String>? extraServices,
  }) {
    return ServiceEntity(
      arriveDate: arriveDate ?? this.arriveDate,
      ownership: ownership ?? this.ownership,
      phase: phase ?? this.phase,
      extraServices: extraServices ?? this.extraServices,
    );
  }

  ServiceEntity.empty()
      : this(arriveDate: "", ownership: "", phase: 0, extraServices: []);

  Map<String, dynamic> toMap() {
    return {
      'arriveDate': arriveDate,
      'ownership': ownership,
      'phase': phase,
      'extraServices': extraServices,
    };
  }

  factory ServiceEntity.fromMap(Map<String, dynamic> map) {
    return ServiceEntity(
      arriveDate: map['arriveDate'] ?? '',
      ownership: map['ownership'] ?? '',
      phase: map['phase']?.toInt() ?? 0,
      extraServices: List<String>.from(map['extraServices']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ServiceEntity.fromJson(String source) =>
      ServiceEntity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ServiceEntity(arriveDate: $arriveDate, ownership: $ownership, phase: $phase, extraServices: $extraServices)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ServiceEntity &&
        other.arriveDate == arriveDate &&
        other.ownership == ownership &&
        other.phase == phase &&
        listEquals(other.extraServices, extraServices);
  }

  @override
  int get hashCode {
    return arriveDate.hashCode ^
        ownership.hashCode ^
        phase.hashCode ^
        extraServices.hashCode;
  }
}
