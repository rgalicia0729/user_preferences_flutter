import 'package:flutter/material.dart';
import 'package:preferencias_usuario/screens/screens.dart';

import 'package:preferencias_usuario/share_prefs/preferencias.dart';
import 'package:preferencias_usuario/widgets/widgets.dart';

class SettingsScreen extends StatefulWidget {
  static final String routeName = 'settings';

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late bool _colorSecundario;
  late int _genero;
  late String _nombre;

  late TextEditingController _textEditingController;

  final _preferencias = Preferencias();

  @override
  void initState() {
    super.initState();

    _colorSecundario = _preferencias.colorSecundario;
    _genero = _preferencias.genero;
    _nombre = _preferencias.nombre;

    _textEditingController = new TextEditingController(text: _nombre);
  }

  @override
  Widget build(BuildContext context) {
    _preferencias.ultimoScreen = SettingsScreen.routeName;

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: (_preferencias.colorSecundario) ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text(
              'Settings',
              style: TextStyle(
                fontSize: 45.0,
                fontWeight: FontWeight.bold
              ),
            ),
          ),

          Divider(),

          SwitchListTile(
            value: _colorSecundario,
            title: Text('Color secundario'),
            onChanged: (value) {
              setState(() {
                _preferencias.colorSecundario = value;
                _colorSecundario = value;
              });
            },
          ),

          RadioListTile(
            value: 1,
            title: Text('Masculino'), 
            groupValue: _genero, 
            onChanged: _setSelectedRadio
          ),

          RadioListTile(
            value: 2,
            title: Text('Femenino'), 
            groupValue: _genero, 
            onChanged: _setSelectedRadio
          ),

          Divider(),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                labelText: 'Nombre',
                helperText: 'Nombre de la persona usando el teléfono'
              ),
              onChanged: (value) {
                _preferencias.nombre = value;
                _nombre = value;
              },
            ),
          )
        ],
      )
    );
  }

  void _setSelectedRadio(int? value) async {
    int newValue = value ?? 1;

    setState(() {
      _preferencias.genero = newValue;
      _genero = value ?? newValue;
    });
  }
}