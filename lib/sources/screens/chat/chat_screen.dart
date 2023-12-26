
import 'package:first_app/sources/modelos/message.dart';
import 'package:first_app/sources/providers/chat_provider.dart';
import 'package:first_app/sources/providers/quintilliza_provider.dart';
import 'package:first_app/sources/screens/settings/quintilliza/quintilliza_model.dart';
import 'package:first_app/sources/widgets/chat/her_bubble.dart';
import 'package:first_app/sources/widgets/chat/mine_bubble.dart';
import 'package:first_app/sources/widgets/shared/menu.dart';
import 'package:first_app/sources/widgets/shared/message_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final quintiProvider = Provider.of<QuintillizaProvider>(context);
    QuintillizaModel datosQuintilliza = quintiProvider.quintilliza?? QuintillizaModel(id: 5, nombre: "");
    return Scaffold(
      backgroundColor: Colors.red.shade50,
      drawer: const MenuDrawer(),
      appBar: AppBar(

        title:  Column(children: [Text(datosQuintilliza.nombre),const Text("en linea",style: TextStyle(fontSize: 10),)]),
        
        centerTitle: true,
        backgroundColor: datosQuintilliza.mainColor,
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
          onValue:(value,context)=> chatProvider.sendMessage(value,context)
        )
      ],
    );
  }
}
