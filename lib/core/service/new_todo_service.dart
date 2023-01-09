// ignore_for_file: unused_local_variable, prefer_typing_uninitialized_variables, non_constant_identifier_names, avoid_print

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mvm_modul_todos/core/constants/constant.dart';
import 'package:http/http.dart' as http;
import 'package:mvm_modul_todos/core/models/todos_model.dart';

class NewTodoApiService extends ChangeNotifier {
  List? title;
  List? completed;
  Future getAll() async {
    var Url = Uri.parse(Constants.TODOS_URL);

    var response = await http.get(Url);
    if (response.statusCode == 200) {
      var data = response.body;
      final jsonDecode = json.decode(response.body) as List;

      title = jsonDecode.map((e) => TodosModel.fromJson(e).title).toList();

      completed =
          jsonDecode.map((e) => TodosModel.fromJson(e).completed).toList();

      notifyListeners();

      return title;
    }
  }
}
