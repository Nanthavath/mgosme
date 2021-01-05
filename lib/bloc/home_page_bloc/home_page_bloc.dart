import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mgosme/repossitories/user_repository.dart';

import 'home_page_event.dart';
import 'home_page_state.dart';

class HomePage extends Bloc<HomePageEvent, HomePageState> {
  UserRepository userRepository;
  HomePage(HomePageState initialState, UserRepository _userRepository)
      : userRepository = _userRepository,
        super(initialState);

  @override
  Stream<HomePageState> mapEventToState(HomePageEvent event)async* {
    if(event is LogOutButtonPressdEvent){
      await userRepository.signOut();
      yield LogOutSuccess();
    }
  }
}
