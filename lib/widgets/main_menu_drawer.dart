import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:ultimate_tasbih_app/screens/dua_entry_screen/dua_entry_screen.dart';
import 'package:ultimate_tasbih_app/services/app_strings.dart';
import 'package:ultimate_tasbih_app/services/authentication.dart';
import 'package:ultimate_tasbih_app/services/const.dart';
import 'package:provider/provider.dart';
import 'package:ultimate_tasbih_app/services/styles.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  static final double iconSize = 18;

  @override
  Widget build(BuildContext context) {
    var _applicationState = Provider.of<ApplicationState>(context);
    return Padding(
      padding: const EdgeInsets.only(top: 55.0),
      child: Align(
        alignment: Alignment.topRight,
        child: Container(
          width: 200,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Drawer(
            semanticLabel: AppStrings.DRAWER_BAR_TITLE,
            child: ListView(children: [
              Container(
                height: 60,
                child: DrawerHeader(
                  //margin: EdgeInsets.all(2),
                  child: Text(
                    AppStrings.DRAWER_BAR_TITLE,
                    style: AppStyle.title,
                  ),
                  decoration: BoxDecoration(
                    color: oliveGreen,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  'Dua add Screen',
                  style: AppStyle.title.copyWith(color: kombuGreen),
                ),
                minLeadingWidth: 0.0,
                trailing: Icon(Icons.account_circle,
                    color: oliveGreen, size: iconSize),
                onTap: () => onTap(context, 'Dua add Screen'),
              ),
              ListTile(
                title: Text(
                  AppStrings.MENU_USER_PROFILE,
                  style: AppStyle.title.copyWith(color: kombuGreen),
                ),
                minLeadingWidth: 0.0,
                trailing: Icon(Icons.account_circle,
                    color: oliveGreen, size: iconSize),
                onTap: () => onTap(context, AppStrings.MENU_USER_PROFILE),
              ),
              ListTile(
                title: Text(
                  AppStrings.MENU_VIBRATION,
                  style: AppStyle.title.copyWith(color: kombuGreen),
                ),
                onTap: () => onTap(context, AppStrings.MENU_VIBRATION),
                trailing: Icon(Icons.vibration_outlined,
                    color: oliveGreen, size: iconSize),
              ),
              ListTile(
                title: Text(
                  AppStrings.MENU_SOUND,
                  style: AppStyle.title.copyWith(color: kombuGreen),
                ),
                trailing: Icon(Icons.volume_up_outlined,
                    color: oliveGreen, size: iconSize),
                onTap: () => onTap(context, AppStrings.MENU_SOUND),
              ),
              ListTile(
                title: Text(
                  AppStrings.MENU_LEAVE_FEEDBACK,
                  style: AppStyle.title.copyWith(color: kombuGreen),
                ),
                onTap: () =>
                    this.onTap(context, AppStrings.MENU_LEAVE_FEEDBACK),
                trailing: Icon(Icons.feedback_rounded,
                    color: oliveGreen, size: iconSize),
              ),
              ListTile(
                title: Text(
                  AppStrings.MENU_SUPPORT_US,
                  style: AppStyle.title.copyWith(color: kombuGreen),
                ),
                onTap: () => onTap(context, AppStrings.MENU_SUPPORT_US),
                trailing:
                    Icon(Icons.credit_card, color: oliveGreen, size: iconSize),
              ),
              ListTile(
                title: Text(
                  AppStrings.MENU_LANGUAGE,
                  style: AppStyle.title.copyWith(color: kombuGreen),
                ),
                onTap: () => onTap(context, AppStrings.MENU_LANGUAGE),
                trailing: Icon(Icons.language_outlined,
                    color: oliveGreen, size: iconSize),
              ),
              ListTile(
                trailing: Icon(
                  FluentIcons.sign_out_24_filled,
                  color: oliveGreen,
                  size: iconSize,
                ),
                title: Text(
                  AppStrings.MENU_SIGN_OUT,
                  style: AppStyle.title.copyWith(color: kombuGreen),
                ),
                onTap: () {
                  _applicationState.signOut();
                },
              ),
            ]),
          ),
        ),
      ),
    );
  }

  onTap(context, String value) {
    switch (value) {
      case 'Dua add Screen':
        Navigator.pushNamed(context, DuaEntryScreen.routeName);
    }
  }
}
