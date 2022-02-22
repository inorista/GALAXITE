import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:page_transition/page_transition.dart';
import 'package:travel/screens/filtered_screen.dart';
import '../constants/textstyle.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final db = FirebaseFirestore.instance.collection("khoahoc").snapshots();
  @override
  Widget build(BuildContext context) {
    /////////CONFIG
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        toolbarHeight: 50,
        title: Text("Chọn một ngôn ngữ yêu thích", style: kStyleKLessonDetailTitle_Expanded),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            gradient: new LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff35D465),
                Color(0xff16D69E),
                Color(0xff04D9DC),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.all(16),
                child: StreamBuilder<QuerySnapshot>(
                  stream: db,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) return Center(child: CupertinoActivityIndicator());
                    return GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        childAspectRatio: 1,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                      ),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.rightToLeft,
                                curve: Curves.easeInOut,
                                reverseDuration: Duration(milliseconds: 300),
                                duration: Duration(milliseconds: 300),
                                child: FilteredPage(snapshot.data.docs[index]["ngonngu"].toString()),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              image: DecorationImage(
                                image: AssetImage(snapshot.data.docs[index]['anhngonngu']),
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.8), BlendMode.dstATop),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                snapshot.data.docs[index]["ngonngu"].toString().toUpperCase(),
                                style: kStyleLanguageTitle,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.only(top: 40, bottom: 40),
                  child: Text("Bạn đã xem hết!", style: kStyleEnd),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
