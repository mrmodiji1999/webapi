import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webkul1/bloc/flutter_bloc.dart';
import 'package:webkul1/ui/homepage.dart';
import 'package:webkul1/ui/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => FlutterBloc(),
      child: MaterialApp(debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
    
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:const SplashScreen()
    )
    );
  }
}
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void pref()async{
     SharedPreferences sp = await SharedPreferences.getInstance();
    bool islogin = sp.getBool('IsLogin')??false;
    print(islogin);
     Timer(Duration(seconds: 2),()=>!islogin?

      Navigator.push(context, MaterialPageRoute(builder: (context)=>PostDataPage())) :
    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPageScreen())) );


  }
  void initState() {
    
  
    super.initState();
   pref();
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Center(child: Text('Narendra',style: Theme.of(context).textTheme.displayLarge?.copyWith(color: Colors.red),),),
      ),
    );
  }
}