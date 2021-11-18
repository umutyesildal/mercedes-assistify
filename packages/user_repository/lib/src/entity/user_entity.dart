import 'dart:convert';

class UserEntity {
  final String mail;
  final String name;
  final String owner_code;
  final String password;
  final String surname;
  final String phone;
  UserEntity({
    required this.mail,
    required this.name,
    required this.owner_code,
    required this.password,
    required this.surname,
    required this.phone,
  });



  UserEntity copyWith({
    String? mail,
    String? name,
    String? owner_code,
    String? password,
    String? surname,
    String? phone,
  }) {
    return UserEntity(
      mail: mail ?? this.mail,
      name: name ?? this.name,
      owner_code: owner_code ?? this.owner_code,
      password: password ?? this.password,
      surname: surname ?? this.surname,
      phone: phone ?? this.phone,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'mail': mail,
      'name': name,
      'owner_code': owner_code,
      'password': password,
      'surname': surname,
      'phone': phone,
    };
  }

   UserEntity.empty()
      : this(
      mail: "",
      name: "",
      owner_code: "",
      password: "",
      surname: "",
      phone: "",
        );

  factory UserEntity.fromMap(Map<String, dynamic> map) {
    return UserEntity(
      mail: map['mail'],
      name: map['name'],
      owner_code: map['owner_code'],
      password: map['password'],
      surname: map['surname'],
      phone: map['phone'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserEntity.fromJson(String source) => UserEntity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserEntity(mail: $mail, name: $name, owner_code: $owner_code, password: $password, surname: $surname, phone: $phone)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UserEntity &&
      other.mail == mail &&
      other.name == name &&
      other.owner_code == owner_code &&
      other.password == password &&
      other.surname == surname &&
      other.phone == phone;
  }

  @override
  int get hashCode {
    return mail.hashCode ^
      name.hashCode ^
      owner_code.hashCode ^
      password.hashCode ^
      surname.hashCode ^
      phone.hashCode;
  }
}
