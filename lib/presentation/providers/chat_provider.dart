import 'package:flutter/material.dart';
import 'package:yes_no_app_fatima_h/config/theme/helpers/yes_no_answer.dart';
import 'package:yes_no_app_fatima_h/domain/entities/message.dart';


class ChatProvider extends ChangeNotifier{
  
  
  final ScrollController chatScrollcontroler = ScrollController();
  final GetYesNoanswer getYesNoanswer = GetYesNoanswer();
  //instanci de la clase GetYesNoAnver

  List<Messages> message = [
    Messages(text: 'Buen dia', fromWho: FromWho.mine),
    Messages(text: 'hola', fromWho: FromWho.mine)
  ];
  

  Future<void> sendMessage(String text) async{
    //evita enviar mensajes vacios o solo espacios 
    if (text.trim().isEmpty) return;
    
    final newMessage = Messages(text: text, fromWho: FromWho.mine);
    message.add(newMessage);
    print('Cantidad de mensajes: ${message.length}'); // Imprime la cantidad de mensajes

    if (text.endsWith('?')){ 
       seojunReply();
     }
    notifyListeners();
    moveScrollToBottom();

   }


  Future<void> seojunReply() async { 
    final seojunMessage = await getYesNoanswer.getAnswer();
    message.add(seojunMessage);
    notifyListeners();
    moveScrollToBottom();

   }
   

  void moveScrollToBottom(){ 

    chatScrollcontroler.animateTo(
      //extender el scroll lo maximo que se mueva
    chatScrollcontroler.position.maxScrollExtent,
    duration: const Duration(seconds: 1), 
    curve: Curves.easeOut);

  }


}