import 'package:first_app/sources/helpers/api_answer.dart';
import 'package:first_app/sources/modelos/message.dart';
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final getYesOrNo = Answer();
  List<Message> messages = [];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;
    final String url = text == 'yes'
        ? "https://media.tenor.com/41n0UYCQagIAAAAd/itsuki-quintess.gif"
        : "https://media.tenor.com/0ZGcEOTfNwgAAAAC/itsuki-nakano-tqq.gif";
    final newMessage =
        Message(text: text, fromWho: FromWho.mine, imageUrl: url);
    messages.add(newMessage);
    if (text.endsWith('?')) {
      herReply();
    }
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> herReply() async {
    final herMessage = await getYesOrNo.getAnswer();
    messages.add(herMessage);
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut);
  }
}
