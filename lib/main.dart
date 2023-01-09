// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:mvm_modul_todos/core/service/new_todo_service.dart';
import 'package:mvm_modul_todos/view/new_todos_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NewTodoApiService()),
      ],
      child: const MaterialApp(
        title: 'Provider List Demo',
        debugShowCheckedModeBanner: false,
        home: NewTodoDetail(),
      ),
    );
  }
}
