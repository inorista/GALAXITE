import 'package:flutter/material.dart';
import 'package:travel/screens/main_screen.dart';
import 'package:travel/service_screens/signup_screen.dart';
import '../constants/textstyle.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../service_screens/resetpassword_screen.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool borderColor = false;
  bool borderWidth = false;
  bool borderColorPassword = false;
  bool borderWidthPassword = false;
  bool buttonColor = false;
  TextEditingController passwordController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();

  ////FIREBASE

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
                        child: Text("Đăng Nhập Để Tiếp Tục", style: kStyleLogText),
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
                            color: borderColor ? Color(0xff3e4680) : Color(0xff8c8c8c),
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
                                    hintText: "Email...",
                                    hintStyle: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xff8c8c8c),
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
                            width: borderWidthPassword ? 1.5 : 1,
                            color: borderColorPassword ? Color(0xff3e4680) : Color(0xff8c8c8c),
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 20, right: 20),
                              child: Icon(
                                FontAwesome5Solid.key,
                                color: Color(0xff4d4d4d),
                                size: 14,
                              ),
                            ),
                            Container(
                              child: Flexible(
                                child: TextFormField(
                                  controller: passwordController,
                                  onChanged: (text) {
                                    if (text.length > 0) {
                                      setState(() {
                                        borderColorPassword = true;
                                        borderWidthPassword = true;
                                      });
                                    } else {
                                      setState(() {
                                        borderColorPassword = false;
                                        borderWidthPassword = false;
                                      });
                                    }
                                  },
                                  autocorrect: true,
                                  autofocus: false,
                                  obscureText: true,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w100,
                                    color: Color(0xff3e4680),
                                  ),
                                  textAlign: TextAlign.left,
                                  maxLines: 1,
                                  decoration: InputDecoration.collapsed(
                                    hintText: "Password...",
                                    hintStyle: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xff8c8c8c),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Quên mật khẩu? ",
                              style: kStyleResetPassword,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.rightToLeftWithFade,
                                      curve: Curves.easeInOut,
                                      reverseDuration: Duration(milliseconds: 300),
                                      duration: Duration(milliseconds: 300),
                                      child: ResetPasswordPage(),
                                    ));
                              },
                              child: Text(
                                "Lấy lại ngay.",
                                style: kStyleResetPasswordButton,
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          final String email = emailController.text.trim();
                          final String password = passwordController.text.trim();
                          if (email.isEmpty & password.isEmpty) {
                            showErrorSnackBar(
                              "Email và Password không được để trống",
                              context,
                            );
                          } else if (email.isEmpty) {
                            showErrorSnackBar(
                              "Email không được để trống",
                              context,
                            );
                          } else if (password.isEmpty) {
                            showErrorSnackBar(
                              "Password không được để trống",
                              context,
                            );
                          } else {
                            signIn(email, password, context);
                          }
                        },
                        child: AnimatedContainer(
                          padding: EdgeInsets.only(top: 14, bottom: 14),
                          margin: EdgeInsets.only(left: 40, right: 40, top: 72),
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
                            "Đăng Nhập",
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
                                child: SignupPage(),
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
                            "Đăng Ký Tài Khoản Mới",
                            style: kStyleButtonSignup,
                            textAlign: TextAlign.center,
                          ),
                        ),
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

  ///////RESET PASSWORD FUNC

  ///////SIGIN FUNC
  void signIn(String email, String password, context) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      Navigator.push(
        context,
        PageTransition(
          type: PageTransitionType.rightToLeft,
          curve: Curves.easeInOut,
          reverseDuration: Duration(milliseconds: 300),
          duration: Duration(milliseconds: 300),
          child: Home(),
        ),
      );
    } catch (e) {
      if (e.toString().indexOf("The user may have been deleted.") != -1) {
        showErrorSnackBar("Email chưa được Đăng ký ở hệ thống.", context);
      }
      if (e.toString().indexOf("The email address is badly formatted.") != -1) {
        showErrorSnackBar("Vui lòng nhập đúng định dạng Email.", context);
      }
      if (e.toString().indexOf("The password is invalid or the user does not have a password.") != -1) {
        showErrorSnackBar("Mật khẩu bạn đã nhập không chính xác.", context);
      } else {
        print(e.toString());
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
}
