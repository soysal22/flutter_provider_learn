// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, file_names
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: MyHomePage("Sayı Arttır"),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage(
    this.title,
  );
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Value Notifier'da bir int tanımladık.
  final ValueNotifier<int> _counter = ValueNotifier<int>(0);
  final Widget goodJob = const Text('Good job!');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            ValueListenableBuilder(
              builder: (BuildContext context, int value, Widget? child) {
                // Bu builder sadece _counter değiştiğinde güncellenecek
                return Column(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('$value'),
                    const SizedBox(height: 15),
                    Text(value > 5 ? "Big Value Wow!!" : "Not so big.."),
                  ],
                );
              },
              valueListenable: _counter,
              // The child parameter is most helpful if the child is
              // expensive to build and does not depend on the value from
              // the notifier.
              // child: goodJob,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.plus_one),
        onPressed: () => _counter.value += 1,
      ),
    );
  }
}
