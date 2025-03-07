import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {

  final ScrollController chatScrollController = ScrollController();
  final getYesNoAnswer = GetYesNoAnswer();

  List<Message> messagesList = [
    Message(text: 'Hola amor', fromWho: FromWho.me),
    Message(text: 'Ya regresaste del trabajo?', fromWho: FromWho.me),
    Message(text: 'Si cariño, ya estoy en casa!!', fromWho: FromWho.other),
  ];


  Future<void> sendMessage(String text) async { 
    if (text.isEmpty) return;
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messagesList.add(newMessage);

    if (text.endsWith('?')) {
      getReply();
    }


    notifyListeners();
    modeScrollToBottom();
  }

  Future<void> getReply() async {
    final otherMessage = await getYesNoAnswer.getYesNoAnswer();
    messagesList.add(otherMessage);
    notifyListeners();
    modeScrollToBottom();
  }

  Future<void> modeScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent, 
      duration: const Duration(milliseconds: 300), 
      curve: Curves.easeOut
    );
  }
 
}