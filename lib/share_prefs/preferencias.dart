
import 'package:shared_preferences/shared_preferences.dart';

class Preferencias {
  late SharedPreferences _prefs;
  static final Preferencias _instancia = new Preferencias._internal();

  factory Preferencias() {
    return _instancia;
  }

  Preferencias._internal();

  Future initPrefs() async{
    this._prefs = await SharedPreferences.getInstance();
  }

  // GET Y SET de color secundario
  bool get colorSecundario {
    return this._prefs.getBool('colorSecundario') ?? false;
  }

  set colorSecundario (bool value) {
    this._prefs.setBool('colorSecundario', value);
  }

  // GET Y SET del genero
  int get genero {
    return this._prefs.getInt('genero') ?? 1;
  }

  set genero(int value) {
    this._prefs.setInt('genero', value);
  }

  // GET Y SET del nombre
  String get nombre {
    return this._prefs.getString('nombre') ?? '';
  }

  set nombre (value) {
    this._prefs.setString('nombre', value);
  }

  // GET Y SET del ultimo screen visitado
  String get ultimoScreen {
    return this._prefs.getString('ultimoScreen') ?? 'home';
  }

  set ultimoScreen (value) {
    this._prefs.setString('ultimoScreen', value);
  }
}