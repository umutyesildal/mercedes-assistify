import 'dart:convert';

class UserEntity {
  final String mail;
  final String name;
  final String ownership;
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
    String? ownership,
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
          ownership: "",
          password: "",
        );

  factory UserEntity.fromMap(Map<String, dynamic> map) {
    return UserEntity(
      mail: map['mail'] ?? '',
      name: map['name'] ?? '',
      ownership: map['ownership'] ?? '',
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
        other.ownership == ownership &&
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
