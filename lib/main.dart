import 'package:first_app/settings/theme/app_theme.dart';
import 'package:first_app/sources/providers/chat_provider.dart';
import 'package:first_app/sources/screens/chat/chat_screen.dart';
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
        )
      ],
      child: MaterialApp(
          title: 'Yes or No',
          debugShowCheckedModeBanner: false,
          theme: AppTheme().theme(),
          home: const ChatScreen()),
    );
  }
}
