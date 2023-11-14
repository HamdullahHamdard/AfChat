import 'package:afchat/services/navigation_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({ Key? key, required this.onInitializationComplete });
  final VoidCallback onInitializationComplete;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _setup().then((__) => widget.onInitializationComplete);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // backgroundColor: Colors.lightBlue,
        backgroundColor: Color.fromRGBO(0, 169, 236, 1),
        body: Center(
          child: Container(
            height: MediaQuery.of(context).size.width/1.2,
            width: MediaQuery.of(context).size.width/1.2,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.contain,
                image: AssetImage('assets/images/logo.png'),
              )
            ),
          ),
        ),
      ),
    );
  }


  Future<void> _setup() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    _registerServices();
  }

  void _registerServices(){

    GetIt.instance.registerSingleton<NavigationServices>(NavigationServices());
  }
}
