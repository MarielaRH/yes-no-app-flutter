import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class OtherBubble extends StatelessWidget {
  final Message message;
  const OtherBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    /**Indicamos que busque el tema dentro del contexo */
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, //Permite que alinemos los contenedores a la derecha
      children: [
        Container(
          decoration: BoxDecoration(
              color: colors.secondary,
              borderRadius: BorderRadius.circular(20)), // Permite date estilos al container que se está creando
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              message.text,
            ),
          ),
        ),
        const SizedBox(
          // Permite crear un espacio vacío haciendo ilusión de separación
          height: 5,
        ),
        _ImageBubble(message.imageUrl!),
        const SizedBox(
          // Permite crear un espacio vacío haciendo ilusión de separación
          height: 10,
        ),
      ],
    );
  }
}

// * Inicia con _ porque será privado y solo se usará dentro de este widget
class _ImageBubble extends StatelessWidget {
  final String imageUrl;
  const _ImageBubble(this.imageUrl);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    /**
     * El media query nos da información referente al dispositivo que lo está ejecutando
     * 
     * El contexto no da la información del arbol de widgets
     * 
     * dentro del contexto hay varias propiedades del dispositivo que podemos consultar, como por el ejemplo el size
     */
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        imageUrl,
        width: size.width * 0.7,
        height: 200,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          /**
           * Loading Builder nos permite definir un estado de carga para las imágenes, es decir que podremos
           * mostrar algún elemento mientras este está cargando
           */

          if (loadingProgress == null) return child;

          /** Mientras la imagen se está cargando se mostrará un contenedor del mismo tamaño de la imagen con un texto */
          return Container(
              color: Colors.grey,
              alignment: Alignment.center,
              foregroundDecoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
              width: size.width * 0.7,
              height: 200,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: const Text('Loading Image'));
        },
      ),
    );
  }
}
