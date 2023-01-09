// ignore_for_file: must_be_immutable, unused_local_variable, unused_element, prefer_const_constructors
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:mvm_modul_todos/core/constants/constant.dart';
import 'package:mvm_modul_todos/core/models/todos_model.dart';
import 'package:mvm_modul_todos/core/shared/text_black_appBar.dart';
import 'package:provider/provider.dart';

class TodosView extends StatefulWidget {
  const TodosView({super.key});

  @override
  State<TodosView> createState() => _TodosViewState();
}

class _TodosViewState extends State<TodosView> {
  List<TodosModel>? modelListem;

  @override
  void initState() {
    super.initState();
    _placeHolderPost();
  }

  Future<List<TodosModel>> _placeHolderPost() async {
    final url = Uri.parse(Constants.TODOS_URL);
    final response = await http.get(url);
    List jsonDecode = json.decode(response.body);

    var post = jsonDecode.map((data) => TodosModel.fromJson(data)).toList();
    return post;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.colorWhite,
        centerTitle: true,
        title: TextBlackList(title: Constants.appBarTitle),
      ),
      body: Consumer<TodosModel>(
        builder: (context, value, child) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return ListTile();
            },
          );
        },
      ),
    );
  }
}
