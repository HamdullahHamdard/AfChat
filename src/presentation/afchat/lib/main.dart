import 'package:afchat/pages/home_screen.dart';
import 'package:afchat/pages/login_screen.dart';
import 'package:afchat/provider/authentication_provider.dart';
import 'package:afchat/services/navigation_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  // runApp(MainApp());
  runApp(
    HomeScreen(
        key: UniqueKey(),
        onInitializationComplete: () {
          runApp(MainApp());
        }),
  );
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthenticationProvider>(
          create: (BuildContext context) {
            return AuthenticationProvider();
          },
        ),
      ],
      child: MaterialApp(
        title: "AfChat",
        theme: ThemeData(
            // Color.fromRGBO(0, 169, 236, 1)
            backgroundColor: Color.fromRGBO(0, 169, 236, 1),
            scaffoldBackgroundColor: Color.fromRGBO(0, 169, 236, 1),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: Color.fromRGBO(0, 169, 236, 1),
            )),
        navigatorKey: NavigationServices.navigatorKey,
        initialRoute: '/login',
        routes: {
          '/login': (BuildContext context) => LoginScreen(),
        },
      ),
    );
  }
}
