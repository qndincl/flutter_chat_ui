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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CircleAvatar(
          backgroundImage: AssetImage('assets/hyojun.PNG'),
        ),
        // leading: ImageIcon(
        //   AssetImage('assets/hyojun.PNG'),
        // ),
        title: Text('김효준'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 100, bottom: 10),
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/hyojun.PNG'),

                  // child: Image.asset('assets/hyojun.PNG'),
                  radius: 50,
                ),
              ),
              MyAvatar(
                imageUrl: 'assets/hyojun.PNG',
                tapFunction: () => print("tap"),
                isOnline: false,
              ),
              Text(
                'You',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
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
