import 'package:first_app/sources/screens/package_screens.dart';
import 'package:first_app/sources/screens/qunitilliza_selector/quintilliza_select.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    //Widget que separa inicio de sesion
    // GoRoute(path: '/root',builder: (context,state)=>const InitialWidget()),
    //GoRoute(path: '/', builder: (context, state) => const LoginScreen()),
    GoRoute(path: '/initial',
name: 'initial',
builder:(context, state)=>const InitialScreen()),
    GoRoute(
        name: 'chat',
        path: '/chat',
        builder: (context, state) => const ChatScreen()),
    GoRoute(
        name: 'settings',
        path: '/settings',
        builder: (context, state) => const SettingsScreen()),
        GoRoute(
        name: '/',
        path: '/',
        builder: (context, state) => const SelectorQuintullizaScreen()),
  ],
);
