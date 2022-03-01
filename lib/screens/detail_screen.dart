import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:page_transition/page_transition.dart';
import 'package:travel/screens/lessons_screen.dart';
import '../constants/textstyle.dart';

class DetailPage extends StatefulWidget {
  int index;
  String id, ngonngu;
  DetailPage(this.index, this.id, this.ngonngu);
  @override
  _DetailPageState createState() => _DetailPageState(this.id, this.index, this.ngonngu);
}

class _DetailPageState extends State<DetailPage> {
  bool isExpanded = false;
  var _scrollController = new ScrollController();
  final int index;
  final String id, ngonngu;
  _DetailPageState(this.id, this.index, this.ngonngu);
  final _auth = FirebaseAuth.instance;
  double _opacity = 0.01;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    ///ScrollController
    _scrollController.addListener(() {
      if (_scrollController.position.pixels < 400) {
        setState(() {
          isExpanded = false;
          _opacity = 0;
        });
      }
      if (_scrollController.position.pixels > 210) {
        setState(() {
          isExpanded = true;
          _opacity = 1;
        });
      }
    });
    final db = FirebaseFirestore.instance.collection("khoahoc").doc(ngonngu.toLowerCase()).collection("monhoc");

    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: db.snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(
              child: CircularProgressIndicator.adaptive(),
            );
          return Stack(
            children: [
              SafeArea(
                child: CustomScrollView(
                  controller: _scrollController,
                  physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                  slivers: [
                    SliverAppBar(
                      backgroundColor: Colors.white,
                      expandedHeight: 220,
                      toolbarHeight: 54,
                      elevation: 0.0,
                      floating: true,
                      pinned: true,
                      leading: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Opacity(
                              opacity: 0.3,
                              child: Container(
                                margin: EdgeInsets.only(left: 14),
                                decoration: BoxDecoration(color: Colors.black, shape: BoxShape.circle),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 12),
                              child: Image.asset(
                                "assets/images/arrow.png",
                                width: 16,
                                height: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      leadingWidth: 44,
                      stretch: true,
                      flexibleSpace: FlexibleSpaceBar(
                        title: AnimatedOpacity(
                          duration: Duration(milliseconds: 300),
                          opacity: _opacity,
                          child: Text(
                            "Môn học ${snapshot.data.docs[index]["tenmonhoc"]}",
                            style: kStyleDetailTitle_Expanded,
                          ),
                        ),
                        centerTitle: true,
                        background: Image.asset(
                          snapshot.data.docs[index]["anhmonhoc"],
                          fit: BoxFit.cover,
                        ),
                        stretchModes: [
                          StretchMode.zoomBackground,
                          StretchMode.blurBackground,
                          StretchMode.fadeTitle,
                        ],
                      ),
                    ),
                    SliverToBoxAdapter(
                        child: StreamBuilder(
                      stream: db.doc(id).collection("cacbaihoc").snapshots(),
                      builder: (context, snapshots) {
                        if (!snapshots.hasData)
                          return Center(
                            child: CircularProgressIndicator.adaptive(),
                          );
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: [
                              Container(height: 20),
                              Text(
                                "Môn học ${snapshot.data.docs[index]["tenmonhoc"]}",
                                style: kStyleDetail_text,
                              ),
                              Container(height: 10),
                              Divider(
                                height: 6,
                                thickness: 3,
                                color: Color(0xffe87cac),
                                endIndent: 120,
                                indent: 120,
                              ),
                              Container(height: 20),
                              if (snapshots.data.docs.length != 0)
                                Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 12, right: 12),
                                      child: GridView.builder(
                                        physics: NeverScrollableScrollPhysics(),
                                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 20,
                                          mainAxisSpacing: 20,
                                          mainAxisExtent: 154,
                                        ),
                                        primary: false,
                                        shrinkWrap: true,
                                        itemCount: snapshots.data.docs.length,
                                        itemBuilder: (context, i) => GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              PageTransition(
                                                type: PageTransitionType.bottomToTop,
                                                curve: Curves.easeInOut,
                                                reverseDuration: Duration(milliseconds: 300),
                                                duration: Duration(milliseconds: 300),
                                                child: LessonsPage(ngonngu, snapshot.data.docs[index].id.toString(), i),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            width: MediaQuery.of(context).size.width,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              color: Color(0xffe2eeec),
                                            ),
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: 110,
                                                  child: ClipRRect(
                                                    borderRadius: BorderRadius.only(
                                                        topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                                                    child: Image.asset(
                                                      snapshots.data.docs[i]["anhbaihoc"],
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  height: 5,
                                                ),
                                                Container(
                                                  padding: EdgeInsets.only(left: 12, right: 12),
                                                  child: Text(
                                                    snapshots.data.docs[i]["tieude"],
                                                    style: kStyleLessionTitle,
                                                    textAlign: TextAlign.left,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(top: 50, bottom: 50),
                                      child: Text("Bạn đã xem hết!", style: kStyleEnd),
                                    ),
                                  ],
                                ),
                              if (snapshots.data.docs.length == 0)
                                Container(
                                  padding: EdgeInsets.only(top: 120),
                                  child: Column(
                                    children: [
                                      Center(
                                        child: Text(
                                          "Hiện khóa học chưa được ra mắt!",
                                          style: kStyleError,
                                        ),
                                      ),
                                      Container(
                                        height: 30,
                                      ),
                                      Image.asset(
                                        "assets/images/icon (2).png",
                                        width: 250,
                                        height: 250,
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        );
                      },
                    )),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
