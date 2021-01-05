import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginState extends Equatable {}

class LoginInitialState extends LoginState {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class LoginLoadingState extends LoginState {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class LoginSuccesslState extends LoginState {
  var user;
  LoginSuccesslState({this.user});
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class LoginFailurelState extends LoginState {
  String messagge;
  LoginFailurelState({this.messagge});
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
