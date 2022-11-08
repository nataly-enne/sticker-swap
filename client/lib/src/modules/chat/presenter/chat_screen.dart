import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sticker_swap_client/src/modules/chat/domain/entities/chat.dart';
import 'package:sticker_swap_client/src/modules/chat/presenter/chat_bloc.dart';
import 'package:sticker_swap_client/src/modules/chat/presenter/widgets/chat_tile.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ModularState<ChatScreen, ChatBloc> {

  @override
  void initState() {
    super.initState();
    controller.getChats();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: const Text("Trocar figurinhas"),
          centerTitle: true,
        ),

        body: Column(
          children: [
            //Colocar search aqui

            StreamBuilder<List<Chat>>(
              stream: controller.getChatsView,
              builder: (_, snapshot){
                if (snapshot.hasData){
                  return Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) => ChatTile(chat: snapshot.data![index]),
                    ),
                  );
                }else{
                  return const Center(child: CircularProgressIndicator(),);
                }
              }
            ),
          ],
        ),

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
