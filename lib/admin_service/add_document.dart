import 'dart:ui';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:page_transition/page_transition.dart';
import '../constants/textstyle.dart';

class AddDocument extends StatefulWidget {
  @override
  _AddDocumentState createState() => _AddDocumentState();
}

class _AddDocumentState extends State<AddDocument> {
  final _auth = FirebaseAuth.instance;
  bool borderColorID = false;
  bool borderWidthID = false;
  bool borderColor = false;
  bool borderWidth = false;
  bool borderColorAnhmh = false;
  bool borderWidthAnhmh = false;
  bool borderColorTghoc = false;
  bool borderWidthTghoc = false;
  bool buttonColor = false;
  TextEditingController idController = new TextEditingController();
  TextEditingController tenmonhocController = new TextEditingController();
  TextEditingController anhmonhocController = new TextEditingController();
  TextEditingController tghocController = new TextEditingController();

  final items = ["Python", "NodeJS", "ReactJS", "Swift"];
  String value;
  final db = FirebaseFirestore.instance.collection("khoahoc");
  void initState() {
    super.initState();
    value = items[0];
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(
                EvaIcons.arrowIosBackOutline,
                size: 28,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            );
          },
        ),
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
        title: Text("THÊM KHÓA HỌC", style: kStyleAboutUsTitle_Expanded),
        centerTitle: true,
      ),
      body: Builder(
        builder: (context) => Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          height: double.infinity,
          width: width,
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                padding: EdgeInsets.only(top: 14, bottom: 14),
                margin: EdgeInsets.only(left: 40, right: 40),
                width: width,
                duration: Duration(milliseconds: 800),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    width: borderWidthID ? 1.5 : 1,
                    color: borderColorID ? Color(0xffFEEF84) : Colors.white,
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Icon(
                        EvaIcons.checkmarkCircle,
                        color: Colors.white,
                        size: 14,
                      ),
                    ),
                    Container(
                      child: Flexible(
                        child: TextFormField(
                          controller: idController,
                          onChanged: (text) {
                            if (text.length > 0) {
                              setState(() {
                                borderColorID = true;
                                borderWidthID = true;
                              });
                            } else {
                              setState(() {
                                borderColorID = false;
                                borderWidthID = false;
                              });
                            }
                          },
                          autocorrect: true,
                          autofocus: false,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w100,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          decoration: InputDecoration.collapsed(
                            hintText: "ID khóa học...",
                            hintStyle: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(height: 30),
              AnimatedContainer(
                padding: EdgeInsets.only(top: 14, bottom: 14),
                margin: EdgeInsets.only(left: 40, right: 40),
                width: width,
                duration: Duration(milliseconds: 800),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    width: borderWidth ? 1.5 : 1,
                    color: borderColor ? Color(0xffFEEF84) : Colors.white,
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Icon(
                        EvaIcons.checkmarkCircle,
                        color: Colors.white,
                        size: 14,
                      ),
                    ),
                    Container(
                      child: Flexible(
                        child: TextFormField(
                          controller: tenmonhocController,
                          onChanged: (text) {
                            if (text.length > 0) {
                              setState(() {
                                borderColor = true;
                                borderWidth = true;
                              });
                            } else {
                              setState(() {
                                borderColor = false;
                                borderWidth = false;
                              });
                            }
                          },
                          autocorrect: true,
                          autofocus: false,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w100,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          decoration: InputDecoration.collapsed(
                            hintText: "Tên khóa học...",
                            hintStyle: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(height: 30),
              AnimatedContainer(
                padding: EdgeInsets.only(top: 14, bottom: 14),
                margin: EdgeInsets.only(left: 40, right: 40),
                width: width,
                duration: Duration(milliseconds: 800),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    width: borderWidthAnhmh ? 1.5 : 1,
                    color: borderColorAnhmh ? Color(0xffFEEF84) : Colors.white,
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Icon(
                        EvaIcons.checkmarkCircle,
                        color: Colors.white,
                        size: 14,
                      ),
                    ),
                    Container(
                      child: Flexible(
                        child: TextFormField(
                          controller: anhmonhocController,
                          onChanged: (text) {
                            if (text.length > 0) {
                              setState(() {
                                borderColorAnhmh = true;
                                borderWidthAnhmh = true;
                              });
                            } else {
                              setState(() {
                                borderColorAnhmh = false;
                                borderWidthAnhmh = false;
                              });
                            }
                          },
                          autocorrect: true,
                          autofocus: false,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w100,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          decoration: InputDecoration.collapsed(
                            hintText: "URL ảnh khóa học...",
                            hintStyle: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(height: 30),
              AnimatedContainer(
                padding: EdgeInsets.only(top: 14, bottom: 14),
                margin: EdgeInsets.only(left: 40, right: 40),
                width: width,
                duration: Duration(milliseconds: 800),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    width: borderWidthTghoc ? 1.5 : 1,
                    color: borderColorTghoc ? Color(0xffFEEF84) : Colors.white,
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Icon(
                        EvaIcons.checkmarkCircle,
                        color: Colors.white,
                        size: 14,
                      ),
                    ),
                    Container(
                      child: Flexible(
                        child: TextFormField(
                          controller: tghocController,
                          onChanged: (text) {
                            if (text.length > 0) {
                              setState(() {
                                borderColorTghoc = true;
                                borderWidthTghoc = true;
                              });
                            } else {
                              setState(() {
                                borderColorTghoc = false;
                                borderWidthTghoc = false;
                              });
                            }
                          },
                          autocorrect: true,
                          autofocus: false,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w100,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          decoration: InputDecoration.collapsed(
                            hintText: "Thời gian học...",
                            hintStyle: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(height: 30),
              AnimatedContainer(
                margin: EdgeInsets.only(left: 40, right: 40),
                padding: EdgeInsets.only(left: 14, right: 14),
                width: width,
                duration: Duration(milliseconds: 800),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    width: borderWidthTghoc ? 1.5 : 1,
                    color: borderColorTghoc ? Color(0xffFEEF84) : Colors.white,
                  ),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    dropdownColor: Colors.black,
                    icon: Icon(EvaIcons.arrowIosDownward, size: 20, color: Colors.white),
                    value: value,
                    isExpanded: true,
                    items: items.map(buildMenuItem).toList(),
                    onChanged: (value) {
                      setState(() => this.value = value);
                      print(value);
                    },
                  ),
                ),
              ),
              Container(height: 30),
              GestureDetector(
                onTap: () {
                  final String idkh = idController.text.trim();
                  final String tenkh = tenmonhocController.text.trim();
                  final String urlkh = anhmonhocController.text.trim();
                  final String tghoc = tghocController.text.trim();
                  if (tenkh.isEmpty || urlkh.isEmpty || idkh.isEmpty) {
                    showErrorSnackBar(
                      "Vui lòng điền đẩy đủ thông tin khóa học.",
                      context,
                    );
                  } else {
                    addDocument(value.toLowerCase(), idkh, urlkh, tenkh, tghoc);
                  }
                },
                child: Container(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  margin: EdgeInsets.only(left: 40, right: 40),
                  width: width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      width: borderWidthTghoc ? 1.5 : 1,
                      color: borderColorTghoc ? Color(0xffFEEF84) : Colors.white,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "THÊM",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void showErrorSnackBar(String e, BuildContext context) {
    final snackbar = SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Icon(
              FontAwesome5Solid.exclamation_circle,
              color: Color(0xffb03351),
              size: 14,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 6, right: 6),
            child: Text(e, style: kStyleErrorLogin),
          ),
        ],
      ),
    );
    Scaffold.of(context)..showSnackBar(snackbar);
  }

  void addDocument(String ngonngu, String id, String anhmonhoc, String tenmonhoc, String tghoc) async {
    try {
      await db.doc(ngonngu.toLowerCase()).collection("monhoc").doc(id).set(
        {
          "anhmonhoc": "assets/images/" + anhmonhoc,
          "tenmonhoc": tenmonhoc,
          "tghoc": tghoc,
        },
      );
      setState(() {
        tenmonhocController.clear();
        tghocController.clear();
        idController.clear();
        anhmonhocController.clear();
      });
    } catch (e) {
      print(e);
    }
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: kStyleKLessonDetailTitle_Expanded,
        ),
      );
}
