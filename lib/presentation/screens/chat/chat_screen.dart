import 'package:flutter/material.dart';
import 'package:yes_no_app_fatima_h/presentation/providers/wetdgets/chat/my_message_bubble.dart';
import 'package:yes_no_app_fatima_h/presentation/providers/wetdgets/her_message_bubble.dart';
import 'package:yes_no_app_fatima_h/presentation/providers/wetdgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {

  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://th.bing.com/th?id=OIP.Gmn_CwmZzvqLswrjPPSc3gHaHR&w=252&h=247&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2'),
          ),
        ),
          
        title: const Text('Seo Jun❤️'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric( horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 200,
                itemBuilder: (context, index) {
                return ( index % 2 == 0)
                ? const HerMessageBubble()
                :const MyMessageBubble();


              },)
              ),
            
            /// caja de texto
           const MessageFieldBox(),
          ],
        ),
      ),
    );
  }
}