import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel/screens/lesson_screen.dart';
import '../constants/textstyle.dart';
import '../models/monhoc.dart';
import 'package:page_transition/page_transition.dart';

final listS = <monhoc>[
  python,
  python_nangcao,
  reactjs,
  reactjs_nangcao,
  nodejs,
  nodejs_nangcao
];

class DetailPage extends StatefulWidget {
  int index;
  DetailPage(this.index);
  @override
  DetailScreen createState() {
    return new DetailScreen(this.index);
  }
}

class DetailScreen extends State<DetailPage> {
  final int index;
  DetailScreen(this.index);
  double _opacity = 0.001;
  var _scrollController = new ScrollController();
  Future<int> getIndex() async {
    await Future.delayed(
      Duration(seconds: 1),
    );
    return index;
  }

  @override
  Widget _reloadProcessIndicator() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: new CupertinoActivityIndicator(),
      ),
    );
  }

  Widget build(BuildContext context) {
    context = context;
    _scrollController.addListener(() {
      if (_scrollController.position.pixels < 230) {
        setState(() {
          _opacity = 0.0;
        });
      }
      if (_scrollController.position.pixels > 238) {
        setState(() {
          _opacity = 1;
        });
      }
    });

    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            physics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            slivers: [
              SliverAppBar(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                backgroundColor: Color(0xffe87cac),
                expandedHeight: 240,
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
                          decoration: BoxDecoration(
                              color: Colors.black, shape: BoxShape.circle),
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
                      "Khóa học " + listS[index].tenmonhoc,
                      style: kStyleDetailTitle_Expanded,
                    ),
                  ),
                  centerTitle: true,
                  background: Image.asset(
                    listS[index].anhmonhoc,
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
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Container(height: 20),
                      Text(
                        "Khóa học " + listS[index].tenmonhoc,
                        style: kStyleDetailTitle,
                      ),
                      Divider(
                        height: 6,
                        thickness: 3,
                        color: Color(0xffe87cac),
                        endIndent: 120,
                        indent: 120,
                      ),
                      Container(height: 20),
                      if (listS[index].cacbaigiang != null)
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 12, right: 12),
                              child: GridView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20,
                                  mainAxisExtent: 154,
                                ),
                                primary: false,
                                shrinkWrap: true,
                                itemCount: listS[index].cacbaigiang.length,
                                itemBuilder: (context, i) => GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                          type: PageTransitionType
                                              .rightToLeftWithFade,
                                          curve: Curves.easeInOut,
                                          reverseDuration:
                                              Duration(milliseconds: 300),
                                          duration: Duration(milliseconds: 300),
                                          child: LessonPage(index, i),
                                        ));
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
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20)),
                                            child: Image.asset(
                                              listS[index].cacbaigiang[i].anh,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 5,
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(
                                              left: 12, right: 12),
                                          child: Text(
                                            listS[index].cacbaigiang[i].tieude,
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
                      if (listS[index].cacbaigiang == null)
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
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
