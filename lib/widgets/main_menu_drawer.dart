import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:ultimate_tasbih_app/services/authentication.dart';
import 'package:ultimate_tasbih_app/services/const.dart';
import 'package:provider/provider.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _applicationState = Provider.of<ApplicationState>(context);
    return Drawer(
      child: ListView(children: [
        DrawerHeader(
          //margin: EdgeInsets.all(2),
          child: Text(
            'Main Menu',
            style: TextStyle(color: cornSilk, fontSize: 18),
          ),
          decoration: BoxDecoration(
            color: oliveGreen,
            // border: Border.all(width: 5, color: kombuGreen),
          ),
        ),
        ListTile(
          title: Text('Other Menu item 1'),
        ),
        ListTile(
          leading: Icon(FluentIcons.sign_out_24_filled, color: oliveGreen),
          title: Text('Sign Out'),
          onTap: () {
            _applicationState.signOut();
          },
        ),
      ]),
    );
  }
}
