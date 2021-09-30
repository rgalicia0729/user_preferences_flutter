import 'package:flutter/material.dart';

import 'package:preferencias_usuario/screens/screens.dart';
import 'package:preferencias_usuario/share_prefs/preferencias.dart';
 
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = new Preferencias();
  await prefs.initPrefs();

  runApp(MyApp()); 
}
 
class MyApp extends StatelessWidget {
  final _prefs = Preferencias();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: _prefs.ultimoScreen,
      routes: <String, WidgetBuilder>{
        HomeScreen.routeName     : ( _ ) => HomeScreen(),
        SettingsScreen.routeName : ( _ ) => SettingsScreen()
      },
    );
  }
}