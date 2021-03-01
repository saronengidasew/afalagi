import 'package:Afalagi/user/models/models.dart';
import 'package:Afalagi/user/screens/screens.dart';
import 'package:flutter/material.dart';

import 'home_registered_detail.dart';
import 'home_user_detail.dart';

class HomeRegisteredCardView extends StatelessWidget {
  User user ;
  HomeRegisteredCardView({@required this.user});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(RegisteredUserDetail.routeName,arguments: user),
          child: Center(
            child: Card(
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(user.name 
                  ,style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold,fontSize: 20),
                  ),
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
          ),
    );
  }
}
