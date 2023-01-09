// ignore_for_file: avoid_types_as_parameter_names

import 'package:flutter/material.dart';
import 'package:mvm_modul_todos/example/deneme_consumer.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class AppModel extends ChangeNotifier {
  //ChangeNotifier ile yazılmış çok basit bir state
  List<String> peopleList = [];

  addPerson(String name) {
    peopleList.add(name);

    //State'in değiştiğini haber et.
    notifyListeners();
  }
}

class SelectorLearn extends StatelessWidget {
  const SelectorLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        //Provider'ımızı buraya koyuyoyuz ve bu noktadan itibaren tüm widget'lerimize MyAppState classını provide edebiliriz.
        child: ChangeNotifierProvider(
            create: (context) => MyAppState(), child: const MyTextWidget()),
      ),
    );
  }
}

class MyTextWidget extends StatelessWidget {
  const MyTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Selector Type olarak <Model'in Type'i (M), Neyin değiştiğini kontrol ettiğimiz type (F)> alıyor.
    //Consumer'dan farklı olarak selector diye bir parametre alıyor. Bu parametre M'i parametre olarak alan ve F dönen bir fonksiyondur.
    //'selector: (_, model) => int/string/List/Map vs.' kısmında değişince widgetları değiştiren datayı dönmeniz gerekiyor.
    //Böylece geri kalan değişikliklerde widget'i gereksiz yere rebuild yapmış olmazsınız.
    return Selector<AppModel, List<String>>(
        selector: (_, model) => model.peopleList, //Type of List<String>,
        // ignore: non_constant_identifier_names
        builder: (_, AppModel, __) {
          return Text(
              "First Person: ${AppModel[0]}, People Count: ${AppModel.length}");
        });
  }
}
