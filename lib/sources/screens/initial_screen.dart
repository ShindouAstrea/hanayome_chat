import 'package:first_app/sources/providers/quintilliza_provider.dart';
import 'package:first_app/sources/screens/package_screens.dart';
import 'package:first_app/sources/screens/qunitilliza_selector/quintilliza_select.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool _hasData = false;


  @override
 void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkMemory();
    });
 }

 @override
 void dispose() {
    super.dispose();
 }

 void _checkMemory()async {
  final provider = Provider.of<QuintillizaProvider>(context);

    final inicioSesion = await provider.hayDatos();

    setState(() {
      
      _hasData = inicioSesion;
    });
 }

  @override
  Widget build(BuildContext context) {
    if (_hasData) {
      return const ChatScreen();
    } else {
      return const SelectorQuintullizaScreen();
    }
  }
}
