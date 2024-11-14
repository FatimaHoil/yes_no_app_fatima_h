import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yes_no_app_fatima_h/config/theme/helpers/yes_no_answer.dart';
import 'package:yes_no_app_fatima_h/domain/entities/message.dart';


class ChatProvider extends ChangeNotifier {
  
  final ScrollController chatScrollController = ScrollController();
  final GetYesNoanswer getYesNoanswer = GetYesNoanswer();

  List<Messages> messages = [
    Messages(text: 'Buen día', fromWho: FromWho.hime, 
    time: DateFormat('hh:mm a').format(DateTime.now())),
    Messages(text: 'Hola', fromWho: FromWho.hime,time: DateFormat('hh:mm a').format(DateTime.now()))
  ];

  Future<void> sendMessage(String text) async { 
    if (text.trim().isEmpty) return; // Evita enviar mensajes vacíos o solo espacios

    final newMessage = Messages(text: text, fromWho: FromWho.hime, time: DateFormat('hh:mm a').format(DateTime.now()));
    messages.add(newMessage);
    print('Cantidad de mensajes: ${messages.length}'); // Imprime la cantidad de mensajes

    if (text.endsWith('?')) { 
      await amloReply();
    }
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> amloReply() async { 
    final SeojunMessage = await getYesNoanswer.getAnswer();
    messages.add(SeojunMessage);
    print('Cantidad de mensajes: ${messages.length}'); // Imprime la cantidad de mensajes
    notifyListeners();
    moveScrollToBottom();
  }

  void moveScrollToBottom() { 
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(seconds: 1), 
      curve: Curves.easeOut,
    );
  }
}