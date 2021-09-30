import 'package:flutter/material.dart';

import 'package:preferencias_usuario/share_prefs/preferencias.dart';
import 'package:preferencias_usuario/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static final String routeName = 'home';
  final _prefs = Preferencias();

  @override
  Widget build(BuildContext context) {
    _prefs.ultimoScreen = routeName;

    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias de usuario'),
        backgroundColor: (_prefs.colorSecundario) ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Color secundario: ${_prefs.colorSecundario}'),
          Divider(),

          Text('Género: ${_prefs.genero == 1 ? 'Masculino' : 'Femenino'}'),
          Divider(),

          Text('Nombre de usuario: ${_prefs.nombre}'),
          Divider()
        ],
      ),
    );
  }
}