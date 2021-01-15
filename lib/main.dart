import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_chatting/domain/viewmodels/chats_viewmodel.dart';
import 'package:flutter_chatting/get_it.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import 'components/my_avatar.dart';
import 'data/repository/user_repository_impl.dart';
import 'domain/viewmodels/user_viewmodel.dart';

void main() async {
  await setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChattingUI',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: ChatPage(),
    );
  }
}

class ChatPage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ChatPage> with TickerProviderStateMixin {
  int _counter = 0;
  // 화면 구성용 상태 위젯. 애니메이션 효과를 위해 TickerProviderStateMixin를 가짐
  // 입력한 메시지를 저장하는 리스트

  final List<String> _message = <String>[];

  // 텍스트필드 제어용 컨트롤러
  final TextEditingController _textController = TextEditingController();

  // 텍스트필드에 입력된 데이터의 존재 여부
  bool _isComposing = false;

  @override
  void initState() {
    super.initState();
  }

  void sendMessage() {
    var chatsViewModel = locator<ChatsViewModel>();
    String content = "test 메시지입니다.";

    chatsViewModel.sendMessage(content);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return ChangeNotifierProvider<ChatsViewModel>(
      create: (_) => locator<ChatsViewModel>(),
      child: Scaffold(
        appBar: AppBar(
          // leading: CircleAvatar(  // 이 위젯을 쓰는 것보다 직접 만들어서 쓰는게 이득
          //   backgroundImage: AssetImage('assets/hyojun.PNG'),
          // ),
          leading: MyAvatar(
            imageUrl: 'assets/hyojun.PNG',
            tapFunction: () => print("tap"),
            isOnline: false,
          ),
          // leading: ImageIcon(
          //   AssetImage('assets/hyojun.PNG'),
          // ),
          title: Text('김효준'),
        ),
        body: SingleChildScrollView(child: Consumer<ChatsViewModel>(
          builder: (_, model, __) {
            print("build");
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                SizedBox(
                  width: size.width,
                  height: 20,
                ),
                ...model.chats
                    .map((e) => RightChat(content: e.content))
                    .toList(),
              ],
            );
          },
        )),
        floatingActionButton: FloatingActionButton(
          onPressed: sendMessage,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}

class LeftChat extends StatelessWidget {
  final String content;
  const LeftChat({
    Key key,
    @required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      // margin - 내 외부와의 거리를 조절. 내 크기는 변하지 않음.
      // padding - 나를 중심으로. 크기도 변하겟지.
      alignment: Alignment.centerLeft,
      child: Container(
        width: 250,
        height: 50,
        margin: const EdgeInsets.only(left: 20, bottom: 20),
        child: Bubble(
          color: Colors.greenAccent,
          nip: BubbleNip.leftBottom,
          child: Text(this.content),
        ),
      ),
    );
  }
}

class RightChat extends StatelessWidget {
  final String content;
  const RightChat({
    Key key,
    @required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        width: 250,
        height: 50,
        margin: const EdgeInsets.only(right: 20, bottom: 20),
        child: Bubble(
          color: Colors.yellow,
          nip: BubbleNip.rightBottom,
          child: Text(this.content),
        ),
      ),
    );
  }
}
