import 'package:flutter/material.dart';
import '../constants/textstyle.dart';
import '../models/monhoc.dart';

final listS = <monhoc>[python, python_nangcao, reactjs, reactjs_nangcao, nodejs, nodejs_nangcao];

class LessonPage extends StatefulWidget {
  int index, index2;
  LessonPage(this.index, this.index2);

  @override
  LessonScreen createState() {
    return new LessonScreen(this.index, this.index2);
  }
}

class LessonScreen extends State<LessonPage> {
  final int index, index2;
  LessonScreen(this.index, this.index2);
  double _opacity = 0.001;
  var _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    context = context;
    _scrollController.addListener(() {
      if (_scrollController.position.pixels < 400) {
        setState(() {
          _opacity = 0.0;
        });
      }
      if (_scrollController.position.pixels > 210) {
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
            physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            slivers: [
              SliverAppBar(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30))),
                backgroundColor: Color(0xffe87cac),
                expandedHeight: 220,
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
                      listS[index].cacbaigiang[index2].tieude,
                      style: kStyleKLessonDetailTitle_Expanded,
                    ),
                  ),
                  centerTitle: true,
                  background: Image.asset(
                    listS[index].cacbaigiang[index2].anh,
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
                  width: width,
                  child: Column(
                    children: [
                      Container(height: 20),
                      Text(
                        listS[index].cacbaigiang[index2].tieude,
                        style: kStyleLessonDetailTitle,
                      ),
                      Divider(
                        height: 6,
                        thickness: 3,
                        color: Color(0xffe87cac),
                        endIndent: 100,
                        indent: 100,
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 30, left: 14, right: 14),
                        child: Text(
                          listS[index].cacbaigiang[index].intro,
                          style: kStyleLessonContent,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 14, right: 14),
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: listS[index].cacbaigiang[index].mucnho.length,
                          itemBuilder: (context, i) {
                            return Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    listS[index].cacbaigiang[index2].mucnho[i],
                                    style: kStyleLessonSubTitle,
                                  ),
                                  Container(height: 20),
                                  Text(
                                    listS[index].cacbaigiang[index2].noidung[i],
                                    style: kStyleLessonContent,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child:
                                        Text(listS[index].cacbaigiang[index2].noidungvd[i], style: kStyleExampleTitle),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    height: 50,
                                    width: width,
                                    decoration: BoxDecoration(
                                        color: Color(0xffe2eeec),
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(width: 0.4)),
                                    child: Container(
                                      padding: EdgeInsets.only(left: 12, right: 12),
                                      child: Row(
                                        children: [
                                          Text(
                                            (i + 1).toString(),
                                            style: kStyleExample,
                                          ),
                                          VerticalDivider(
                                            endIndent: 12,
                                            indent: 12,
                                            thickness: 2,
                                            color: Color(0xfffe87cac),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 12),
                                            child: Text(listS[index].cacbaigiang[index2].vidu[i]),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 20, bottom: 10),
                                    child: Text(
                                      listS[index].cacbaigiang[index].noidungketqua[i],
                                      style: kStyleExampleTitle,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: 5, bottom: 5),
                                    width: width,
                                    decoration: BoxDecoration(
                                        color: Color(0xffe2eeec),
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(width: 0.4)),
                                    child: Container(
                                      padding: EdgeInsets.only(left: 12, right: 12),
                                      child: IntrinsicHeight(
                                        child: Row(
                                          children: [
                                            Text(
                                              (i + 2).toString(),
                                              style: kStyleExample,
                                            ),
                                            VerticalDivider(
                                              endIndent: 12,
                                              indent: 12,
                                              thickness: 2,
                                              color: Color(0xfffe87cac),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(left: 12),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(listS[index].cacbaigiang[index2].ketqua[i]),
                                                  Text(listS[index].cacbaigiang[index2].ketquaoutput[i],
                                                      style: kStyleOutput)
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 34,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 30, bottom: 30),
                        child: Text("Bạn đã xem hết!", style: kStyleEnd),
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
