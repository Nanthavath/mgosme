import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mgosme/repossitories/user_repository.dart';

import 'auth_even.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  UserRepository userRepository;

  AuthBloc(AuthState initialState) : super(initialState) {
    this.userRepository = UserRepository();
  }

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is AppStartedEvent) {
      try {
        var isSignedIn = await userRepository.isSignedIn();
        if (isSignedIn) {
          var user = await userRepository.getCurrentUser();
          yield AuthenticatedState(user: user);
        } else {
          yield UnAuthenticatedState();
        }
      } catch (e) {
        yield UnAuthenticatedState();
      }
    }
  }
}
