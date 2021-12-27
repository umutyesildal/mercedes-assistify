import 'dart:convert';

import 'package:flutter/foundation.dart';

class OwnershipEntity {
  final String car;
  final bool isOngoingService;
  final String ongoingService;
  final List<String> previousServices;

  OwnershipEntity({
    required this.car,
    required this.isOngoingService,
    required this.ongoingService,
    required this.previousServices,
  });

  OwnershipEntity copyWith({
    String? car,
    bool? isOngoingService,
    String? ongoingService,
    List<String>? previousServices,
  }) {
    return OwnershipEntity(
      car: car ?? this.car,
      isOngoingService: isOngoingService ?? this.isOngoingService,
      ongoingService: ongoingService ?? this.ongoingService,
      previousServices: previousServices ?? this.previousServices,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'car': car,
      'isOngoingService': isOngoingService,
      'ongoingService': ongoingService,
      'previousServices': previousServices,
    };
  }

  OwnershipEntity.empty()
      : this(
            car: "",
            isOngoingService: false,
            ongoingService: "",
            previousServices: []);

  factory OwnershipEntity.fromMap(Map<String, dynamic> map) {
    return OwnershipEntity(
      car: map['car'] ?? '',
      isOngoingService: map['isOngoingService'] ?? false,
      ongoingService: map['ongoingService'] ?? '',
      previousServices: List<String>.from(map['previousServices']),
    );
  }

  String toJson() => json.encode(toMap());

  factory OwnershipEntity.fromJson(String source) =>
      OwnershipEntity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'OwnershipEntity(car: $car, isOngoingService: $isOngoingService, ongoingService: $ongoingService, previousServices: $previousServices)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OwnershipEntity &&
        other.car == car &&
        other.isOngoingService == isOngoingService &&
        other.ongoingService == ongoingService &&
        listEquals(other.previousServices, previousServices);
  }

  @override
  int get hashCode {
    return car.hashCode ^
        isOngoingService.hashCode ^
        ongoingService.hashCode ^
        previousServices.hashCode;
  }
}
