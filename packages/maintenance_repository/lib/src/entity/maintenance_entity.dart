import 'dart:convert';

import 'package:flutter/foundation.dart';

class MaintenanceEntity {
  final String serviceType;
  final List<String> extraServices;
  MaintenanceEntity({
    required this.serviceType,
    required this.extraServices,
  });

  MaintenanceEntity copyWith({
    String? serviceType,
    List<String>? extraServices,
  }) {
    return MaintenanceEntity(
      serviceType: serviceType ?? this.serviceType,
      extraServices: extraServices ?? this.extraServices,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'serviceType': serviceType,
      'extraServices': extraServices,
    };
  }

  factory MaintenanceEntity.fromMap(Map<String, dynamic> map) {
    return MaintenanceEntity(
      serviceType: map['serviceType'],
      extraServices: List<String>.from(map['extraServices']),
    );
  }

  String toJson() => json.encode(toMap());

  factory MaintenanceEntity.fromJson(String source) =>
      MaintenanceEntity.fromMap(json.decode(source));

  @override
  String toString() =>
      'MaintenanceEntity(serviceType: $serviceType, extraServices: $extraServices)';
}
