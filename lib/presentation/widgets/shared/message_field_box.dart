import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String>
      onValue; // es un tipo de función el cual funciona como callback que devuelve un String. Es diferente a voidCallback
  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final textController =
        TextEditingController(); // Me dará el control de la caja de texto
    final focusNode = FocusNode(); // Controlar el foco de la caja de texto

    final colors = Theme.of(context).colorScheme;
    final outlineInputBorder = UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(40),
    );
    final outlineInputFocusBorder = OutlineInputBorder(
      borderSide: BorderSide(color: colors.primary),
      borderRadius: BorderRadius.circular(20),
    );

    return TextFormField(
      onTapOutside: (event) {
        // Quitar el foco al dar click afuera del input
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: InputDecoration(
          enabledBorder: outlineInputBorder,
          focusedBorder: outlineInputFocusBorder,
          hintText: 'Escribe tu mensaje con "?"',
          filled: true,
          suffixIcon: IconButton(
            icon: const Icon(Icons.send_outlined),
            onPressed: () {
              final textValue = textController.text;
              textController.clear();
              onValue(textValue);
              // Valor de la caja de texto
            },
          )),
      onFieldSubmitted: (value) {
        textController.clear();
        focusNode.requestFocus();
        onValue(value);
      },
    );
  }
}
