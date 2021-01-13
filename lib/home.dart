import 'dart:convert';
import 'package:flutter/material.dart';
import './api.dart';
import './login.dart';

// Create storage
@override
class Home extends StatelessWidget {
  @override
  @override
  Widget build(BuildContext context) {
    Network().event(1);

    return Scaffold(
      appBar: AppBar(
        title: Text('Test App'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Welcome ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Center(
              child: RaisedButton(
                elevation: 10,
                onPressed: () {
                  var result = Network().logout();
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) => Login()));
                },
                color: Colors.teal,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Text('Logout'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
