import 'package:flutter/material.dart';
import 'package:travel/screens/detail_screen.dart';
import '../constants/textstyle.dart';
import '../models/monhoc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';

final listS = <monhoc>[python, python_nangcao, reactjs, reactjs_nangcao, nodejs, nodejs_nangcao];

class BodyHome extends StatefulWidget {
  @override
  _BodyHomeState createState() => _BodyHomeState();
}

class _BodyHomeState extends State<BodyHome> {
  bool ChangeColor = false;
  bool borderColor = false;
  double opacity = 0;
  bool displayNameisEmpty = true;
  //////SCREENS
  int currentIndex = 1;
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Builder(
        builder: (context) => SingleChildScrollView(
          physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Stack(
                  children: [
                    Container(
                      height: 300,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/header.gif"),
                          fit: BoxFit.fill,
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(34),
                          bottomRight: Radius.circular(34),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 160,
                            child: Center(child: Text("GALAXITE", style: kStyleHomeIntro)),
                          ),
                          AnimatedContainer(
                            margin: EdgeInsets.only(top: 54),
                            duration: Duration(milliseconds: 450),
                            height: 40,
                            width: MediaQuery.of(context).size.width - 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color(0xfff5f5f5),
                              border:
                                  Border.all(width: 1.85, color: borderColor ? Color(0xffe97eae) : Color(0xfffffff)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: Image.asset(
                                    "assets/images/search_icon.png",
                                    height: 26,
                                    width: 26,
                                  ),
                                ),
                                Container(
                                  child: Flexible(
                                    child: TextField(
                                      onChanged: (text) {
                                        if (text.length > 0) {
                                          setState(() {
                                            borderColor = true;
                                          });
                                        } else {
                                          setState(() {
                                            borderColor = false;
                                          });
                                        }
                                      },
                                      autocorrect: true,
                                      autofocus: false,
                                      style: TextStyle(fontSize: 14),
                                      textAlign: TextAlign.left,
                                      maxLines: 1,
                                      decoration: InputDecoration.collapsed(
                                          hintText: "Tìm kiếm khóa học...", hintStyle: TextStyle(fontSize: 14)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 70,
                      right: 20,
                      child: GestureDetector(
                        onTap: () {
                          Scaffold.of(context).openDrawer();
                        },
                        child: Icon(
                          FontAwesome5Solid.bars,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 14,
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Các khóa học mới",
                                  style: kStyleTitle,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => null));
                                  },
                                  child: Text(
                                    "Xem tất cả",
                                    style: kStyleViewAll,
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              height: 6,
                              thickness: 3,
                              color: Color(0xffe87cac),
                              endIndent: 242,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 14,
                      ),
                      Container(
                        height: 250,
                        margin: EdgeInsets.only(left: 14, right: 14),
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                          children: [
                            for (int i = 0; i < listS.length; i++)
                              if (listS[i].status == 0)
                                GestureDetector(
                                  onTap: () {},
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: 300,
                                        margin: EdgeInsets.only(left: 12),
                                        decoration: BoxDecoration(
                                          color: Color(0xffe2eeec),
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 180,
                                              width: 300,
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(20),
                                                  topRight: Radius.circular(20),
                                                ),
                                                child: Image.asset(
                                                  listS[i].anhmonhoc,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 70,
                                              width: 300,
                                              padding: EdgeInsets.all(12),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                        listS[i].tenmonhoc,
                                                        style: kStyleTitle,
                                                      ),
                                                      if (listS[i].cacbaigiang == null)
                                                        Container(
                                                          margin: EdgeInsets.symmetric(horizontal: 5),
                                                          width: 5,
                                                          height: 5,
                                                          decoration: BoxDecoration(
                                                            color: Color(0xff7e7e7e),
                                                            shape: BoxShape.circle,
                                                          ),
                                                        ),
                                                      if (listS[i].cacbaigiang != null)
                                                        Container(
                                                          margin: EdgeInsets.symmetric(horizontal: 5),
                                                          width: 5,
                                                          height: 5,
                                                          decoration: BoxDecoration(
                                                            color: Color(0xffe97cac),
                                                            shape: BoxShape.circle,
                                                          ),
                                                        ),
                                                      if (listS[i].cacbaigiang == null)
                                                        Text(
                                                          "Khóa học chưa mở",
                                                          style: kStyleViewAll,
                                                          overflow: TextOverflow.ellipsis,
                                                        ),
                                                      if (listS[i].cacbaigiang != null)
                                                        Text(
                                                          "Gồm " +
                                                              listS[i].cacbaigiang.length.toString() +
                                                              " bài giảng",
                                                          style: kStyleViewAll,
                                                          overflow: TextOverflow.ellipsis,
                                                        ),
                                                    ],
                                                  ),
                                                  Container(
                                                    height: 2,
                                                  ),
                                                  Row(
                                                    children: [
                                                      if (listS[i].tghoc != null)
                                                        Text(
                                                          "Hoàn thành trong " + listS[i].tghoc,
                                                          style: kStyleViewAll,
                                                        ),
                                                      if (listS[i].tghoc == null)
                                                        Text(
                                                          "Khóa học sẽ sớm được ra mắt",
                                                          style: kStyleViewAll,
                                                        ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 60,
                                        right: 20,
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Container(
                                              height: 32,
                                              width: 72,
                                              decoration: BoxDecoration(
                                                color: Color(0xffFF4342),
                                                borderRadius: BorderRadius.circular(20),
                                              ),
                                            ),
                                            Text("Bắt đầu!", style: kStyleStarted),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                          ],
                        ),
                      ),
                      Container(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Các khóa học đang hot",
                                      style: kStyleTitle,
                                    ),
                                    Image.asset(
                                      "assets/images/file.gif",
                                      height: 22,
                                      width: 22,
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => null));
                                  },
                                  child: Text(
                                    "Xem tất cả",
                                    style: kStyleViewAll,
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              height: 6,
                              thickness: 3,
                              color: Color(0xffe87cac),
                              endIndent: 242,
                            ),
                            Container(
                              height: 14,
                            ),
                            Container(
                              height: 250,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                                children: [
                                  for (int i = 0; i < listS.length; i++)
                                    GestureDetector(
                                      onTap: () {},
                                      child: Stack(
                                        children: [
                                          Container(
                                            width: 300,
                                            margin: EdgeInsets.only(left: 12),
                                            decoration: BoxDecoration(
                                              color: Color(0xffe2eeec),
                                              borderRadius: BorderRadius.circular(20),
                                            ),
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: 180,
                                                  width: 300,
                                                  child: ClipRRect(
                                                    borderRadius: BorderRadius.only(
                                                      topLeft: Radius.circular(20),
                                                      topRight: Radius.circular(20),
                                                    ),
                                                    child: Image.asset(
                                                      listS[i].anhmonhoc,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  height: 70,
                                                  width: 300,
                                                  padding: EdgeInsets.all(12),
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Text(
                                                            listS[i].tenmonhoc,
                                                            style: kStyleTitle,
                                                          ),
                                                          if (listS[i].cacbaigiang == null)
                                                            Container(
                                                              margin: EdgeInsets.symmetric(horizontal: 5),
                                                              width: 5,
                                                              height: 5,
                                                              decoration: BoxDecoration(
                                                                color: Color(0xff7e7e7e),
                                                                shape: BoxShape.circle,
                                                              ),
                                                            ),
                                                          if (listS[i].cacbaigiang != null)
                                                            Container(
                                                              margin: EdgeInsets.symmetric(horizontal: 5),
                                                              width: 5,
                                                              height: 5,
                                                              decoration: BoxDecoration(
                                                                color: Color(0xffe97cac),
                                                                shape: BoxShape.circle,
                                                              ),
                                                            ),
                                                          if (listS[i].cacbaigiang == null)
                                                            Text(
                                                              "Khóa học chưa mở",
                                                              style: kStyleViewAll,
                                                              overflow: TextOverflow.ellipsis,
                                                            ),
                                                          if (listS[i].cacbaigiang != null)
                                                            Text(
                                                              "Gồm " +
                                                                  listS[i].cacbaigiang.length.toString() +
                                                                  " bài giảng",
                                                              style: kStyleViewAll,
                                                              overflow: TextOverflow.ellipsis,
                                                            ),
                                                        ],
                                                      ),
                                                      Container(
                                                        height: 2,
                                                      ),
                                                      Row(
                                                        children: [
                                                          if (listS[i].tghoc != null)
                                                            Text(
                                                              "Hoàn thành trong " + listS[i].tghoc,
                                                              style: kStyleViewAll,
                                                            ),
                                                          if (listS[i].tghoc == null)
                                                            Text(
                                                              "Khóa học sẽ sớm được ra mắt",
                                                              style: kStyleViewAll,
                                                            ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 60,
                                            right: 20,
                                            child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                Container(
                                                  height: 32,
                                                  width: 72,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xffFF4342),
                                                    borderRadius: BorderRadius.circular(20),
                                                  ),
                                                ),
                                                Text("Bắt đầu!", style: kStyleStarted),
                                              ],
                                            ),
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
                      Container(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Các khóa học sắp ra mắt",
                                      style: kStyleTitle,
                                    ),
                                    Image.asset(
                                      "assets/images/file.gif",
                                      height: 22,
                                      width: 22,
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => null));
                                  },
                                  child: Text(
                                    "Xem tất cả",
                                    style: kStyleViewAll,
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              height: 6,
                              thickness: 3,
                              color: Color(0xffe87cac),
                              endIndent: 242,
                            ),
                            Container(
                              height: 14,
                            ),
                            Container(
                              height: 250,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                                children: [
                                  for (int i = 0; i < listS.length; i++)
                                    if (listS[i].cacbaigiang == null)
                                      GestureDetector(
                                        onTap: () {},
                                        child: Stack(
                                          children: [
                                            Container(
                                              width: 300,
                                              margin: EdgeInsets.only(left: 12),
                                              decoration: BoxDecoration(
                                                color: Color(0xffe2eeec),
                                                borderRadius: BorderRadius.circular(20),
                                              ),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    height: 180,
                                                    width: 300,
                                                    child: ClipRRect(
                                                      borderRadius: BorderRadius.only(
                                                        topLeft: Radius.circular(20),
                                                        topRight: Radius.circular(20),
                                                      ),
                                                      child: Image.asset(
                                                        listS[i].anhmonhoc,
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 70,
                                                    width: 300,
                                                    padding: EdgeInsets.all(12),
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Text(
                                                              listS[i].tenmonhoc,
                                                              style: kStyleTitle,
                                                            ),
                                                            if (listS[i].cacbaigiang == null)
                                                              Container(
                                                                margin: EdgeInsets.symmetric(horizontal: 5),
                                                                width: 5,
                                                                height: 5,
                                                                decoration: BoxDecoration(
                                                                  color: Color(0xff7e7e7e),
                                                                  shape: BoxShape.circle,
                                                                ),
                                                              ),
                                                            if (listS[i].cacbaigiang != null)
                                                              Container(
                                                                margin: EdgeInsets.symmetric(horizontal: 5),
                                                                width: 5,
                                                                height: 5,
                                                                decoration: BoxDecoration(
                                                                  color: Color(0xffe97cac),
                                                                  shape: BoxShape.circle,
                                                                ),
                                                              ),
                                                            if (listS[i].cacbaigiang == null)
                                                              Text(
                                                                "Khóa học chưa mở",
                                                                style: kStyleViewAll,
                                                                overflow: TextOverflow.ellipsis,
                                                              ),
                                                            if (listS[i].cacbaigiang != null)
                                                              Text(
                                                                "Gồm " +
                                                                    listS[i].cacbaigiang.length.toString() +
                                                                    " bài giảng",
                                                                style: kStyleViewAll,
                                                                overflow: TextOverflow.ellipsis,
                                                              ),
                                                          ],
                                                        ),
                                                        Container(
                                                          height: 2,
                                                        ),
                                                        Row(
                                                          children: [
                                                            if (listS[i].tghoc != null)
                                                              Text(
                                                                "Hoàn thành trong " + listS[i].tghoc,
                                                                style: kStyleViewAll,
                                                              ),
                                                            if (listS[i].tghoc == null)
                                                              Text(
                                                                "Khóa học sẽ sớm được ra mắt",
                                                                style: kStyleViewAll,
                                                              ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Positioned(
                                              bottom: 60,
                                              right: 20,
                                              child: Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  Container(
                                                    height: 32,
                                                    width: 72,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xffFF4342),
                                                      borderRadius: BorderRadius.circular(20),
                                                    ),
                                                  ),
                                                  Text("Bắt đầu!", style: kStyleStarted),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 40, bottom: 40),
                              child: Text("Bạn đã xem hết!", style: kStyleEnd),
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
    );
  }
}
