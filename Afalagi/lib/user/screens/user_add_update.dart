import 'package:Afalagi/user/bloc/user_bloc.dart';
import 'package:Afalagi/user/bloc/user_event.dart';
import 'package:Afalagi/user/models/user.dart';
import 'package:Afalagi/user/screens/user_list.dart';
import 'package:Afalagi/user/screens/user_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_registered.dart';

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
                  initialValue: widget.args.edit ? widget.args.user.name : '',
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter UserName';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'Username'),
                  onSaved: (value) {
                    setState(() {
                      this.user["username"] = value;
                    });
                  }),
              TextFormField(
                  initialValue: widget.args.edit ? widget.args.user.email : '',
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter Email';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'Email'),
                  onSaved: (value) {
                    this.user["email"] = value;
                  }),
              TextFormField(
                  initialValue: widget.args.edit ? widget.args.user.password : '',
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter Password';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'Password'),
                  onSaved: (value) {
                    setState(() {
                      this.user["password"] = value;
                    });
                  }),
              TextFormField(
                  initialValue: widget.args.edit ? widget.args.user.age.toString() : '',
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter User Age';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'User Age'),
                  onSaved: (value) {
                    setState(() {
                      this.user["age"] = int.parse(value);
                    });
                  }),
              TextFormField(
                  initialValue: widget.args.edit ? widget.args.user.reward.toString() : '',
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter User Reward';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'Reward'),
                  onSaved: (value) {
                    setState(() {
                      this.user["reward"] = int.parse(value);
                    });
                  }),
              TextFormField(
                  initialValue: widget.args.edit ? widget.args.user.location : '',
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter User Location';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'Location'),
                  onSaved: (value) {
                    setState(() {
                      this.user["location"] = value;
                    });
                  }),
                  TextFormField(
                  initialValue: widget.args.edit ? widget.args.user.height.toString() : '',
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter User Height';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'Height'),
                  onSaved: (value) {
                    setState(() {
                      this.user["height"] = int.parse(value);
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
                                name: this.user["username"],
                                email: this.user["email"],
                                password: this.user["password"],                                
                                location: this.user["location"],
                                reward: this.user["reward"],
                                height: this.user["height"],
                                
                              ),
                            )
                          : UserCreate(
                              User(
                                age: this.user["age"],
                                name: this.user["username"],
                                email: this.user["email"],
                                password: this.user["password"],
                                location: this.user["location"],
                                reward: this.user["reward"],
                                height: this.user["height"],
                              ),
                            );
                      BlocProvider.of<UserBloc>(context).add(event);
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          MyRegisteredHomePage.routeName, (route) => false);
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
