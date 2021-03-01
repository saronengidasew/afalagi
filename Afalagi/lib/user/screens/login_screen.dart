import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  // single approch way
  // final bloc = new FormBloc();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.only(top: 100.0, left: 50.0, right: 50.0),
          height: 550.0,
          child: Form(
            child: Column(
              children: <Widget>[
                _emailField(),
                _passwordField(),
                Container(
                  width: 300,
                  height: 35,
                ),
                //_checkBox(),
                _buttonField(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // GestureDetector(
                    //   onTap: () =>
                    //       Navigator.pushNamed(context, '/forgot_password'),
                    //   child: Container(
                    //     child: Text('Forgot password?'),
                    //     alignment: Alignment.bottomLeft,
                    //   ),
                    // ),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, '/signup'),
                      child: Container(
                        child: Text('Sign up'),
                        padding: EdgeInsets.only(left: 250),
                        //alignment: Alignment.bottomCenter,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _emailField() {
          return TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'you@example.com',
              labelText: 'Email',
              //errorText: snapshot.error,
            ),
            //onChanged: bloc.changeEmail,
          );
        }
  }

  Widget _passwordField() {
          return TextField(
            obscureText: true,
            //onChanged: bloc.changePassword,
            maxLength: 20,
            decoration: InputDecoration(
              hintText: '',
              labelText: 'Password',
              //errorText: snapshot.error,
            ),
          );
}

  // Widget _checkBox() {
  //   return Row(
  //     children: <Widget>[
  //       Checkbox(
  //         onChanged: (checked) => {},
  //         value: true,
  //       ),
  //       Text('keep me logged in'),
  //     ],
  //   );
  // }

  Widget _buttonField() {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              onPressed: () {},
              child: const Icon(Icons.arrow_forward),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed))
                            return Color.fromARGB(255, 246, 247, 233);
                          return null;
                        }
                        ))
            //   color: Colors.amber,
            //   clipBehavior: Clip.hardEdge,
            //   elevation: 10,
            //   disabledColor: Colors.blueGrey,
            //   disabledElevation: 10,
            //   disabledTextColor: Colors.white,
            ),
          );
}

