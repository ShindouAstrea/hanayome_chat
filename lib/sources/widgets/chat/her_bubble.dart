import 'package:first_app/sources/modelos/message.dart';
import 'package:first_app/sources/providers/quintilliza_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HerBubble extends StatelessWidget {
  final Message message;
  const HerBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<QuintillizaProvider>(context, listen: false);
    final colors = provider.quintilliza!.mainColor;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: colors),
          child:
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                message.text,
                style: const TextStyle(color: Colors.white),
              ))),
      const SizedBox(height: 5),
      _Imagebubble(gif: message.imageUrl),
      const SizedBox(height: 10),
    ]);
  }
}

class _Imagebubble extends StatelessWidget {
  final String gif;
  const _Imagebubble({required this.gif});

  @override
  Widget build(BuildContext context) {
   
    final size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      
    
      child: Image.asset(gif,
          width: size.width * 0.7,
          height: 150,
          fit: BoxFit.cover
      ),
    );
  }
}
