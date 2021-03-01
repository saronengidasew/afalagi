// import 'package:Afalagi/user/bloc/user_bloc.dart';
import 'package:Afalagi/user/screens/home_user_list_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../user.dart';
class HomeUsersList extends StatelessWidget {
  static const routeName = '/userlist';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Stories'),
        
      // ),
      body:
           BlocBuilder<UserBloc, UserState>(
        builder: (_, state) {
          if (state is UserOperationFailure) {
            return Text('Could not do User operation');
          }
          if (state is UserLoadSuccess) {
            final users = state.users;
            //print(users);
            return 
            ListView.builder(
              itemCount: users.length,
              itemBuilder: (_, idx) => HomeCardView(user: users[idx])
                          );
            
          }
                    return CircularProgressIndicator();
        },
      ),
          );
  }
}
