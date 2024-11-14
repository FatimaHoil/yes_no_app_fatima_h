import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app_fatima_h/domain/entities/message.dart';
import 'package:yes_no_app_fatima_h/presentation/providers/chat_provider.dart';
import 'package:yes_no_app_fatima_h/presentation/widgets/chat/him_message.dart';
import 'package:yes_no_app_fatima_h/presentation/widgets/chat/my_message.dart';
import 'package:yes_no_app_fatima_h/presentation/widgets/share/message_box.dart';


class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4RLPw-zJfH2QNOZiLi1xTSmP3gMyi_JtQYA&s',),
          ),
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Seo jun  ❤'),
            SizedBox(height: 4),
            Text(
              'En línea',
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 12), // Estilo para indicar que está en línea
            ),
          ],
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.videocam),
            onPressed: () {
              // Acción para la cámara de video
            },
          ),
          IconButton(
            icon: const Icon(Icons.call),
            onPressed: () {
              // Acción para el teléfono
            },
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              // Acción para los tres puntos
            },
          ),
        ],
      ),
      body: const _ChatView(),
      );
  }
}

class _ChatView extends StatelessWidget {
  const _ChatView();

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController, // Enlaza el ScrollController
                itemCount: chatProvider.messages.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messages[index];

                  return (message.fromWho == FromWho.Seojun)
                      ? SeojunMessage(message: message)
                      : MyMessage(message: message);
                },
              ),
            ),
            MessageBox(
              onValue: (value) => chatProvider.sendMessage(value),
            ),
          ],
        ),
      ),
    );
  }
}