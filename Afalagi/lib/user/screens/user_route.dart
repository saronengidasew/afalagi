import 'package:Afalagi/user/models/user.dart';
import 'package:Afalagi/user/screens/home.dart';
import 'package:Afalagi/user/screens/user_add_update.dart';
import 'package:Afalagi/user/screens/user_detail.dart';
import 'package:Afalagi/user/screens/user_list.dart';
import 'package:flutter/material.dart';

import 'home_registered.dart';
import 'home_registered_detail.dart';
import 'home_user_detail.dart';

class UserAppRoute {
  static Route generateRoute(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(builder: (context) => MyRegisteredHomePage());
    }

    if (settings.name == AddUpdateUser.routeName) {
      UserArgument args = settings.arguments;
      return MaterialPageRoute(
          builder: (context) => AddUpdateUser(
                args: args,
              ));
    }

    if (settings.name == UserDetail.routeName) {
      User user = settings.arguments;
      return MaterialPageRoute(
          builder: (context) => UserDetail(
                user: user,
              ));
    }
    if (settings.name == HomeUserDetail.routeName) {
      User user = settings.arguments;
      return MaterialPageRoute(
          builder: (context) => HomeUserDetail(
                user: user,
              ));
    }
    if (settings.name == RegisteredUserDetail.routeName) {
      User user = settings.arguments;
      return MaterialPageRoute(
          builder: (context) => RegisteredUserDetail(
                user: user,
              ));
    }

    return MaterialPageRoute(builder: (context) => UsersList());
  }
}
class UserArgument {
  final User user;
  final bool edit;
  UserArgument({this.user, this.edit});
}


