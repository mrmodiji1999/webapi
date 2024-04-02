import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webkul1/bloc/flutter_bloc.dart';
import 'package:webkul1/bloc/flutter_event.dart';

class LoginPageScreen extends StatefulWidget {
  const LoginPageScreen({super.key});

  @override
  State<LoginPageScreen> createState() => _LoginPageScreenState();
}

class _LoginPageScreenState extends State<LoginPageScreen> {
  TextEditingController Email = TextEditingController();
  TextEditingController Password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('data add kre huwe'),),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                  label: Text('Email'), border: OutlineInputBorder()),
              controller: Email,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                  label: Text('Password'), border: OutlineInputBorder()),
              controller: Password,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FilledButton(
                onPressed: () {
                  if (Email.text.isEmpty) {
                    snakbar('enter name ');
                  } else if (Password.text.isEmpty) {
                    snakbar('enter passwd');
                  } else {
                    snakbar('Data recived success');
                    print('text page se ${Email.text}${Password.text}');
                    context.read<FlutterBloc>().add(ApiDataSendEvent(Email: Email.text, Password: Password.text));
               //  Email.clear();Password.clear();
                  }
                },
                child: Text('submit')),
          ),

  Padding(
            padding: const EdgeInsets.all(8.0),
            child: FilledButton(
                onPressed: () {
                  // if (name.text.isEmpty) {
                  //   snakbar('enter name ');
                  // } else if (password.text.isEmpty) {
                  //   snakbar('enter passwd');
                  // } else {
                    snakbar('Data recived success');
                    print('text page se ${Email.text}${Password.text}');
                    context.read<FlutterBloc>().add(ApiDataSendEvent(Email: Email.text, Password: Password.text));
                //  name.clear();password.clear();
                  // }
                },
                child: Text('to show data')),
          )

        ],
      ),
    );
  }

  void snakbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(duration: Duration(seconds: 1), content: Text(message)));
  }
}
