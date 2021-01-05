import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class RegEvent extends Equatable {}

class SignUpButtonPressedEvent extends RegEvent {
  String email, passwword;
  SignUpButtonPressedEvent({this.email, this.passwword});

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
