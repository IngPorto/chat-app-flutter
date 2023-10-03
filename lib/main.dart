import 'package:chat_app/presentation/providers/chat_provider.dart';
import 'package:chat_app/presentation/screens/chat/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/config/theme/app_theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // Envoltorio del paquete Provider para vincular uno o varios providers a mi aplicación
      providers: [
        ChangeNotifierProvider(
          // Provider para la notificación de cambios
          create: (_) => ChatProvider(), // Mi provider puntual
        )
      ],
      child: MaterialApp(
          title: 'Yes No App',
          debugShowCheckedModeBanner: false,
          theme: AppTheme(selectedColor: 1).theme(),
          home: const ChatScreen()),
    );
  }
}
