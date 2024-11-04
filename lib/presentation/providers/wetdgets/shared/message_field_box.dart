// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {

    final OutlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(40)
    );
    final inputDecoration = InputDecoration(
        enabledBorder: OutlineInputBorder,
        focusedBorder: OutlineInputBorder,
        filled: true,
        suffixIcon: IconButton(
          icon: const Icon(Icons.send_outlined),
          onPressed: () {
            print('valor de caja de texto');

          },
        ),
    );


    
    return TextFormField(
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        print('submit value $value');
      },
      onChanged:(value) {
        print('changed: $value');
      },
    );
  }
}