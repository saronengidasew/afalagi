import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../user.dart';
class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc({@required this.userRepository})
      : assert(userRepository != null),
        super(UserLoading());
  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is UserLoad) {
      yield UserLoading();
      try {
         print('users');

        final users = await userRepository.getUser();
        print(users);
        yield UserLoadSuccess(users);
      } catch (_) {
        print('its err');
        yield UserOperationFailure();
      }
    }
    if (event is UserCreate) {
      try {
        await userRepository.createUser(event.user);
        final user = await userRepository.getUser();
        yield UserLoadSuccess(user);
      } catch (_) {
        yield UserOperationFailure();
      }
    }
    if (event is UserUpdate) {
      try {
        await userRepository.updateUser(event.user);
        final user = await userRepository.getUser();
        yield UserLoadSuccess(user);
      } catch (_) {
        yield UserOperationFailure();
      }
    }

    if (event is UserDelete) {
      try {
        await userRepository.deleteUser(event.user.id);
        final user = await userRepository.getUser();
        yield UserLoadSuccess(user);
      } catch (_) {
        yield UserOperationFailure();
      }
    }
  }
}
