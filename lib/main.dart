import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ingilizce_app/router/RouteScreen.dart';
import 'theme/MyTheme.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.black, // transparent status bar
  ));
  WidgetsFlutterBinding.ensureInitialized();

  new Routes();
}

class Routes {
  var routes = <String, WidgetBuilder>{};
  Routes() {
    runApp(new MaterialApp(
      onGenerateRoute: (settings) {
        return CupertinoPageRoute(
            settings: settings,
            builder: (context) => routes[settings.name](context));
      },
      debugShowCheckedModeBanner: false,
      title: MyTheme.appName,
      theme: MyTheme.myTheme,
      home: new RouteScreen(),
    ));
  }
}
