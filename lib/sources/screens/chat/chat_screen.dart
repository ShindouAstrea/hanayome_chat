import 'package:first_app/sources/modelos/message.dart';
import 'package:first_app/sources/providers/chat_provider.dart';
import 'package:first_app/sources/widgets/chat/her_bubble.dart';
import 'package:first_app/sources/widgets/chat/mine_bubble.dart';
import 'package:first_app/sources/widgets/shared/message_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
                  "https://pm1.aminoapps.com/7887/3d22d2c527ba39b4ca4da4012dd1dbf7c3439633r1-735-413v2_uhq.jpg"),
            )),
        title: const Text("Itsuki Nakano"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
      ),
      body: Container(
        padding:const  EdgeInsetsDirectional.only(end: 5, start:5,top: 10),
        child:  _ChatView(),
      ),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    return Column(
    
      children: [
        Expanded(child: ListView.builder(
          controller: chatProvider.chatScrollController,
            itemCount: chatProvider.messages.length,
            itemBuilder: (context, index) {
          final message = chatProvider.messages[index];
          return (message.fromWho == FromWho.hers)                                                                                                           
              ?   HerBubble(message: message)
              :  MineBubble(message:message);
        })),
        MessageField(
          onValue:chatProvider.sendMessage,
        )
      ],
    );
  }
}
