import 'dart:convert';

class CarEntity {
  final String horsepower;
  final String tank;
  final String maxSpeed;
  final String engine;
  final String cylinder;
  final String fuel;
  final String model;
  CarEntity({
    required this.horsepower,
    required this.tank,
    required this.maxSpeed,
    required this.engine,
    required this.cylinder,
    required this.fuel,
    required this.model,
  });

  CarEntity copyWith({
    String? horsepower,
    String? tank,
    String? maxSpeed,
    String? engine,
    String? cylinder,
    String? fuel,
    String? model,
  }) {
    return CarEntity(
      horsepower: horsepower ?? this.horsepower,
      tank: tank ?? this.tank,
      maxSpeed: maxSpeed ?? this.maxSpeed,
      engine: engine ?? this.engine,
      cylinder: cylinder ?? this.cylinder,
      fuel: fuel ?? this.fuel,
      model: model ?? this.model,
    );
  }

  CarEntity.empty()
      : this(
          horsepower: "",
          tank: "",
          maxSpeed: "",
          engine: "",
          cylinder: "",
          fuel: "",
          model: "",
        );

  Map<String, dynamic> toMap() {
    return {
      'horsepower': horsepower,
      'tank': tank,
      'maxSpeed': maxSpeed,
      'engine': engine,
      'cylinder': cylinder,
      'fuel': fuel,
      'model': model,
    };
  }

  factory CarEntity.fromMap(Map<String, dynamic> map) {
    return CarEntity(
      horsepower: map['horsepower'] ?? '',
      tank: map['tank'] ?? '',
      maxSpeed: map['maxSpeed'] ?? '',
      engine: map['engine'] ?? '',
      cylinder: map['cylinder'] ?? '',
      fuel: map['fuel'] ?? '',
      model: map['model'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CarEntity.fromJson(String source) =>
      CarEntity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CarEntity(horsepower: $horsepower, tank: $tank, maxSpeed: $maxSpeed, engine: $engine, cylinder: $cylinder, fuel: $fuel, model: $model)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CarEntity &&
        other.horsepower == horsepower &&
        other.tank == tank &&
        other.maxSpeed == maxSpeed &&
        other.engine == engine &&
        other.cylinder == cylinder &&
        other.fuel == fuel &&
        other.model == model;
  }

  @override
  int get hashCode {
    return horsepower.hashCode ^
        tank.hashCode ^
        maxSpeed.hashCode ^
        engine.hashCode ^
        cylinder.hashCode ^
        fuel.hashCode ^
        model.hashCode;
  }
}
