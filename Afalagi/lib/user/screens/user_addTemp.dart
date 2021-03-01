import 'package:Afalagi/user/bloc/user_bloc.dart';
import 'package:Afalagi/user/bloc/user_event.dart';
import 'package:Afalagi/user/models/user.dart';
import 'package:Afalagi/user/screens/user_list.dart';
import 'package:Afalagi/user/screens/user_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddUpdateUser extends StatefulWidget {
  static const routeName = 'UserAddUpdate';
  final UserArgument args;

  AddUpdateUser({this.args});
  @override
  _AddUpdateUserState createState() => _AddUpdateUserState();
}

class _AddUpdateUserState extends State<AddUpdateUser> {
  final _formKey = GlobalKey<FormState>();

  final Map<String, dynamic> user = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.args.edit ? "Edit User" : "Add New User"}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                  initialValue: widget.args.edit ? widget.args.user.age : '',
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter User age';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'User Name'),
                  onSaved: (value) {
                    setState(() {
                      this.user["age"] = value;
                    });
                  }),
              TextFormField(
                  initialValue:
                      widget.args.edit ? widget.args.user.name : '',
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter User name';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'User Email'),
                  onSaved: (value) {
                    this.user["name"] = value;
                  }),
                       TextFormField(
                  initialValue:
                      widget.args.edit ? widget.args.user.email : '',
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter User country';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'User country'),
                  onSaved: (value) {
                    setState(() {
                      this.user["country"] = value;
                    });
                  }),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    final form = _formKey.currentState;
                    if (form.validate()) {
                      form.save();
                      print(widget.args.user);
                      final UserEvent event = widget.args.edit
                          ? UserUpdate(
                              User(
                                id: widget.args.user.id,
                                age: this.user["age"],
                                name: this.user["name"],
                                email: this.user["email"], password: this.user["password"],
                              ),
                            )
                          : UserCreate(
                              User(
                                age: this.user["age"],
                                name: this.user["name"],
                                email: this.user["email"], password: "so",
                              ),
                            );
                      BlocProvider.of<UserBloc>(context).add(event);
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          UsersList.routeName, (route) => false);
                    }
                  },
                  label: Text('SAVE'),
                  icon: Icon(Icons.save),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
