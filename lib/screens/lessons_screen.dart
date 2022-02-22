import 'package:flutter/material.dart';
import '../constants/textstyle.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:page_transition/page_transition.dart';

class LessonsPage extends StatefulWidget {
  int index;
  String idkh, ngonngu;
  LessonsPage(this.ngonngu, this.idkh, this.index);
  @override
  _LessonsPageState createState() => _LessonsPageState(this.ngonngu, this.idkh, this.index);
}

class _LessonsPageState extends State<LessonsPage> {
  bool isExpanded = false;
  final _auth = FirebaseAuth.instance;

  var _scrollController = new ScrollController();
  final int index;
  final String idkh, ngonngu;
  _LessonsPageState(this.ngonngu, this.idkh, this.index);
  double _opacity = 1;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    _scrollController.addListener(() {
      if (_scrollController.position.pixels < 400) {
        setState(() {
          isExpanded = false;
        });
      } else if (_scrollController.position.pixels > 210) {
        setState(() {
          isExpanded = true;
        });
      }
      if (_scrollController.position.pixels < 0) {
        _opacity = _opacity + _scrollController.position.pixels / 30000000;
      } else if (_scrollController.position.pixels >= -200) {
        _opacity = 1;
      }
    });
    final db = FirebaseFirestore.instance
        .collection("khoahoc")
        .doc(ngonngu.toLowerCase())
        .collection("monhoc")
        .doc(idkh)
        .collection("cacbaihoc");

    return StreamBuilder<QuerySnapshot>(
        stream: db.snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(
              child: CircularProgressIndicator.adaptive(),
            );

          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              leading: Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    icon: Icon(
                      EvaIcons.arrowIosBackOutline,
                      size: 28,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  );
                },
              ),
              backgroundColor: isExpanded ? Colors.white : Colors.transparent,
              elevation: 0,
              toolbarHeight: 40,
              title: isExpanded
                  ? Text("${snapshot.data.docs[index]["tieude"]}", style: kStyleFilteredTitle_Expanded)
                  : Text(""),
              centerTitle: true,
            ),
            body: Container(
              height: double.infinity,
              child: SingleChildScrollView(
                controller: _scrollController,
                physics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: width,
                      child: Opacity(
                        opacity: _opacity,
                        child: Image.asset(
                          snapshot.data.docs[index]["anhbaihoc"],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      child: Text("${snapshot.data.docs[index]["tieude"]},"),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
