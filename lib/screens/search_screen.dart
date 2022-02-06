import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final db = FirebaseFirestore.instance
      .collection("khoahoc")
      .doc("language")
      .collection("python")
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: db,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return CircularProgressIndicator();
          return Container(
            height: 80,
            width: 210,
            color: Colors.black,
            child: Text(
              snapshot.data.docs[0]['tenmonhoc'].toString(),
              style: TextStyle(color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}
