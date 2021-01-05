import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mgosme/repossitories/user_repository.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  UserRepository userRepository;
  LoginBloc(LoginState initialState, UserRepository _userRepository)
      : userRepository = _userRepository,
        super(initialState);

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressedEvent) {
      try {
        yield LoginLoadingState();
        var user = userRepository.signInUser(event.email, event.password);
        yield LoginSuccesslState(user: user);
      } catch (e) {
        yield LoginFailurelState(messagge: e.toString());
      }
    }
  }
}
