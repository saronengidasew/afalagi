import 'dart:convert';
import 'package:Afalagi/user/models/user.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

class UserDataProvider {
  final _baseUrl = 'http://10.0.2.2:4000';
  final http.Client httpClient;

  UserDataProvider({@required this.httpClient}) : assert(httpClient != null);

  Future<User> createUser(User user) async {
    final response = await httpClient.post(
      '$_baseUrl/user/create',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'username': user.name,
        'password': user.password,
        'email': user.email,
        'age': user.age,
        'location': user.location,
        'height': user.height,
        'reward': user.reward,
      }),
    );
    //print(response.body);
    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create course.');
    }
  }

  Future<List<User>> getUser() async {
    // print('object');
    final response = await httpClient.get('$_baseUrl/user');
    //print(response);
    //print("hello");
    if (response.statusCode == 200) {
      Map<String, dynamic> users = jsonDecode(response.body);
      final usr = users['data'] as List;
     // print(usr);
      return usr.map((user) => User.fromJson(user)).toList();
    } else {
     // print('error');
      throw Exception('Failed to load courses');
    }
  }

  Future<void> deleteUser(String id) async {
    // print(name);
    final http.Response response = await httpClient.delete(
      '$_baseUrl/user/delete/$id',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
// print(response.statusCode);
    if (response.statusCode != 200) {
      throw Exception('Failed to delete User.');
    }
  }

  Future<void> updateUser(User user) async {
    // print(user.name);
    final http.Response response = await httpClient.patch(
      '$_baseUrl/user/update/${user.id}',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        //'id': user.id,
        'username': user.name,
        'password': user.password,
        'email': user.email,
        'age': user.age,
        'location': user.location,
        'reward': user.reward,
        'height': user.height,
      }),
    );
    print(response.statusCode);
    if (response.statusCode != 200) {
      throw Exception('Failed to update course.');
    }
  }
}
