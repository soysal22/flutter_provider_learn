// ignore_for_file: must_be_immutable, unused_local_variable, unused_element, prefer_const_constructors, unnecessary_null_comparison
import 'package:flutter/material.dart';
import 'package:mvm_modul_todos/core/constants/constant.dart';
import 'package:mvm_modul_todos/core/service/new_todo_service.dart';
import 'package:mvm_modul_todos/core/shared/text_black_appBar.dart';
import 'package:mvm_modul_todos/core/shared/text_black_listTitle.dart';
import 'package:provider/provider.dart';

class NewTodoDetail extends StatefulWidget {
  const NewTodoDetail({super.key});

  @override
  State<NewTodoDetail> createState() => _NewTodoDetailState();
}

class _NewTodoDetailState extends State<NewTodoDetail> {
  @override
  void initState() {
    super.initState();

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
      body: FutureBuilder(
        future: NewTodoApiService().getAll(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Consumer<NewTodoApiService>(
              builder: (context, value, child) {
                return ListView.builder(
                  itemCount: value.title?.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 5,
                      margin: EdgeInsets.all(10),
                      child: ListTile(
                        title: TextBlackListTile(
                          title: value.title?[index] ?? "title",
                          color: value.completed?[index] == false
                              ? Constants.colorRed
                              : Constants.colorBlack,
                        ),
                        subtitle: TextBlackListTile(
                          title: "${value.completed?[index]}",
                          color: value.completed?[index] == true
                              ? Constants.colorBlue
                              : Constants.colorBlack,
                        ),
                      ),
                    );
                  },
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
