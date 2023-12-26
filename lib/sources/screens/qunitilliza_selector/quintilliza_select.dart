import 'package:first_app/sources/constants/lista_quintillizas.dart';
import 'package:first_app/sources/providers/quintilliza_provider.dart';
import 'package:first_app/sources/screens/settings/quintilliza/quintilliza_model.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SelectorQuintullizaScreen extends StatelessWidget {
  const SelectorQuintullizaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<QuintillizaModel> listaQuintillizas = Quintilliza.listaQuintillizas;
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Bienvenido",
            style: TextStyle(fontSize: 20, color: Colors.pink.shade200),
          ),
          const Text(
            "Para empezar elige una quintilliza",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 15,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            child: ListWheelScrollView(
              itemExtent: MediaQuery.of(context).size.width /
                  2, // Ajusta el valor de itemExtent según tus necesidades
              children: [
                for (var quintilliza in listaQuintillizas)
                  CardQuintilliza(
                    id: quintilliza.id,
                    urlImagen: quintilliza.urlImage!,
                    nombre: quintilliza.nombre,
                    color: quintilliza.mainColor!,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CardQuintilliza extends StatefulWidget {
  const CardQuintilliza(
      {super.key,
      required this.urlImagen,
      required this.nombre,
      required this.color,
      required this.id});
  final String urlImagen;
  final String nombre;
  final Color color;
  final int id;

  @override
  State<CardQuintilliza> createState() => _CardQuintillizaState();
}

class _CardQuintillizaState extends State<CardQuintilliza> {
  @override
  Widget build(BuildContext context) {
    final quintiProvider = Provider.of<QuintillizaProvider>(context);
    Future<void> seleccionarQuintilliza() async {
      await quintiProvider.elegirQuintilliza(widget.id.toString());
      if (!mounted) return;
      context.goNamed('chat');
    }

    return Card(
        color: widget.color,
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                CircleAvatar(
                  radius: MediaQuery.of(context).size.width / 10,
                  backgroundImage:
                     AssetImage(widget.urlImagen)
                ),
                Text(
                  widget.nombre,
                  style: const TextStyle(color: Colors.black, fontSize: 20),
                ),
                ElevatedButton(
                    onPressed: () async {
                      await seleccionarQuintilliza();
                    },
                    child: const Text(
                      "Elegir",
                    ))
              ]),
            ],
          ),
        ));
  }
}
