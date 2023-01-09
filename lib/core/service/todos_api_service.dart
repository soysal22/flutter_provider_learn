// ignore_for_file: unused_local_variable, prefer_typing_uninitialized_variables, non_constant_identifier_names, avoid_print

import 'dart:convert';
import 'package:mvm_modul_todos/core/constants/constant.dart';
import 'package:http/http.dart' as http;
import 'package:mvm_modul_todos/core/models/todos_model.dart';

class TodosApi {
  static Future getTodos() async {
    var post;
    var Url = Uri.parse(Constants.TODOS_URL);

    var response = await http.get(Url);
    if (response.statusCode == 200) {
      var data = response.body;
      var jsonDecode = json.decode(response.body);
      post = jsonDecode.map((data) => TodosModel.fromJson(data)).toList();
    } else {
      print("İstek başarısız oldu ==> ${response.statusCode}");
    }
    print(post);
    return post;
  }
}
