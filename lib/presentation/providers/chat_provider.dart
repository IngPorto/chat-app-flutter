import 'package:chat_app/domain/entities/message.dart';
import 'package:flutter/material.dart';

/// Extender de ChangeNotifier --> Significa que puede notificar de cambios y podemos reaccionar a esos cambios
class ChatProvider extends ChangeNotifier {
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

  Future<void> sendMessage(String text, FromWho fromWho) async {
    messagesList.add(Message(
      text: text,
      fromWho: fromWho,
    ));
  }
}
