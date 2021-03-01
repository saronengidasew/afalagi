import 'package:Afalagi/user/models/models.dart';
import 'package:meta/meta.dart';

import '../user.dart';

class UserRepository {
  final UserDataProvider dataProvider;

  UserRepository({@required this.dataProvider})
      : assert(dataProvider != null);

  Future<User> createUser(User user) async {
        

    return await dataProvider.createUser(user);
  }

  Future<List<User>> getUser() async {
   // print('repo');
    List<User> user = await dataProvider.getUser();
    //print('user');
    return user;
  }

  Future<void> updateUser(User user) async {
    await dataProvider.updateUser(user);
  }

  Future<void> deleteUser(String id) async {
    await dataProvider.deleteUser(id);
  }
}
