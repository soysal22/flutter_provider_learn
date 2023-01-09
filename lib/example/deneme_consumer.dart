// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyAppState extends ChangeNotifier {
  //ChangeNotifier ile yazılmış çok basit bir state
  List<String> people = [];

  addPerson(String name) {
    people.add(name);

    //State'in değiştiğini haber et.
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          //Provider'ımızı buraya koyuyoyuz ve bu noktadan itibaren tüm widget'lerimize MyAppState classını provide edebiliriz.
          child: ChangeNotifierProvider(
              create: (context) => MyAppState(),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [MyTextWidget(), MyButtonWidget()])),
        ),
      ),
    );
  }
}

class MyTextWidget extends StatelessWidget {
  const MyTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    //Consumer yukarı doğru provide edilen bir 'MyAppState' var mı diye arıyor, bulduğunda ise o classın değerini bize sağlıyor.
    //Parametreler ise sırayla
    //context, bildiğimiz context
    //state (genellikle model de denir) 'MyAppState' class'ımızın kendisi (yani methodlara ve property'lere buradan ulaşıyoruz)
    //child ise rebuild edilmeyen child widget'ların yerine geçiyor.
    return Consumer<MyAppState>(
      builder: (context, state, child) {
        return Text("People Number: ${state.people.length}");
      },
    );
  }
}

class MyButtonWidget extends StatelessWidget {
  const MyButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        child: const Text("Add 'Şemsettin'"),
        onPressed: () {
          //Burada Consumer yerine Provider.of kullandık. Provider.of direkt olarak bizim classımızı alıyor ve class fonksiyonlarımızı
          //bu şekilde kullanabiliyoruz. 'listen: false' ise MyButtonWidget'de AppState'e bağlı olarak değişen hiçbir şey olmadığı için state'i
          //dinlemiyoruz anlamına geliyor. Eğer 'listen: false' koymasaydık bu widget sürekli sürekli rebuild edilip duracaktı.
          Provider.of<MyAppState>(context, listen: false)
              .addPerson("Şemsettin");
        });
  }
}
