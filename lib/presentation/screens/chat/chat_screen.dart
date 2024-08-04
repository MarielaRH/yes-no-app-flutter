import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/config/theme/app_theme.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/other_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/field_box.dart';

void main() => runApp(const ChatScreen());

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 3).theme(),
      home: Scaffold(
        appBar: AppBar(
            leading: const Padding(
              padding: EdgeInsets.all(5.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRNknkS0JsXJE6-T5e0Qn2uSy9mQKc34TCaokpmaVG69CWltDN7W1egQeyScaSP9RnyWzQ&usqp=CAU'),
              ),
            ), //Establece un componente al dado izquierdo del app bar
            title: const Text('Solecito ❤️🔅'),
            centerTitle: false // Deshabilita el alineado del texto,
            ),
        body: _ChatView(),
      ),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    return SafeArea(
      /*
    Establece areas seguras para evitar que el contenido se desborde
    y para dejar espacio para los actions de al aplicación en el bottom de la pantalla*/
      left: false,
      right: false,
      child: Padding(
        //Coloca un padding al rededor de la columna
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                /*Hace que el componente hijo ocupe todo el tamaño posible */
                child: ListView.builder(
                    //Nos permite tener el control del scroll, con esto estamos vinculando el chatProvider con el scrool
                    //del litview
                    controller: chatProvider.chatScrollController,
                    itemCount: chatProvider.messages.length, // Indica cuantos elementos se van a renderizar
                    itemBuilder: (context, index) {
                      final message = chatProvider.messages[index];
                      //El index corresponde al elemento renderizado
                      return (message.fromWho == FromWho.me) ? Bubble(message: message) : OtherBubble(message: message);
                    })),
            FieldBox(onValue: chatProvider.sendMessage)
          ],
        ),
      ),
    );
  }
}