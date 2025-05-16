import 'package:form_field_validator/form_field_validator.dart';

final passwordValidator = MultiValidator([
  RequiredValidator(errorText: 'password is required'),
  MinLengthValidator(8, errorText: 'password must be 8 degite long'),
  PatternValidator(
    r'^(?=.*[a-z])',
    errorText: 'passwords must have at least one small character',
  ),
  PatternValidator(
    r'^(?=.*[A-Z])',
    errorText: 'passwords must have at least one capital character',
  ),
  PatternValidator(
    r'(?=.*?[#?!@$%^&*-])',
    errorText: 'passwords must have at least one special character',
  ),
]);

final emailValidator = MultiValidator([
  RequiredValidator(errorText: 'email is required'),
  PatternValidator(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    errorText: 'please enter valide email',
  ),
]);
