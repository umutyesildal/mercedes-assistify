import 'dart:convert';

class CarEntity {
  const CarEntity({
    required this.id,
    required this.created,
    required this.updated,
    required this.name,
  });

  final String id;
  final String created;
  final String updated;
  final String name;

  @override
  List<Object> get props {
    return [
      id,
      created,
      updated,
      name,
    ];
  }

  static CarEntity? fromMap(Map<String, dynamic>? map) {
    if (map == null) return null;

    return CarEntity(
      id: map['id'] ?? '',
      created: map['created'] ?? '',
      updated: map['updated'] ?? '',
      name: map['name'] ?? '',
    );
  }

  static CarEntity? fromJson(String source) =>
      CarEntity.fromMap(json.decode(source));

  const CarEntity.empty()
      : this(
          id: '',
          created: '',
          updated: '',
          name: '',
        );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'created': created,
      'updated': updated,
      'name': name,
    };
  }

  String toJson() => json.encode(toMap());

  CarEntity copyWith({
    String? id,
    String? created,
    String? updated,
    String? name,
  }) {
    return CarEntity(
      id: id ?? this.id,
      created: created ?? this.created,
      updated: updated ?? this.updated,
      name: name ?? this.name,
    );
  }
}
