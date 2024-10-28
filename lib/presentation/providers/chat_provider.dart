import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:yes_no_app_fatima_h/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier{

  List<Message> messageList = [
    Message(text: 'hola ader ', fromWho: FromWho.me),
    Message(text: 'saludos', fromWho: FromWho.me),
  ];
  //controlador para manejar la posicion del scroll
  final ScrollController chatScrollControler = ScrollController();

  //enviar un mensaje 
  Future<void> sendMessage(String text) async{
    //El mensaje Siempre va a ser "me"xq yo lo envio
    final newMessage = Message(text: text, fromWho: FromWho.me);
    //agrega un nuevo elemento a la lista "messageList"
    messageList.add(newMessage);
    //notifica si algo de provider cabio para que se guarde en el estado
    notifyListeners();
    //mueve el scroll
    moveScrollBottom();
  }

    //Mover el scroll al ultimo mensaje 

    Future<Void> moveScrollBottom() async{
      // un pequeño atraso en la animacion para garantizar que siempre 
      //se vera aun cuando se envie el mensaje 
      await Future.delayed(const Duration(seconds: 1));
      chatScrollControler.animateTo(
              //offset: posicion de la animacion 
      //maxScrollExent determina a lo maximo que el scroll puede dar 
      chatScrollControler.position.maxScrollExtent,
        duration: const Duration(microseconds: 300),
         curve: Curves.easeOut);
    }
  }

