import 'package:dio/dio.dart';
import 'package:first_app/sources/modelos/message.dart';
import 'package:first_app/sources/providers/quintilliza_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Answer {
  final _dio = Dio();

 

  Future<Message> getAnswer(BuildContext context) async {
  
   final provider = Provider.of<QuintillizaProvider>(context,listen: false);
    final response = await _dio.get("https://yesno.wtf/api");
    String yes = provider.quintilliza!.yesGif!;
    String no = provider.quintilliza!.noGif!;
    //  String yes = "https://media.tenor.com/41n0UYCQagIAAAAd/itsuki-quintess.gif";
    //  String no = "https://media.tenor.com/0ZGcEOTfNwgAAAAC/itsuki-nakano-tqq.gif";
    return Message(text: response.data['answer'] =="yes"? "Si": "No", fromWho: FromWho.hers,imageUrl: response.data['answer'] =="yes"? yes: no);
  }
}
