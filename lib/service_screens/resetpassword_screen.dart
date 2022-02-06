import 'package:flutter/material.dart';
import 'package:travel/service_screens/login_screen.dart';
import '../constants/textstyle.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ResetPasswordPage extends StatefulWidget {
  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  TextEditingController emailController = new TextEditingController();
  bool borderColor = false;
  bool borderWidth = false;
  //////FIREBASE

  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Builder(
        builder: (context) => Container(
          height: double.infinity,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: width,
                      height: height * 0.4,
                      /*decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: <Color>[
                          Color(0xfff78b8b),
                          Color(0xffDE5959),
                          Color(0xff813434),
                        ])),*/
                      child: Image.asset(
                        "assets/images/header_login.gif",
                        fit: BoxFit.cover,
                      ),
                      //color: Color(0xffDE5959),
                      //color: Color(0xffDE5959),
                      //child: Image.asset(
                      //"assets/images/login_header.gif",
                      //fit: BoxFit.cover,
                      //),
                    ),
                    Column(
                      children: [
                        Text('“ Free To Learn ”', style: kStyleLogTitle),
                        Container(
                          height: 22,
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: 300),
                          child: Text(
                              "GALAXYITE là ứng dụng cung cấp các khóa học lập trình hoàn toàn Miễn Phí. Hãy khám phá ngay !!!",
                              textAlign: TextAlign.center,
                              style: kStyleLogIntro),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  height: height * 0.64,
                  width: width,
                  decoration: BoxDecoration(
                    color: Color(0xfff6f6f6),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(30),
                        child: Text("Yêu Cầu Lấy Lại Mật Khẩu",
                            style: kStyleLogText),
                      ),
                      AnimatedContainer(
                        padding: EdgeInsets.only(top: 14, bottom: 14),
                        margin: EdgeInsets.only(left: 40, right: 40),
                        width: width,
                        duration: Duration(milliseconds: 800),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            width: borderWidth ? 1.5 : 1,
                            color: borderColor
                                ? Color(0xff3e4680)
                                : Color(0xff8c8c8c),
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 20, right: 20),
                              child: Icon(
                                FontAwesome5Solid.envelope,
                                color: Color(0xff4d4d4d),
                                size: 14,
                              ),
                            ),
                            Container(
                              child: Flexible(
                                child: TextFormField(
                                  controller: emailController,
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
                                    color: Color(0xff3e4680),
                                  ),
                                  textAlign: TextAlign.left,
                                  maxLines: 1,
                                  decoration: InputDecoration.collapsed(
                                    hintText:
                                        "Nhập vào Email cần lấy lại mật khẩu...",
                                    hintStyle: TextStyle(
                                      fontSize: 13,
                                      color: Color(0xff8c8c8c),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          final String email = emailController.text.trim();
                          if (email.isEmpty) {
                            showErrorSnackBar(
                              "Email không được để trống",
                              context,
                            );
                          } else {
                            resetPassword(email, context);
                          }
                        },
                        child: AnimatedContainer(
                          padding: EdgeInsets.only(top: 14, bottom: 14),
                          margin:
                              EdgeInsets.only(left: 40, right: 40, top: 199),
                          width: width,
                          duration: Duration(milliseconds: 800),
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: 1.5,
                                color: Color(0xff3e4680),
                              ),
                              color: Color(0xff3e4680),
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            "Lấy Lại Mật Khẩu",
                            style: kStyleButtonLogin,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Container(height: 30),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.rightToLeftWithFade,
                                curve: Curves.easeInOut,
                                reverseDuration: Duration(milliseconds: 300),
                                duration: Duration(milliseconds: 300),
                                child: LoginPage(),
                              ));
                        },
                        child: AnimatedContainer(
                            padding: EdgeInsets.only(top: 14, bottom: 14),
                            margin: EdgeInsets.only(left: 40, right: 40),
                            width: width,
                            duration: Duration(milliseconds: 800),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                width: 1.5,
                                color: Color(0xff3e4680),
                              ),
                            ),
                            child: Text(
                              "Trở Lại Trang Đăng Nhập",
                              style: kStyleButtonSignup,
                              textAlign: TextAlign.center,
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /////RESET PASSWORD FUNC
  void resetPassword(String email, context) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      showSuccessSnackBar("Đã gửi yêu cầu đến email $email", context);
    } catch (e) {
      if (e.toString().indexOf(
              "There is no user record corresponding to this identifier. The user may have been deleted.") !=
          1) {
        showErrorSnackBar(
            "Email chưa từng được đăng ký trên hệ thống", context);
      }
    }
  }

  /////SHOW ERROR SNACKBAR.
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

  void showSuccessSnackBar(String e, BuildContext context) {
    final snackbar = SnackBar(
      duration: Duration(seconds: 3),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Icon(
              FontAwesome5Solid.check_circle,
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
}
