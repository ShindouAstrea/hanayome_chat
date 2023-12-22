import 'package:first_app/sources/modelos/message.dart';
import 'package:flutter/material.dart';

class MineBubble extends StatelessWidget {
  final  Message message ;
  const MineBubble({super.key,required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
      Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: colors.secondary),
          child:  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child:  Text(
                 message.text,
                style: const TextStyle(color: Colors.white),
              ))),
      const SizedBox(height: 10),
    ]);
  }
}
