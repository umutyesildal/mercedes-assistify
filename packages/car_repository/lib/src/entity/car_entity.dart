import 'dart:convert';

class CarEntity {
  final String horsepower;
  final String tank;
  final String maxSpeed;
  final String engine;
  final String cylinder;
  final String fuel;
  final String model;
  String kilometer;
  String weeklyKilometer;
  final String averageConsumption;
  String remainingFuel;
  final String docID;

  CarEntity({
    required this.horsepower,
    required this.tank,
    required this.maxSpeed,
    required this.engine,
    required this.cylinder,
    required this.fuel,
    required this.model,
    required this.kilometer,
    required this.weeklyKilometer,
    required this.averageConsumption,
    required this.remainingFuel,
    required this.docID,
  });

  CarEntity copyWith({
    String? horsepower,
    String? tank,
    String? maxSpeed,
    String? engine,
    String? cylinder,
    String? fuel,
    String? model,
    String? kilometer,
    String? weeklyKilometer,
    String? averageConsumption,
    String? remainingFuel,
    String? docID,
  }) {
    return CarEntity(
      horsepower: horsepower ?? this.horsepower,
      tank: tank ?? this.tank,
      maxSpeed: maxSpeed ?? this.maxSpeed,
      engine: engine ?? this.engine,
      cylinder: cylinder ?? this.cylinder,
      fuel: fuel ?? this.fuel,
      model: model ?? this.model,
      kilometer: kilometer ?? this.kilometer,
      weeklyKilometer: weeklyKilometer ?? this.weeklyKilometer,
      averageConsumption: averageConsumption ?? this.averageConsumption,
      remainingFuel: remainingFuel ?? this.remainingFuel,
      docID: docID ?? this.docID,
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
          kilometer: "",
          weeklyKilometer: "",
          averageConsumption: "",
          remainingFuel: "",
          docID: "",
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
      'kilometer': kilometer,
      'weeklyKilometer': weeklyKilometer,
      'averageConsumption': averageConsumption,
      'remainingFuel': remainingFuel,
      'docID': docID,
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
      kilometer: map['kilometer'] ?? '',
      weeklyKilometer: map['weeklyKilometer'] ?? '',
      averageConsumption: map['averageConsumption'] ?? '',
      remainingFuel: map['remainingFuel'] ?? '',
      docID: map['docID'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CarEntity.fromJson(String source) =>
      CarEntity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CarEntity(horsepower: $horsepower, tank: $tank, maxSpeed: $maxSpeed, engine: $engine, cylinder: $cylinder, fuel: $fuel, model: $model, kilometer: $kilometer, weeklyKilometer: $weeklyKilometer, averageConsumption: $averageConsumption, remainingFuel: $remainingFuel, docID: $docID)';
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
        other.kilometer == kilometer &&
        other.weeklyKilometer == weeklyKilometer &&
        other.averageConsumption == averageConsumption &&
        other.remainingFuel == remainingFuel  &&
        other.docID == docID;
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
        kilometer.hashCode ^
        weeklyKilometer.hashCode ^
        averageConsumption.hashCode ^
        remainingFuel.hashCode ^
        docID.hashCode;
  }
}
