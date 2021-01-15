import 'package:flutter/foundation.dart';
import 'package:flutter_chatting/data/model/chats.dart';
import 'package:flutter_chatting/data/repository/user_repository_impl.dart';

class ChatsViewModel with ChangeNotifier {
  List<Chats> chats = [Chats(content: "test1", userId: 1)];
  var userRepositoryImpl = UserRepositoryImpl();

  void sendMessage(String content) {
    print("sendMessage");
    chats.add(Chats(content: content, userId: 1));
    notifyListeners();
  }
}
