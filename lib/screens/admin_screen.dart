import 'dart:ui';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:page_transition/page_transition.dart';
import 'package:travel/admin_service/add_document.dart';
import 'package:travel/admin_service/update_document.dart';
import 'package:travel/screens/main_screen.dart';
import '../constants/textstyle.dart';
import '../models/monhoc.dart';

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  final _auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance.collection("khoahoc");
  final listbaihoc = [bh03];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
            child: Container(
              color: Colors.white.withOpacity(0.01),
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        toolbarHeight: 50,
        title: Text("DASHBOARD", style: kStyleAboutUsTitle_Expanded),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: new LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff6A74DB),
              Color(0xff6D68CB),
              Color(0xff7A5FB7),
              Color(0xffB169AC),
              Color(0xffFF79A0),
            ],
          ),
        ),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                  ),
                  child: Text("Welcome Administrator"),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                  ),
                  child: GridView.count(
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: 1.2,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.rightToLeftWithFade,
                              curve: Curves.easeInOut,
                              reverseDuration: Duration(milliseconds: 300),
                              duration: Duration(milliseconds: 300),
                              child: AddDocument(),
                            ),
                          );
                        },
                        child: ClipRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white12,
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(14),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(EvaIcons.plus, size: 30, color: Colors.white),
                                    Padding(
                                      padding: EdgeInsets.only(top: 8.0),
                                      child: Text("Thêm khóa học", style: kStyleAdminItem),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.rightToLeftWithFade,
                              curve: Curves.easeInOut,
                              reverseDuration: Duration(milliseconds: 300),
                              duration: Duration(milliseconds: 300),
                              child: UpdateDocument(),
                            ),
                          );
                        },
                        child: ClipRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white12,
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(14),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(EvaIcons.edit2Outline, size: 30, color: Colors.white),
                                    Padding(
                                      padding: EdgeInsets.only(top: 8.0),
                                      child: Text("Thêm bài học", style: kStyleAdminItem),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          for (int i = 0; i < listbaihoc.length; i++) {
                            final data = listbaihoc[i];
                            addBaihocAuto(data.ngonngu, data.id, data.tieude, data.anhbaihoc, data.giaithich,
                                data.mucnho, data.noidung);
                          }
                        },
                        child: ClipRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white12,
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(14),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(EvaIcons.edit2Outline, size: 30, color: Colors.white),
                                    Padding(
                                      padding: EdgeInsets.only(top: 8.0),
                                      child: Text("Tự động thêm khóa học", style: kStyleAdminItem),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 150),
                  child: Container(
                    width: width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.bottomToTop,
                                curve: Curves.easeInOut,
                                reverseDuration: Duration(milliseconds: 300),
                                duration: Duration(milliseconds: 300),
                                child: Home(),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white12),
                            padding: EdgeInsets.all(14),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(EvaIcons.arrowBack, size: 20, color: Colors.white),
                                Text("Trở về HOME"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void addBaihocAuto(
      String ngonngu, String id, String tieude, String anhbaihoc, List giaithich, List mucnho, List noidung) async {
    try {
      await db.doc(ngonngu.toLowerCase()).collection("monhoc").doc("python_coban").collection("cacbaihoc").doc(id).set(
        {
          "anhbaihoc": "assets/images/python_coban/${anhbaihoc}.png",
          "tieude": tieude,
          "giaithich": giaithich,
          "mucnho": mucnho,
          "noidung": noidung,
        },
      );
    } catch (e) {
      print(e);
    }
  }
}
