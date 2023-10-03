import 'package:chat_app/domain/entities/message.dart';
import 'package:chat_app/presentation/providers/chat_provider.dart';
import 'package:chat_app/presentation/widgets/chat/his_message_bubble.dart';
import 'package:chat_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:chat_app/presentation/widgets/shared/message_field_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        title: const Text('José Linares'),
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
    final chatProvider = context.watch<
        ChatProvider>(); // obtener del context el provider para el acceso a los datos del ChatProvider

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
              itemCount: chatProvider.messagesList
                  .length, // Será la cantidad de elementos en mi MessageList
              itemBuilder: (BuildContext context, int index) {
                final message = chatProvider.messagesList[index];
                return message.fromWho == FromWho.me
                    ? MyMessageBubble(text: message.text)
                    : HisMessageBubble(text: message.text);
              },
            )),
            MessageFieldBox(),
          ],
        ),
      ),
    );
  }
}
