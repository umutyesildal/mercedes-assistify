import 'dart:convert';

class CarEntity {
  final String horsepower;
  final String tank;
  final String maxSpeed;
  final String engine;
  final String cylinder;
  final String fuel;
  final String model;
  final String remainingFuel;
  final String kilometer;
  final String averageConsumption;
  final String weeklyKilometer;

  CarEntity({
    required this.horsepower,
    required this.tank,
    required this.maxSpeed,
    required this.engine,
    required this.cylinder,
    required this.fuel,
    required this.model,
    required this.remainingFuel,
    required this.kilometer,
    required this.averageConsumption,
    required this.weeklyKilometer,
  });

  CarEntity copyWith({
    String? horsepower,
    String? tank,
    String? maxSpeed,
    String? engine,
    String? cylinder,
    String? fuel,
    String? model,
    String? remainingFuel,
    String? kilometer,
    String? averageConsumption,
    String? weeklyKilometer,
  }) {
    return CarEntity(
      horsepower: horsepower ?? this.horsepower,
      tank: tank ?? this.tank,
      maxSpeed: maxSpeed ?? this.maxSpeed,
      engine: engine ?? this.engine,
      cylinder: cylinder ?? this.cylinder,
      fuel: fuel ?? this.fuel,
      model: model ?? this.model,
      remainingFuel: remainingFuel ?? this.remainingFuel,
      kilometer: kilometer ?? this.kilometer,
      averageConsumption: averageConsumption ?? this.averageConsumption,
      weeklyKilometer: weeklyKilometer ?? this.weeklyKilometer,
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
          remainingFuel: "",
          kilometer: "",
          averageConsumption: "",
          weeklyKilometer: "",
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
      'remainingFuel': remainingFuel,
      'kilometer': kilometer,
      'averageConsumption': averageConsumption,
      'weeklyKilometer': weeklyKilometer,
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
      remainingFuel: map['remainingFuel'] ?? '',
      kilometer: map['kilometer'] ?? '',
      averageConsumption: map['averageConsumption'] ?? '',
      weeklyKilometer: map['weeklyKilometer'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CarEntity.fromJson(String source) =>
      CarEntity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CarEntity(horsepower: $horsepower, tank: $tank, maxSpeed: $maxSpeed, engine: $engine, cylinder: $cylinder, fuel: $fuel, model: $model, remainingFuel: $remainingFuel, kilometer: $kilometer, averageConsumption: $averageConsumption, weeklyKilometer: $weeklyKilometer)';
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
        other.model == model &&
        other.remainingFuel == remainingFuel &&
        other.kilometer == kilometer &&
        other.averageConsumption == averageConsumption &&
        other.weeklyKilometer == weeklyKilometer;
  }

  @override
  int get hashCode {
    return horsepower.hashCode ^
        tank.hashCode ^
        maxSpeed.hashCode ^
        engine.hashCode ^
        cylinder.hashCode ^
        fuel.hashCode ^
        model.hashCode ^
        remainingFuel.hashCode ^
        kilometer.hashCode ^
        averageConsumption.hashCode ^
        weeklyKilometer.hashCode;
  }
}
