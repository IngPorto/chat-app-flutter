import 'package:chat_app/domain/entities/message.dart';
import 'package:flutter/material.dart';

/// Extender de ChangeNotifier --> Significa que puede notificar de cambios y podemos reaccionar a esos cambios
class ChatProvider extends ChangeNotifier {
  List<Message> messages = [
    Message(
      text: 'Hola amigo',
      fromWho: FromWho.me,
    ),
    Message(
      text: 'Cómo estás?',
      fromWho: FromWho.me,
    )
  ];

  Future<void> sendMessage(String text, FromWho fromWho) async {
    messages.add(Message(
      text: text,
      fromWho: fromWho,
    ));
  }
}
