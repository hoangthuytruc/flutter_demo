import 'package:flutter/material.dart';
import 'package:flutter_demo/models/language.dart';
import 'package:flutter_demo/utils/constants.dart';
import 'package:flutter_demo/utils/webview.dart';

class SettingsScreen extends StatefulWidget {
  @override
  SettingsScreenState createState() => SettingsScreenState();
}

class SettingsScreenState extends State<SettingsScreen> {
  
  GlobalKey? dropdownButtonKey = GlobalKey();
  Language currentLanguage = Language.vietnamese;
  
  void openDropdown() {
    GestureDetector? detector;
    void searchForGestureDetector(BuildContext? element) {
      element?.visitChildElements((element) {
        if (element.widget is GestureDetector) {
          detector = element.widget as GestureDetector?;
        } else {
          searchForGestureDetector(element);
        }
      });
    }
    searchForGestureDetector(dropdownButtonKey?.currentContext);
    assert(detector != null);
    detector?.onTap?.call();
  }

  @override
  Widget build(BuildContext context) {
    final dropdown = DropdownButtonFormField<Language>(
      key: dropdownButtonKey,
      items: Language.values
        .map<DropdownMenuItem<Language>> ((e) {
          return DropdownMenuItem(
            value: e,
            child: Text(currentLanguage == Language.vietnamese ? e.viValue : e.enValue)
          );
        })
        .toList(),
      onChanged: (value) {
        setState(() {
          if (value != null) currentLanguage = value;
        });
      },
    );

    return ListView(
          children: <Widget>[
            Offstage(child: dropdown),
            Card(
              margin: EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: ListTile(
                title: Text('Ngôn ngữ'), 
                leading: Icon(Icons.language),
                trailing: Text(
                  currentLanguage == Language.vietnamese 
                  ? currentLanguage.viValue 
                  : currentLanguage.enValue),
                onTap: openDropdown,
              ),
            ),
            Card(
              margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: ListTile(
                leading: Icon(Icons.info),
                title: Text('Giới thiệu'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => WebViewScreen(url: Constants.aboutUsUrl, title: 'Giới thiệu',),
                    ),
                  );
                },
              ),
            ),
          ],
        );
  }
}