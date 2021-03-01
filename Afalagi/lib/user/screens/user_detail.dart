import 'package:Afalagi/user/bloc/bloc.dart';
import 'package:Afalagi/user/models/user.dart';
import 'package:Afalagi/user/screens/user_add_update.dart';
import 'package:Afalagi/user/screens/user_list.dart';
import 'package:Afalagi/user/screens/user_route.dart';
import 'package:Afalagi/user/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../user.dart';

class UserDetail extends StatelessWidget {
  static const routeName = 'UserDetail';
  final User user;

  UserDetail({@required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${this.user.name}'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () => Navigator.of(context).pushNamed(
              AddUpdateUser.routeName,
              arguments: UserArgument(user: this.user, edit: true),
            ),
          ),
          SizedBox(
            width: 32,
          ),
          IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                context.read<UserBloc>().add(UserDelete(this.user));
                Navigator.of(context).pushNamedAndRemoveUntil(
                    UsersList.routeName, (route) => false);
              }),
        ],
      ),
       body: Card(
              elevation: 10,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40), // if you need this
            side: BorderSide(
              color: Colors.grey.withOpacity(0.2),
              width: 1,
            ),
        ),
        child: Center(
            child: Container(
              child: Column(
                children: [
                  
                  Text(user.name ,
                 style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold,fontSize: 20),
                  ),
                  SizedBox(height: 10,),
                  Text("Email"+"---"+user.email),
                  SizedBox(height: 10,),
                  Text("Age"+"  "+user.age.toString()),
                  SizedBox(height: 10,),
                  Text("Height"+"  "+user.height.toString()),
                  SizedBox(height: 10,),
                  Text("Reward"+"  "+user.reward.toString()),
                  SizedBox(height: 10,),
                  Text("Location"+"  "+user.location),
                  SizedBox(height: 10,),
                ],
              ),
              color: Colors.white,
              width: 200,
              height: 200,
            ),
        ),
      ),
      //Card(
      //   child: Column(
      //     children: [
      //       CardView(user: null),
      //       ListTile(
      //         title: Text('Title: ${this.user.name}'),
      //       ),
      //       Text(
      //         'Details',
      //         style: TextStyle(
      //           fontSize: 18,
      //           fontWeight: FontWeight.bold,
      //         ),
      //       ),
      //       SizedBox(
      //         height: 10,
      //       ),
      //       Text(this.user.password == null?'123':this.user.age.toString()),
      //     ],
      //   ),
      // ),
    );
  }
}
