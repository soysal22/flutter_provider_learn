// ignore_for_file: must_be_immutable, unused_local_variable, unused_element, prefer_const_constructors, unnecessary_null_comparison
import 'package:flutter/material.dart';
import 'package:mvm_modul_todos/core/constants/constant.dart';
import 'package:mvm_modul_todos/core/service/new_todo_service.dart';
import 'package:mvm_modul_todos/core/shared/text_black_appBar.dart';
import 'package:mvm_modul_todos/core/shared/text_black_listTitle.dart';
import 'package:provider/provider.dart';

class TodosViewDetail extends StatefulWidget {
  const TodosViewDetail({super.key});

  @override
  State<TodosViewDetail> createState() => _TodosViewDetailState();
}

class _TodosViewDetailState extends State<TodosViewDetail> {
  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   Provider.of<NewTodoApiService>(context, listen: false).getAll();
    // });
    Provider.of<NewTodoApiService>(context, listen: false).getAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Constants.colorWhite,
          centerTitle: true,
          title: TextBlackList(title: Constants.appBarTitle),
        ),
        body: Consumer<NewTodoApiService>(
          builder: (context, value, child) {
            return value.title?.length == null
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: value.title?.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 5,
                        margin: EdgeInsets.all(10),
                        child: ListTile(
                          title: TextBlackListTile(
                            color: Constants.colorRed,
                            title: value.title?[index] ?? "title",
                          ),
                          subtitle: TextBlackListTile(
                            title: "${value.completed?[index]}",
                          ),
                        ),
                      );
                    },
                  );
          },
        ));
  }
}
