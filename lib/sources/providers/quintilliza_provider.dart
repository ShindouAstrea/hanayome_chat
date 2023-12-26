import 'package:first_app/sources/constants/lista_quintillizas.dart';
import 'package:first_app/sources/screens/settings/quintilliza/quintilliza_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuintillizaProvider extends ChangeNotifier {
  QuintillizaModel? quintilliza;

  Future<void> elegirQuintilliza(String id) async {
    await _guardarEnCache(id: id);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? idQuintilliza = prefs.getString('quintillizaId');
    if (idQuintilliza != null) {
      int idListQuintilliza = Quintilliza.listaQuintillizas.indexWhere(
          (quintilliza) => quintilliza.id.toString() == idQuintilliza);
      quintilliza = Quintilliza.listaQuintillizas[idListQuintilliza];
      notifyListeners();
    }
    notifyListeners();
  }

  Future<void> _guardarEnCache({required id}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('quintillizaId', id);
  }

  Future<bool> hayDatos() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('quintillizaId') != null) {
      //se inicializa el provider para obtener la data
      String? idQuintilliza = prefs.getString('quintillizaId');
      int idListQuintilliza = Quintilliza.listaQuintillizas.indexWhere(
          (quintilliza) => quintilliza.id.toString() == idQuintilliza);
      quintilliza = Quintilliza.listaQuintillizas[idListQuintilliza];
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }
}
