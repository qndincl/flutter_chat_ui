import 'package:flutter_chatting/data/model/user.dart';
import 'package:flutter_chatting/domain/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepositry {
  @override
  Future<int> getUserId() {
    // 가짜 유저 생산
    var user = User(id: 1, name: "김효준");

    return Future.value(user.id);
  }

  @override
  Future<String> getUserName() {
    // 가짜 유저 생산
    var user = User(id: 1, name: "김효준");

    return Future.value(user.name);
  }
}
