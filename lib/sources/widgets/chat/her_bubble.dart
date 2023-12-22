import 'package:first_app/sources/modelos/message.dart';
import 'package:flutter/material.dart';

class HerBubble extends StatelessWidget {
  final Message message;
  const HerBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: colors.primary),
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
    final colors = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
    
      child: Image.network(gif,
          width: size.width * 0.7,
          height: 150,
          fit: BoxFit.cover, loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: colors.primary),
            child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  "Gorda está escribiendo ...",
                  style: TextStyle(color: Colors.white),
                  
                )));
      }),
    );
  }
}
