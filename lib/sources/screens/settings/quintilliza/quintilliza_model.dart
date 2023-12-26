import 'dart:convert';
import 'dart:ui';

class QuintillizaModel {
  int id;
  String nombre;
  Color? mainColor;
  String? urlImage;
  String? yesGif;
  String? noGif;
  String? estado;


  QuintillizaModel({
    required this.id,
    required this.nombre,
    this.mainColor,
    this.urlImage,
    this.yesGif,
    this.noGif,
    this.estado
  });

  factory QuintillizaModel.fromRawJson(String str) =>
      QuintillizaModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory QuintillizaModel.fromJson(Map<String, dynamic> json) =>
      QuintillizaModel(
        id: json["id"],
        nombre: json["nombre"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
      };
}
