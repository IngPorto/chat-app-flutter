import 'package:flutter/material.dart';

class HisMessageBubble extends StatelessWidget {
  final String text;
  final String? imageUrl;

  const HisMessageBubble({super.key, required this.text, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(
        context); // Busca el tema dentro del contexto, pasa saber qué Theme usa el dispositivo

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: colors.colorScheme.secondary,
              borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(text, style: TextStyle(color: Colors.white)),
          ),
        ),
        SizedBox(height: 5),
        _ImageBubble(image: imageUrl),
        SizedBox(height: 10),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String? image;

  const _ImageBubble({super.key, this.image});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context)
        .size; // Obtener tamaño de la pantalla del dispositivo

    return ClipRRect(
      // Redondear bordes de una imagen
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        image != null
            ? image!
            : 'https://yesno.wtf/assets/yes/13-c3082a998e7758be8e582276f35d1336.gif',
        width: size.width * 0.7,
        height: 150,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          // Child es el widget que se está cargando
          if (loadingProgress == null) {
            return child;
          }
          return Container(
            width: size.width * 0.7,
            height: 150,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: const Text('Está escribiendo...'),
          );
        },
      ),
    );
  }
}
