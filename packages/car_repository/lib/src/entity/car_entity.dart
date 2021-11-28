import 'dart:convert';

class CarEntity {
  final String beygir;
  final String depo;
  final String max_hiz;
  final String motor;
  final String silindir;
  final String yakit;
  final String model;
  CarEntity({
    required this.beygir,
    required this.depo,
    required this.max_hiz,
    required this.motor,
    required this.silindir,
    required this.yakit,
    required this.model,
  });

  CarEntity copyWith({
    String? beygir,
    String? depo,
    String? max_hiz,
    String? motor,
    String? silindir,
    String? yakit,
    String? model,
  }) {
    return CarEntity(
      beygir: beygir ?? this.beygir,
      depo: depo ?? this.depo,
      max_hiz: max_hiz ?? this.max_hiz,
      motor: motor ?? this.motor,
      silindir: silindir ?? this.silindir,
      yakit: yakit ?? this.yakit,
      model: model ?? this.model,
    );
  }

  CarEntity.empty()
      : this(
          beygir: "",
          depo: "",
          max_hiz: "",
          motor: "",
          silindir: "",
          yakit: "",
          model: "",
        );

  Map<String, dynamic> toMap() {
    return {
      'beygir': beygir,
      'depo': depo,
      'max_hiz': max_hiz,
      'motor': motor,
      'silindir': silindir,
      'yakit': yakit,
      'model': model,
    };
  }

  factory CarEntity.fromMap(Map<String, dynamic> map) {
    return CarEntity(
      beygir: map['beygir'],
      depo: map['depo'],
      max_hiz: map['max_hiz'],
      motor: map['motor'],
      silindir: map['silindir'],
      yakit: map['yakit'],
      model: map['model'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CarEntity.fromJson(String source) =>
      CarEntity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CarEntity(beygir: $beygir, depo: $depo, max_hiz: $max_hiz, motor: $motor, silindir: $silindir, yakit: $yakit, model: $model)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CarEntity &&
        other.beygir == beygir &&
        other.depo == depo &&
        other.max_hiz == max_hiz &&
        other.motor == motor &&
        other.silindir == silindir &&
        other.yakit == yakit &&
        other.model == model;
  }

  @override
  int get hashCode {
    return beygir.hashCode ^
        depo.hashCode ^
        max_hiz.hashCode ^
        motor.hashCode ^
        silindir.hashCode ^
        yakit.hashCode ^
        model.hashCode;
  }
}
