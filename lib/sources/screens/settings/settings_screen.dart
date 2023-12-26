import 'package:first_app/sources/constants/lista_quintillizas.dart';
import 'package:first_app/sources/providers/chat_provider.dart';
import 'package:first_app/sources/providers/quintilliza_provider.dart';
import 'package:first_app/sources/screens/settings/quintilliza/quintilliza_model.dart';
import 'package:first_app/sources/widgets/shared/menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  List<QuintillizaModel> quintillizas = [];

  String? quintilliza;
  bool flag = true;
  @override
  void initState() {
    super.initState();
    _initQuitilliza();
    if (!mounted) return;
    quintillizas = Quintilliza.listaQuintillizas;
  }

  void _initQuitilliza() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (!mounted) return;
    if (await existeQuintilliza() == true) {
      while (quintillizas.isEmpty) {
        await Future.delayed(const Duration(milliseconds: 100));
      }
      setState(() {
        String quintillizaId = prefs.getString('quintillizaId')!;
        quintilliza = quintillizas[quintillizas.indexWhere(
                (element) => element.id.toString() == quintillizaId)]
            .id
            .toString();
        flag = false;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  void cambiarQuintilliza() async {
    final quintillizaProvider = Provider.of<QuintillizaProvider>(context, listen: false);
    await quintillizaProvider.elegirQuintilliza(quintilliza!);

    //Se borra el chat ya que cambiamos quintilliza
    if(!mounted) return;
    final chatProvider = Provider.of<ChatProvider>(context, listen: false);
    chatProvider.wipeChat();
  }

  Future<bool> existeQuintilliza() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('quintillizaId') != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<QuintillizaProvider>(context);
    QuintillizaModel quinti = provider.quintilliza!;
    if (flag == false) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Configuración"),
          centerTitle: true,
          backgroundColor: quinti.mainColor,
          titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
        ),
        drawer: const MenuDrawer(),
        body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const Center(
              child: Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              "Selecciona tu quintilliza",
              style: TextStyle(fontSize: 18),
            ),
          )),
          DropdownButton(
            value: quintilliza,
            onChanged: (String? newValue) {
              setState(() {
              
                quintilliza = newValue;
                if (quintilliza != null) {
                  cambiarQuintilliza();
                }
              });
            },
            items: quintillizas.map<DropdownMenuItem<String>>((quintilliza) {
              return DropdownMenuItem<String>(
                value: quintilliza.id.toString(),
                child: Text(quintilliza.nombre),
              );
            }).toList(),
          )
        ]),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Configuración"),
          centerTitle: true,
          backgroundColor: Colors.redAccent,
          titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
        ),
        drawer: const MenuDrawer(),
        body: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: CircularProgressIndicator.adaptive(),
              )
            ]),
      );
    }
  }
}
