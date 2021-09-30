import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Container(),
            decoration: BoxDecoration(                          
              image: DecorationImage(
                image: AssetImage('assets/menu-img.jpg'),
                fit: BoxFit.cover
              )
            ),
          ),

          ListTile(
            leading: Icon(Icons.home, color: Colors.blue),
            title: Text('Home'),
            onTap: () => Navigator.pushNamed(context, 'home'),
          ),

          ListTile(
            leading: Icon(Icons.settings, color: Colors.blue),
            title: Text('Settings'),
            onTap: () => Navigator.pushReplacementNamed(context, 'settings'),
          )
        ],
      ),
    );
  }
}