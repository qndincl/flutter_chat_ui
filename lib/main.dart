import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';

import 'components/my_avatar.dart';

void main() {
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

  var data = {
    "hello",
    "hi",
    "asdf",
  };

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
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
      body: SingleChildScrollView(
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              SizedBox(
                width: size.width,
                height: 20,
              ),
              ...data.map((e) => RightChat()).toList(),
              // Padding( // padding연습. 이미지간 간격.
              //   padding: const EdgeInsets.only(top: 100, bottom: 10),
              //   child: CircleAvatar(
              //     backgroundImage: AssetImage('assets/hyojun.PNG'),
              //     // child: Image.asset('assets/hyojun.PNG'),
              //     radius: 50,
              //   ),
              // ),

              // MyAvatar( // 따로 위젯을 추출해서 선언.
              //   imageUrl: 'assets/hyojun.PNG',
              //   tapFunction: () => print("tap"),
              //   isOnline: false,
              // ),

              // Text( //원래 있던거 1
              //   'You',
              // ),
              // Text( //원래 있던거 2
              //   '$_counter',
              //   style: Theme.of(context).textTheme.headline4,
              // ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class LeftChat extends StatelessWidget {
  const LeftChat({
    Key key,
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
          child: Text("2222222222222222222222222222222"),
        ),
      ),
    );
  }
}

class RightChat extends StatelessWidget {
  const RightChat({
    Key key,
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
          child: Text("testasdfasdfasdfsadfsadfasdf"),
        ),
      ),
    );
  }
}
