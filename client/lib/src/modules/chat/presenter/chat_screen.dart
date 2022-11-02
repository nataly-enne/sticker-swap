import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
        body: Text("Falta fazer a pagina do chat eim..."),

        floatingActionButton: FloatingActionButton(
          onPressed: (){},
          tooltip: "Adicionar char",
          backgroundColor: Theme.of(context).primaryColor,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
