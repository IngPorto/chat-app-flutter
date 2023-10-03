import 'package:flutter/material.dart';

class MyMessageBubble extends StatelessWidget {
  final String text;
  const MyMessageBubble({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(
        context); // Busca el tema dentro del contexto, pasa saber qué Theme usa el dispositivo

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
              color: colors.colorScheme.primary,
              borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(text, style: TextStyle(color: Colors.white)),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
