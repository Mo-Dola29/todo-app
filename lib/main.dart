

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/home_screen.dart';
import 'package:todo/list_provider.dart';
import 'package:todo/mythemeData.dart';
import 'package:firebase_core/firebase_core.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(

  );
  FirebaseFirestore.instance.settings=
  Settings(persistenceEnabled: true);
  FirebaseFirestore.instance.settings=
      Settings(cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);
  await FirebaseFirestore.instance.disableNetwork();
  runApp(  ChangeNotifierProvider(
      create: (context)=>ListProvider(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To Do',
      theme: MyThemeData.Light_theme,
       routes: {
        HomeScreen.route_name:(context)=>  HomeScreen()
       },
      initialRoute: HomeScreen.route_name,
    );
  }
}



