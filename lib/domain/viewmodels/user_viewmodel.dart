import 'package:flutter/foundation.dart';
import 'package:flutter_chatting/data/repository/user_repository_impl.dart';
import 'package:flutter_chatting/domain/repositories/user_repository.dart';
import 'package:flutter_chatting/get_it.dart';

class UserViewModel with ChangeNotifier {
  int id;
  String name;
  var userRepository = locator<UserRepositoryImpl>();

  void setName(String name) {
    this.name = name;
    notifyListeners();
  }

  void setId() {
    id = 1;
    notifyListeners();
  }
}
