import 'package:flutter_chatting/data/repository/user_repository_impl.dart';
import 'package:flutter_chatting/domain/viewmodels/chats_viewmodel.dart';
import 'package:flutter_chatting/domain/viewmodels/user_viewmodel.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton<UserRepositoryImpl>(UserRepositoryImpl());
  locator.registerSingleton<UserViewModel>(UserViewModel());
  locator.registerSingleton<ChatsViewModel>(ChatsViewModel());
}
