import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
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
  final _auth = FirebaseAuth.instance;

  var _scrollController = new ScrollController();
  final int index;
  final String idkh, ngonngu;
  _LessonsPageState(this.ngonngu, this.idkh, this.index);
  var indexSwiper = 0;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
          final part = snapshot.data.docs[index]["tieude"].toString().split(": ");
          final tieude = part[1].trim().toString();
          final totalItem = snapshot.data.docs[index]["mucnho"].length;
          return Scaffold(
            resizeToAvoidBottomInset: false,
            extendBodyBehindAppBar: true,
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
              backgroundColor: Colors.transparent,
              elevation: 0,
              toolbarHeight: 50,
              title: Text("${tieude}", style: kStyleFilteredTitle_Expanded),
              centerTitle: true,
            ),
            body: Container(
              height: height,
              color: Color(0xff152345),
              child: Swiper(
                duration: 1500,
                onIndexChanged: (value) {
                  print(value);
                  HapticFeedback.vibrate();
                },
                physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                itemCount: totalItem + 1,
                layout: SwiperLayout.DEFAULT,
                viewportFraction: 0.87,
                scale: 0.9,
                loop: false,
                index: indexSwiper,
                itemBuilder: (BuildContext context, int i) {
                  if (i == totalItem) {
                    return SafeArea(
                      child: Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                indexSwiper = 0;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xff10162E),
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ClipRect(
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
                                        child: Container(
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(30),
                                            color: Color(0xffe87cac).withOpacity(0.3),
                                          ),
                                          child: Icon(
                                            EvaIcons.arrowIosBack,
                                            size: 40,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(height: 10),
                                    Text(
                                      "Trở lại trang đầu.",
                                      style: kStyleAdminItem,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                  return SafeArea(
                    child: Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: SingleChildScrollView(
                            physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: EdgeInsets.all(14),
                                    child: Text(
                                      snapshot.data.docs[index]["mucnho"][i].toString(),
                                      style: kStyleLessonTile,
                                    )),
                                Image.asset(
                                  snapshot.data.docs[index]["noidung"][i],
                                  width: width,
                                  fit: BoxFit.cover,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(14),
                                  child: Text(
                                    snapshot.data.docs[index]["giaithich"][i].toString().replaceAll("\\n", "\n"),
                                    style: kStyleLessonRichText,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 14),
                                  child: Divider(
                                    height: 6,
                                    thickness: 3,
                                    color: Color(0xffe87cac),
                                    endIndent: 60,
                                    indent: 60,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        });
  }
}
