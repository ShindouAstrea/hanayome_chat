import 'package:first_app/sources/screens/settings/quintilliza/quintilliza_model.dart';
import 'package:flutter/material.dart';

class Quintilliza {
  static List<QuintillizaModel> listaQuintillizas = [
    QuintillizaModel(
        id: 1,
        nombre: "Ichika",
        urlImage: "assets/images/ichikaP.jpg",
        yesGif: "assets/gifs/ichikaGY.gif",
        noGif: "assets/gifs/ichikaGN.gif",
        estado:"Actuando para que me veas",
        mainColor: Colors.pink.shade100),
    QuintillizaModel(
        id: 2,
        nombre: "Nino",
        urlImage:
           "assets/images/ninoP.jpg",
        yesGif:
           "assets/gifs/ninoGY.gif",
        noGif:
            "assets/gifs/ninoGN.gif",
            estado: "Agradece que soy la unica interesada en ti",
        mainColor: Colors.red.shade300),
    QuintillizaModel(
        id: 3,
        nombre: "Miku",
        urlImage:
         "assets/images/mikuP.jpg",
        yesGif:
           "assets/gifs/mikuGY.gif",
        noGif:
           "assets/gifs/mikuGN.gif",
           estado: "Aprendiendo a cocinar 👩🏽‍🍳",
        mainColor: Colors.brown.shade400),
    QuintillizaModel(
        id: 4,
        nombre: "Yotsuba",
        urlImage:
           "assets/images/yotsubaP.jpg",
        yesGif:
          "assets/gifs/yotsubaGY.gif",
        noGif: "assets/gifs/yotsubaGN.gif",
        estado: "Vamos a jugar! ",
        mainColor: Colors.green.shade300),
    QuintillizaModel(
        id: 5,
        nombre: "Itsuki",
        yesGif:
            "assets/gifs/itsukiGY.gif",
        noGif: "assets/gifs/itsukiGN.gif",
        urlImage:
           "assets/images/itsukiP.jpg",
           estado: "Tengo hambre 😥",
        mainColor: Colors.redAccent),
  ];
}
