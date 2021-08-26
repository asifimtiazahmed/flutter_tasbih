import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {}

class LoginEmailChange extends LoginEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [email];

  final String email;
  LoginEmailChange({required this.email});
}

class LoginPasswordChange extends LoginEvent {
  @override
// TODO: implement props
  List<Object?> get props => [password];

  final String password;
  LoginPasswordChange({required this.password});
}

class LoginCredentialsPressed extends LoginEvent {
  @override
// TODO: implement props
  List<Object?> get props => [password, email];
  final String email;
  final String password;
  LoginCredentialsPressed({required this.password, required this.email});
}
