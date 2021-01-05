import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class RegState extends Equatable {}

class RegInitialState extends RegState {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class LoadingState extends RegState {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class RegSuccuessful extends RegState {
  User user;
  RegSuccuessful({this.user});

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class RegFailure extends RegState {
  String message;
  RegFailure({this.message});
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
