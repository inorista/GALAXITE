import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import '../constants/textstyle.dart';
import 'dart:ui';

class AboutUsPage extends StatefulWidget {
  @override
  _AboutUsPageState createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
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
              icon: Icon(EvaIcons.arrowIosBackOutline),
              onPressed: () {
                Navigator.pop(context);
              },
            );
          },
        ),
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
        title: Text("Về nhà phát triển", style: kStyleAboutUsTitle_Expanded),
        centerTitle: true,
      ),
      body: Container(
        width: width,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/aboutus_background.png",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 55),
                  padding: EdgeInsets.only(left: 40, right: 40, bottom: 2),
                  child: Text("ABOUT GALAXITE", style: kStyleAboutUsTitle),
                ),
                Divider(
                  height: 6,
                  thickness: 3,
                  color: Color(0xffe87cac),
                  endIndent: 120,
                  indent: 120,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        padding: EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white.withOpacity(0.05),
                        ),
                        width: width - 80,
                        child: Center(
                          child: Text(
                            "Là ứng dụng cung cấp các khóa học về lập trình hoàn toàn miễn phí thuần Việt đầu tiên chạy trên nền tảng ứng dụng di động.",
                            style: kStyleAboutUsText,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 55),
                  padding: EdgeInsets.only(left: 40, right: 40, bottom: 2),
                  child: Text(
                    "TEAM MEMBERS",
                    style: kStyleAboutUsTitle,
                    textAlign: TextAlign.center,
                  ),
                ),
                Divider(
                  height: 6,
                  thickness: 3,
                  color: Color(0xffe87cac),
                  endIndent: 120,
                  indent: 120,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 50, bottom: 10),
                  child: Container(
                    height: 200,
                    width: 200,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        "assets/images/avatar.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Text("NGÔ QUỐC TÚ", style: kStyleAboutUsName),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
