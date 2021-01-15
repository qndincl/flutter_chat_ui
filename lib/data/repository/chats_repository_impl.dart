import 'package:flutter_chatting/domain/repositories/chats_repository.dart';

class ChatsRepositoryImpl extends ChatsRepositry {
  @override
  Future<String> getContent() {
    return Future.value("test Content");
  }

  @override
  Future<int> getUserId() {
    return Future.value(1);
  }
}
