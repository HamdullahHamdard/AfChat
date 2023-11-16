import 'package:afchat/services/cloud_storage_services.dart';
import 'package:afchat/services/database_services.dart';
import 'package:afchat/services/media_services.dart';
import 'package:afchat/services/navigation_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class HomeScreen extends StatefulWidget {
   final VoidCallback onInitializationComplete;

   const HomeScreen({Key? key, required this.onInitializationComplete}): super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    _initializeAsyncDependencies();

  }
  Future<void> _initializeAsyncDependencies() async {
    // >>> initialize async dependencies <<<
    // >>> register favorite dependency manager <<<
    // >>> reap benefits <<<
    Future.delayed(Duration(milliseconds: 2300)).then((_){
      _setup().then((_) {
        widget.onInitializationComplete();
      });
    });
    // Future.delayed(
    //   Duration(milliseconds: 2000),
    //       () => ,
    // ).then((value) => _setup());
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
    GetIt.instance.registerSingleton<MediaServices>(MediaServices());
    GetIt.instance.registerSingleton<CloudStorageServices>(CloudStorageServices());
    GetIt.instance.registerSingleton<DatabaseServices>(DatabaseServices());
  }
}
