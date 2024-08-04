import 'package:flutter/material.dart';

// void main() => runApp(const FieldBox());

class FieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;
  const FieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController(); // Nos permite tener el control del input al cual lo asociemos
    final focusNode = FocusNode(); // Nos permite establecer el foco de manera manual sobre un elemento
    final outlineInputBorder = UnderlineInputBorder(
        borderRadius: BorderRadius.circular(50), borderSide: const BorderSide(color: Colors.transparent));

    final inputDecoration = InputDecoration(
        hintText: "End your message with '??' ",
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        fillColor: Colors.black,
        filled: true,
        suffixIcon: IconButton(
            onPressed: () {
              final textValue = textController.value.text;
              onValue(textValue);
              textController.clear();
            },
            icon: const Icon(Icons.send)));

    return TextFormField(
      controller: textController, // Enlazamos el text controller que definimos previamente al text form
      focusNode: focusNode, // Enlazamos el focusNode al text form
      decoration: inputDecoration,
      onTapOutside: (event) {
        focusNode.unfocus(); // Nos permite quitar el foco de manera manual del elemento
      },
      onFieldSubmitted: (value) {
        textController.clear(); //En este punto cuando se hace el submit se pierde el foco del input
        focusNode.requestFocus();
        onValue(value);
      },
    );
  }
}
