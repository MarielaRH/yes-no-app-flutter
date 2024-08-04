import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

void main() => runApp(Bubble(
      message: Message(fromWho: FromWho.me, text: "Hola mi amor"),
    ));

class Bubble extends StatelessWidget {
  final Message message;
  const Bubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    /**Indicamos que busque el tema dentro del contexo */
    return Column(
      crossAxisAlignment: CrossAxisAlignment
          .end, //Permite que alinemos los contenedores a la derecha
      children: [
        Container(
          decoration: BoxDecoration(
              color: colors.primary,
              borderRadius: BorderRadius.circular(
                  20)), // Permite date estilos al container que se está creando
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(message.text),
          ),
        ),
        const SizedBox(
          // Permite crear un espacio vacío haciendo ilusión de separación
          height: 10,
        )
      ],
    );
  }
}
