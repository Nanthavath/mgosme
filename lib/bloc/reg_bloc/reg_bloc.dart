import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mgosme/bloc/reg_bloc/reg_event.dart';
import 'package:mgosme/bloc/reg_bloc/reg_state.dart';
import 'package:mgosme/repossitories/user_repository.dart';

class RegBloc extends Bloc<RegEvent, RegState> {
  UserRepository userRepository;
  RegBloc(RegState initialState, UserRepository _userRepository)
      : userRepository = _userRepository,
        super(initialState);

  @override
  Stream<RegState> mapEventToState(RegEvent event) async* {
    if (event is SignUpButtonPressedEvent) {
      try {
        yield LoadingState();
        var user =
            await userRepository.createUser(event.email, event.passwword);
        yield RegSuccuessful(user: user);
      } catch (e) {
        yield RegFailure(message: e.toString());
      }
    }
  }
}
