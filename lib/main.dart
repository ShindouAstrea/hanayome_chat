import 'package:first_app/settings/route/routes.dart';
import 'package:first_app/settings/theme/app_theme.dart';
import 'package:first_app/sources/providers/chat_provider.dart';
import 'package:first_app/sources/providers/quintilliza_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) {
            return ChatProvider();
          },
          
        ),
        ChangeNotifierProvider(create: (_){
          return QuintillizaProvider();
        })
      ],
      child: MaterialApp.router(
          title: 'Yes or No',
          routerConfig: appRouter,
          debugShowCheckedModeBanner: false,
          theme: AppTheme().theme(),
      )
    );
  }
}
