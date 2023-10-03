import 'package:chat_app/presentation/widgets/chat/his_message_bubble.dart';
import 'package:chat_app/presentation/widgets/chat/my_message_bubble.dart';
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
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  const _ChatView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // Permite que el area de trabajo no interfiera en el notch de iOS o en los espacios de botones dinámicos
      // top: false,  // comerse el area superior hasta lo más alto posible
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                // Ocupar todo el area posible
                child: ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return index % 2 == 0
                    ? MyMessageBubble(text: 'My Message')
                    : HisMessageBubble(text: 'Hey dude');
              },
            )),
            Container(
              width: double.infinity,
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 45, 95, 170)),
              child: Text('Hola'),
            )
          ],
        ),
      ),
    );
  }
}