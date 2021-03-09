import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Firestore firestore = Firestore.instance;

  void create() async {
    try {
      await firestore.collection('Mobile Dev').document('students').setData({
        'firstName': 'Recho',
        'lastName': 'Ayateke',
      });
    } catch (e) {
      print(e);
    }
  }

  void read() async {
    DocumentSnapshot documentSnapshot;
    try {
      documentSnapshot = await firestore.collection('Mobile Dev').document('students').get();
      print(documentSnapshot.data);
    } catch (e) {
      print(e);
    }
  }

  void update() async {
    try {
      firestore.collection('Mobile Dev').document('students').updateData({
        'firstName': 'Christine',
      });
    } catch (e) {
      print(e);
    }
  }

  void delete() async {
    try {
      firestore.collection('users').document('testUser').delete();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase CRUD Example"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          RaisedButton(
            child: Text("Create"),
            onPressed: create,
          ),
          RaisedButton(
            child: Text("Read"),
            onPressed: read,
          ),
          RaisedButton(
            child: Text("Update"),
            onPressed: update,
          ),
          RaisedButton(
            child: Text("Delete"),
            onPressed: delete,
          ),
        ]),
      ),
    );
  }
}
