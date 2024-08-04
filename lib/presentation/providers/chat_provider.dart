import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final getYestNoAnswer = GetYesNoAnswer();
  final ScrollController chatScrollController = ScrollController();

  //* Change notifier significa que puede notificar cuando hay cambios y nosotros podremos actuar en consecuencia
  List<Message> messages = [
    Message(text: 'Hola', fromWho: FromWho.me),
    Message(text: 'Ya terminaste de estudiar?', fromWho: FromWho.me)
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;

    final newMessage = Message(text: text, fromWho: FromWho.me);

    //* Agregamos el nuevo mensaje a la lista
    messages.add(newMessage);

    if (text.endsWith('?')) {
      herReplay();
    }

    //* Se notifica a los listener de los cambios que hubieron en el provider para que actualicen sus pantalla
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 100), curve: Curves.easeOut);
  }

  Future<void> herReplay() async {
    final herMessage = await getYestNoAnswer.getAnswer();
    messages.add(herMessage);
    moveScrollToBottom();
    notifyListeners();
  }
}
