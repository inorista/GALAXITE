import 'dart:ui';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:page_transition/page_transition.dart';
import '../constants/textstyle.dart';

class UpdateDocument extends StatefulWidget {
  @override
  _UpdateDocumentState createState() => _UpdateDocumentState();
}

class _UpdateDocumentState extends State<UpdateDocument> {
  final _auth = FirebaseAuth.instance;

  TextEditingController idController = new TextEditingController();
  TextEditingController anhmonhocController = new TextEditingController();
  TextEditingController tdhocController = new TextEditingController();
  TextEditingController gioithieuController = new TextEditingController();
  TextEditingController mucnhoController = new TextEditingController();
  TextEditingController noidungchinhController = new TextEditingController();
  TextEditingController viduController = new TextEditingController();
  TextEditingController viduterminalController = new TextEditingController();
  TextEditingController ketquaController = new TextEditingController();
  TextEditingController ketquaterminalController = new TextEditingController();
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
        title: Text("THÊM BÀI HỌC", style: kStyleAboutUsTitle_Expanded),
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
          child: SafeArea(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
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
                        width: 1,
                        color: Colors.white,
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
                                hintText: "ID bài học...",
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
                        width: 1,
                        color: Colors.white,
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
                                hintText: "URL ảnh bài học...",
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
                        width: 1,
                        color: Colors.white,
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
                              controller: tdhocController,
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
                                hintText: "Tiêu đề bài học...",
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
                        width: 1,
                        color: Colors.white,
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
                              controller: gioithieuController,
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
                                hintText: "Giới thiệu chung bài học...",
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
                        width: 1,
                        color: Colors.white,
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
                              controller: mucnhoController,
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
                                hintText: "Các mục nhỏ...",
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
                        width: 1,
                        color: Colors.white,
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
                              controller: noidungchinhController,
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
                                hintText: "Nội dung chính...",
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
                        width: 1,
                        color: Colors.white,
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
                              controller: viduController,
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
                                hintText: "Ví dụ...",
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
                        width: 1,
                        color: Colors.white,
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
                              controller: viduterminalController,
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
                                hintText: "Ví dụ khi in ra kết quả...",
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
                        width: 1,
                        color: Colors.white,
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
                              controller: ketquaController,
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
                                hintText: "Kết quả...",
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
                        width: 1,
                        color: Colors.white,
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
                              controller: ketquaterminalController,
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
                                hintText: "Kết quả khi in ra kết quả...",
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
                        width: 1,
                        color: Colors.white,
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
                      final String urlkh = anhmonhocController.text.trim();
                      final String tdhoc = tdhocController.text.trim();
                      final String gioithieu = gioithieuController.text.trim();
                      final String mucnho = mucnhoController.text.trim();
                      final String noidungchinh = noidungchinhController.text.trim();
                      final String vidu = viduController.text.trim();
                      final String invidu = viduterminalController.text.trim();
                      final String ketqua = ketquaController.text.trim();
                      final String inketqua = ketquaterminalController.text.trim();
                      if (tdhoc.isEmpty || urlkh.isEmpty || idkh.isEmpty) {
                        showErrorSnackBar(
                          "Vui lòng điền đẩy đủ thông tin khóa học.",
                          context,
                        );
                      } else {
                        addBaihoc(value.toLowerCase(), idkh, urlkh, tdhoc, gioithieu, mucnho, noidungchinh, vidu,
                            invidu, ketqua, inketqua);
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
                          width: 1,
                          color: Colors.white,
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

  void addBaihoc(String ngonngu, String id, String url, String tieude, String gioithieu, String mucnho,
      String noidungchinh, String vidu, String invidu, String ketqua, String inketqua) async {
    try {
      await db.doc(ngonngu.toLowerCase()).collection("monhoc").doc("python_coban").collection("cacbaihoc").doc(id).set(
        {
          "anhbaihoc": "assets/images/python/" + url + ".png",
          "tieude": tieude,
          "gioithieu": gioithieu,
          "mucnho": [mucnho],
          "noidungchinh": [noidungchinh],
          "vidu": [vidu],
          "invidu": [invidu],
          "ketqua": [ketqua],
          "inketqua": [inketqua],
        },
      );
      setState(() {
        tdhocController.clear();
        idController.clear();
        anhmonhocController.clear();
        idController.clear();
        anhmonhocController.clear();
        tdhocController.clear();
        gioithieuController.clear();
        mucnhoController.clear();
        noidungchinhController.clear();
        viduterminalController.clear();
        ketquaterminalController.clear();
      });
    } catch (e) {
      print(e);
    }
  }

  void addBaihocAuto(String ngonngu, String id, String url, String tieude, String gioithieu, List mucnho,
      List noidungchinh, List vidu, List invidu, List ketqua, List inketqua, List output) async {
    try {
      await db.doc(ngonngu.toLowerCase()).collection("monhoc").doc("python_coban").collection("cacbaihoc").doc(id).set(
        {
          "anhbaihoc": "assets/images/python/" + url + ".png",
          "tieude": tieude,
          "gioithieu": gioithieu,
          "mucnho": [mucnho],
          "noidungchinh": [noidungchinh],
          "vidu": [vidu],
          "invidu": [invidu],
          "ketqua": [ketqua],
          "inketqua": [inketqua],
          "output": output,
        },
      );
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
