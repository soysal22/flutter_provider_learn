// ignore_for_file: must_be_immutable, unused_local_variable, unused_element, prefer_const_constructors
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:mvm_modul_todos/core/constants/constant.dart';
import 'package:mvm_modul_todos/core/models/todos_model.dart';
import 'package:mvm_modul_todos/core/shared/text_black_appBar.dart';
import 'package:mvm_modul_todos/core/shared/text_black_listTitle.dart';

class TodosViewEski extends StatefulWidget {
  const TodosViewEski({super.key});

  @override
  State<TodosViewEski> createState() => _TodosViewEskiState();
}

class _TodosViewEskiState extends State<TodosViewEski> {
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
      body: _placeHolderTodosWidget,
    );
  }

  Widget get _placeHolderTodosWidget => FutureBuilder<List<TodosModel>>(
        future: _placeHolderPost(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Card(
                    elevation: 5,
                    child: ListTile(
                      title: TextBlackListTile(
                          title: snapshot.data?[index].title ?? "title"),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(child: const CircularProgressIndicator());
          }
        },
      );
}
