import 'package:dio/dio.dart';
import 'package:first_app/sources/modelos/message.dart';

class Answer {
  final _dio = Dio();

  Future<Message> getAnswer() async {
    final response = await _dio.get("https://yesno.wtf/api");
    const  String yes = "https://media.tenor.com/41n0UYCQagIAAAAd/itsuki-quintess.gif";
    const String no = "https://media.tenor.com/0ZGcEOTfNwgAAAAC/itsuki-nakano-tqq.gif";
    return Message(text: response.data['answer'] =="yes"? "Si": "No", fromWho: FromWho.hers,imageUrl: response.data['answer'] =="yes"? yes: no);
  }
}
