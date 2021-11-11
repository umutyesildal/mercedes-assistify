import 'package:formz/formz.dart';

enum PasswordValidationError { empty, doesNotMatch }

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure() : super.pure('');
  const Password.dirty({String value = ''}) : super.dirty(value);

  @override
  PasswordValidationError? validator(String? value) {
    return value?.isEmpty == false ? null : PasswordValidationError.empty;
  }
}
