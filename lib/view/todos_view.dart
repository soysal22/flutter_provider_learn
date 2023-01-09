// ignore_for_file: must_be_immutable, unused_local_variable, unused_element, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:mvm_modul_todos/core/constants/constant.dart';
import 'package:mvm_modul_todos/core/models/todos_model.dart';
import 'package:mvm_modul_todos/core/service/todos_api_service.dart';
import 'package:mvm_modul_todos/core/shared/text_black_appBar.dart';
import 'package:mvm_modul_todos/core/shared/text_black_listTitle.dart';

class TodosView extends StatefulWidget {
  const TodosView({super.key});

  @override
  State<TodosView> createState() => _TodosViewState();
}

class _TodosViewState extends State<TodosView> {
  List<TodosModel>? modelListem;

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

  Widget get _placeHolderTodosWidget => FutureBuilder(
        future: TodosApi.getTodos(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                var getData = snapshot.data?[index];
                return Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Card(
                    elevation: 5,
                    child: ListTile(
                      title:
                          TextBlackListTile(title: getData?.title ?? "title"),
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
