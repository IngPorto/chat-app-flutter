import 'package:flutter/material.dart';

const String urlImage =
    'https://images.pexels.com/photos/18129003/pexels-photo-18129003/free-photo-of-hombre-retrato-sonriente-mayor.jpeg?auto=compress&cs=tinysrgb&w=60&h=60&dpr=1';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      leading: const Padding(
        padding: EdgeInsets.all(4.0),
        child: CircleAvatar(
          backgroundImage: NetworkImage(urlImage),
          // backgroundColor: Colors.blue,
          // child: Icon(Icons.person),
        ),
      ),
      title: const Text('Joselito Linares'),
      centerTitle: false,
    ));
  }
}
