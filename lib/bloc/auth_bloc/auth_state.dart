import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

abstract class AuthState extends Equatable{

}

class AuthInitialState extends AuthState  {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}
// ignore: must_be_immutable
class AuthenticatedState extends AuthState{
  User user;
  AuthenticatedState({@required this.user});


  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}

class UnAuthenticatedState extends AuthState{
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}