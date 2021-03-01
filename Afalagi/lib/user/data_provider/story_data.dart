import 'dart:convert';
import 'package:Afalagi/user/models/story.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

class StoryDataProvider {
  final _baseUrl = 'http://10.0.2.2:4000';
  final http.Client httpClient;

  StoryDataProvider({@required this.httpClient}) : assert(httpClient != null);

  Future<Story> createStory(Story story) async {
    final response = await httpClient.post(
      '$_baseUrl/Story/create',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'Storyname': story.name,
        'password': story.password,
        'email': story.email,
        'age': story.age,
        'location': story.location,
        'height': story.height,
        'reward': story.reward,
      }),
    );
    //print(response.body);
    if (response.statusCode == 200) {
      return Story.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create course.');
    }
  }

  Future<List<Story>> getStory() async {
    // print('object');
    final response = await httpClient.get('$_baseUrl/Story');
    //print(response);
    //print("hello");
    if (response.statusCode == 200) {
      Map<String, dynamic> storys = jsonDecode(response.body);
      final usr = storys['data'] as List;
     // print(usr);
      return usr.map((story) => Story.fromJson(story)).toList();
    } else {
     // print('error');
      throw Exception('Failed to load courses');
    }
  }

  Future<void> deleteStory(String id) async {
    // print(name);
    final http.Response response = await httpClient.delete(
      '$_baseUrl/Story/delete/$id',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
// print(response.statusCode);
    if (response.statusCode != 200) {
      throw Exception('Failed to delete Story.');
    }
  }

  Future<void> updateStory(Story Story) async {
    // print(Story.name);
    final http.Response response = await httpClient.patch(
      '$_baseUrl/Story/update/${Story.id}',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        //'id': Story.id,
        'Storyname': Story.name,
        'password': Story.password,
        'email': Story.email,
        'age': Story.age,
        'location': Story.location,
        'reward': Story.reward,
        'height': Story.height,
      }),
    );
    print(response.statusCode);
    if (response.statusCode != 200) {
      throw Exception('Failed to update course.');
    }
  }
}
