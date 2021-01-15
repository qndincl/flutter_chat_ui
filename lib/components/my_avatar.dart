import 'package:flutter/material.dart';

class MyAvatar extends StatelessWidget {
  final imageUrl;
  final Function tapFunction;
  final bool isOnline;

  const MyAvatar(
      {Key key,
      @required this.imageUrl,
      @required this.tapFunction,
      @required this.isOnline})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tapFunction,
      child: Container(
        width: 100,
        height: 100,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(this.imageUrl), fit: BoxFit.cover),
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: this.isOnline ? Colors.green : Colors.grey,
                spreadRadius: 3),
          ],
        ),
        // child: Image.asset('assets/hyojun.PNG'),
      ),
    );
  }
}
