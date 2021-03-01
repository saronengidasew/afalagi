import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  // render
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.only(top: 400),
          child: Column(
            children: [
              Text('Home Screen'),
              ElevatedButton(
                child: Text('Log In'),
                onPressed: () {
                  Navigator.popAndPushNamed(context, '/login');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
