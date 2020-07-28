import 'package:flutter/material.dart';
import 'package:push_app/src/pages/home_page.dart';
import 'package:push_app/src/pages/mensaje_page.dart';
import 'package:push_app/src/providers/push_notification_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final pushProvider = new PushNotificationProvider();
    pushProvider.initNotification();
    pushProvider.mensajesStream.listen((data) {
      //print('Argumentos desde Stream: $argumento');
      //Navigator.pushNamed(context, 'mensaje');
      navigatorKey.currentState.pushNamed('mensaje', arguments: data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      title: 'Material App',
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => HomePage(),
        'mensaje': (BuildContext context) => MensajePage(),
      },
    );
  }
}
