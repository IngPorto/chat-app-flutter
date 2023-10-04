import 'package:chat_app/domain/entities/message.dart';
import 'package:flutter/material.dart';

/// Extender de ChangeNotifier --> Significa que puede notificar de cambios y podemos reaccionar a esos cambios
class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollCroller =
      ScrollController(); // para controlar el scroll del listView

  List<Message> messagesList = [
    Message(
      text: 'Hola amigo',
      fromWho: FromWho.me,
    ),
    Message(
      text: 'Cómo estás?',
      fromWho: FromWho.me,
    ),
    Message(
      text: 'Hola David, todo muy bien y tú?',
      fromWho: FromWho.his,
    )
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;
    messagesList.add(Message(
      text: text,
      fromWho: FromWho.me,
    ));
    notifyListeners(); // Redibujar parecido al setState((){});, algo del provider cambió
    moveScrollToBottom();
  }

  void moveScrollToBottom() {
    chatScrollCroller.animateTo(
      chatScrollCroller.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
