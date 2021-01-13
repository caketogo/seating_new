import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './counter.dart';
import './auth.dart';
import './login.dart';
import './home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Counter(),
        ),
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demoee',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        //home: MyHomePage(title: "Seating Planner1"),
        home: CheckAuth(),
      ),
    );
  }
}

class CheckAuth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isAuth = false;

    Widget child;
    if (isAuth) {
      // child = Home();
    } else {
      child = Login();
    }
    return Scaffold(
      body: child,
    );
  }
}

class MyHomePage extends StatelessWidget {
  int _counter = 0;
  final String title;

  MyHomePage({this.title});

  void _incrementCounter(BuildContext context) {
    Provider.of<Counter>(context, listen: false).incrementCounter();
  }

  @override
  Widget build(BuildContext context) {
    var counter = Provider.of<Counter>(context).getCounter;
    var username = Provider.of<Auth>(context).getUser;

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$username now pessed $counter times',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _incrementCounter(context),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
