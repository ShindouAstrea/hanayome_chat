import 'package:first_app/sources/providers/quintilliza_provider.dart';
import 'package:first_app/sources/screens/settings/quintilliza/quintilliza_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final quintillizaProvider = Provider.of<QuintillizaProvider>(context);

    final quintilliza = quintillizaProvider.quintilliza ??
        QuintillizaModel(id: 6, nombre: "UNKNOWN");
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            

            decoration: BoxDecoration(

              color: quintilliza.mainColor,
            ),
            child: Center(
                child: Column(
              children: [
                CircleAvatar(
                  radius: MediaQuery.of(context).size.width / 12,
                  backgroundImage: AssetImage(quintilliza.urlImage!),
                ),
                Text(
                  quintilliza.nombre,
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
                Expanded(child: Text("“${quintilliza.estado}”",style: const TextStyle(color: Colors.white, fontSize: 16),))
              ],
            )),
          ),
          ListTile(
            title: const Text("Chat"),
            onTap: () {
              context.goNamed('chat');
            },
          ),
          ListTile(
            title: const Text("Configuración"),
            onTap: () {
              context.goNamed('settings');
            },
          )
        ],
      ),
    );
  }
}
