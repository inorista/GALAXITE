import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:page_transition/page_transition.dart';
import '../constants/textstyle.dart';
import 'aboutus_screen.dart';
import './detail_screen.dart';

class FilteredPage extends StatefulWidget {
  String ngonngu;
  FilteredPage(this.ngonngu);
  @override
  _FilteredPageState createState() => _FilteredPageState(this.ngonngu);
}

class _FilteredPageState extends State<FilteredPage> {
  bool isExpanded = false;
  var _scrollController = new ScrollController();
  /////////CONSTRUCTOR
  final String ngonngu;
  _FilteredPageState(this.ngonngu);
  final _auth = FirebaseAuth.instance;

  /////////FETCH DATA WITH FILTER
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    _scrollController.addListener(() {
      if (_scrollController.position.pixels < 400) {
        setState(() {
          isExpanded = false;
        });
      }
      if (_scrollController.position.pixels > 210) {
        setState(() {
          isExpanded = true;
        });
      }
    });

    final db_filterd = FirebaseFirestore.instance.collection("khoahoc").doc(ngonngu.toLowerCase());

    return Scaffold(
      //backgroundColor:
      extendBodyBehindAppBar: true,
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xff3D2946),
                image: DecorationImage(
                  image: AssetImage("assets/images/drawer.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 34,
                      child: Icon(
                        FontAwesome5Solid.user_astronaut,
                        color: Color(0xffe87cac),
                        size: 40,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(_auth.currentUser.email, style: kStyleDrawerEmail),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.bottomToTop,
                    curve: Curves.easeInOut,
                    reverseDuration: Duration(milliseconds: 300),
                    duration: Duration(milliseconds: 300),
                    child: AboutUsPage(),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 0.1, color: Colors.black),
                  ),
                ),
                child: ListTile(
                  leading: Icon(
                    FontAwesome5Solid.users,
                    color: Colors.black.withOpacity(0.8),
                    size: 22,
                  ),
                  title: Text("Về nhà phát triển", style: kStyleListTitle),
                  trailing: Icon(
                    FontAwesome5Solid.arrow_right,
                    color: Color(0xffe87cac),
                    size: 14,
                  ),
                ),
              ),
            ),
            Container(
              height: 500,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Signout(context);
                    },
                    child: AnimatedContainer(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      margin: EdgeInsets.only(left: 40, right: 40, top: 50),
                      width: width,
                      duration: Duration(milliseconds: 800),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xff3e4680),
                        border: Border.all(
                          width: 1.5,
                          color: Color(0xff3e4680),
                        ),
                      ),
                      child: Text(
                        "Đăng Xuất",
                        style: kStyleButtonLogout,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(
                EvaIcons.arrowIosBackOutline,
                size: 28,
                color: isExpanded ? Colors.black : Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            );
          },
        ),
        actions: [
          Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Icon(
                  EvaIcons.moreVerticalOutline,
                  color: isExpanded ? Colors.black : Colors.white,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
        ],
        backgroundColor: isExpanded ? Colors.white : Colors.transparent,
        elevation: 0,
        toolbarHeight: 40,
        title: isExpanded ? Text("Các môn học về ngôn ngữ ${ngonngu}", style: kStyleFilteredTitle_Expanded) : Text(""),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: new LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xffC2005F),
              Color(0xff9A0165),
              Color(0xff9A0165),
              Color(0xff74026A),
              Color(0xff74026A),
            ],
          ),
        ),
        child: SingleChildScrollView(
          controller: _scrollController,
          physics: BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          child: Column(
            children: [
              Container(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 22),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Tổng hợp môn học về ",
                          style: kStyleIntroFiltered,
                        ),
                        Text(
                          "${ngonngu}".toUpperCase(),
                          style: kStyleIntroFiltered_language,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 22),
                    child: Image.asset(
                      "assets/images/filtered_icon2.png",
                      width: width - 220,
                    ),
                  ),
                ],
              ),
              Container(height: 30),
              Container(
                constraints: BoxConstraints(minHeight: height - 150),
                padding: EdgeInsets.only(left: 16, right: 16, bottom: 50),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                  color: Colors.white,
                ),
                child: Stack(
                  overflow: Overflow.visible,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40, left: 8),
                      child: Text("Course For You", style: kStyleIntroFiltered_text),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 14),
                      child: StreamBuilder<QuerySnapshot>(
                        stream: db_filterd.collection("monhoc").snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData)
                            return Center(
                              child: CircularProgressIndicator.adaptive(),
                            );
                          return ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: snapshot.data.docs.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.bottomToTop,
                                      curve: Curves.easeInOut,
                                      reverseDuration: Duration(milliseconds: 300),
                                      duration: Duration(milliseconds: 300),
                                      child: DetailPage(index, snapshot.data.docs[index].id, ngonngu),
                                    ),
                                  );
                                },
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 10),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(26),
                                        child: Container(
                                          padding: EdgeInsets.all(8),
                                          color: Color(0xffF3F3F3),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 102,
                                                width: 144,
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.circular(20),
                                                  child: Image.asset(
                                                    snapshot.data.docs[index]["anhmonhoc"],
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.all(14),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "${snapshot.data.docs[index]["tenmonhoc"]}.",
                                                      style: kStyleTitleFiltered,
                                                    ),
                                                    StreamBuilder<QuerySnapshot>(
                                                      stream: db_filterd
                                                          .collection("monhoc")
                                                          .doc(
                                                            snapshot.data.docs[index].id.toString(),
                                                          )
                                                          .collection("cacbaihoc")
                                                          .snapshots(),
                                                      builder: (context, snapshots) {
                                                        if (!snapshots.hasData)
                                                          return Center(
                                                            child: CupertinoActivityIndicator(),
                                                          );

                                                        return Padding(
                                                          padding: EdgeInsets.only(top: 8),
                                                          child: Row(
                                                            children: [
                                                              if (snapshots.data.docs.length > 0)
                                                                Icon(
                                                                  EvaIcons.book,
                                                                  size: 16,
                                                                  color: Colors.pinkAccent,
                                                                ),
                                                              Text(
                                                                (() {
                                                                  if (snapshots.data.docs.length == 0) {
                                                                    return "";
                                                                  }
                                                                  if (snapshots.data.docs.length > 0) {
                                                                    int docslength = snapshots.data.docs.length;
                                                                    if (docslength < 10) {
                                                                      return " Bao gồm 0${docslength.toString()} bài giảng";
                                                                    } else {
                                                                      return " Bao gồm ${docslength.toString()} bài giảng";
                                                                    }
                                                                  }
                                                                })(),
                                                                style: kStyleIntroFiltered_total,
                                                              ),
                                                            ],
                                                          ),
                                                        );

                                                        /*Text(
                                                            "${snapshots.data.docs.length}");*/
                                                      },
                                                    ),
                                                    if (snapshot.data.docs[index]["tghoc"] != "")
                                                      Padding(
                                                        padding: EdgeInsets.only(top: 8),
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                              EvaIcons.clockOutline,
                                                              size: 15,
                                                              color: Colors.pinkAccent,
                                                            ),
                                                            Text(
                                                              " ${snapshot.data.docs[index]["tghoc"]}",
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    if (snapshot.data.docs[index]["tghoc"] == "")
                                                      Padding(
                                                        padding: EdgeInsets.only(top: 8),
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                              EvaIcons.lockOutline,
                                                              size: 15,
                                                              color: Colors.pinkAccent,
                                                            ),
                                                            Text(
                                                              " Khóa học chưa mở",
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 20,
                                      right: 14,
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          color: Color(0xffDC9C0C),
                                        ),
                                        child: Center(
                                          child: Icon(
                                            EvaIcons.arrowRight,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                    Positioned(
                      top: -50,
                      right: 0,
                      child: Image.asset(
                        "assets/images/planet1.png",
                        height: 100,
                        width: 100,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void Signout(context) async {
    try {
      await _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}
