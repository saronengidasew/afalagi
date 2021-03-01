import 'package:Afalagi/bloc_observer.dart';
import 'package:Afalagi/user/bloc/user_bloc.dart';
import 'package:Afalagi/user/bloc/user_event.dart';
import 'package:Afalagi/user/data_provider/user_data.dart';
import 'package:Afalagi/user/repository/user_repository.dart';
import 'package:Afalagi/user/screens/user_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

void main() {
  Bloc.observer = SimpleBlocObserver();
  final UserRepository userRepository = UserRepository(
    dataProvider: UserDataProvider(
      httpClient: http.Client(),
    ),
  );

  runApp(
    UserApp(userRepository: userRepository),
  );
}

class UserApp extends StatelessWidget {
  final UserRepository userRepository;

 UserApp({@required this.userRepository})
      : assert(userRepository != null);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: this.userRepository,
      child: BlocProvider(
        
        create: (context) => UserBloc(userRepository: this.userRepository)
          ..add(UserLoad()),
        child: MaterialApp(
          title: 'User App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          onGenerateRoute: UserAppRoute.generateRoute,
        ),
      ),
    );
  }
}
