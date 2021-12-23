import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:flutter/foundation.dart';

part 'user_entity.g.dart';

@HiveType(typeId: 0)
class UserEntity {
  @HiveField(0)
  final String mail;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final List<String> ownership;
  @HiveField(3)
  final String password;
  UserEntity({
    required this.mail,
    required this.name,
    required this.ownership,
    required this.password,
  });

  UserEntity copyWith({
    String? mail,
    String? name,
    List<String>? ownership,
    String? password,
  }) {
    return UserEntity(
      mail: mail ?? this.mail,
      name: name ?? this.name,
      ownership: ownership ?? this.ownership,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'mail': mail,
      'name': name,
      'ownership': ownership,
      'password': password,
    };
  }

  UserEntity.empty()
      : this(
          mail: "",
          name: "",
          ownership: [''],
          password: "",
        );

  factory UserEntity.fromMap(Map<String, dynamic> map) {
    return UserEntity(
      mail: map['mail'] ?? '',
      name: map['name'] ?? '',
      ownership: List<String>.from(map['ownership']),
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserEntity.fromJson(String source) =>
      UserEntity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserEntity(mail: $mail, name: $name, ownership: $ownership, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserEntity &&
        other.mail == mail &&
        other.name == name &&
        listEquals(other.ownership, ownership) &&
        other.password == password;
  }

  @override
  int get hashCode {
    return mail.hashCode ^
        name.hashCode ^
        ownership.hashCode ^
        password.hashCode;
  }
}
