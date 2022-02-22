import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:travel/service_screens/login_screen.dart';
import '../constants/textstyle.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
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
                        "assets/images/signup_header.gif",
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
                        Text('“ Free To Learn ”', style: kStyleSignUpTitle),
                        Container(
                          height: 22,
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: 300),
                          child: Text(
                              "GALAXYITE là ứng dụng cung cấp các khóa học lập trình hoàn toàn Miễn Phí. Hãy khám phá ngay !!!",
                              textAlign: TextAlign.center,
                              style: kStyleSignUpIntro),
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
                        child: Text("Đăng Ký Tài Khoản Mới", style: kStyleLogText),
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
                            color: borderColor ? Color(0xff3D2946) : Color(0xff8c8c8c),
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
                                    color: Color(0xff3D2946),
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
                            color: borderColorPassword ? Color(0xff3D2946) : Color(0xff8c8c8c),
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
                                    color: Color(0xff3D2946),
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
                            signUp(email, password, context);
                          }
                        },
                        child: AnimatedContainer(
                          padding: EdgeInsets.only(top: 14, bottom: 14),
                          margin: EdgeInsets.only(left: 40, right: 40, top: 120),
                          width: width,
                          duration: Duration(milliseconds: 800),
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: 1.5,
                                color: Color(0xff3D2946),
                              ),
                              color: Color(0xff3D2946),
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            "Đăng Ký",
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
                                color: Color(0xff3D2946),
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

  ///////SIGIN FUNC
  Future<UserCredential> signUp(String email, String password, context) async {
    FirebaseApp app = await Firebase.initializeApp(name: 'Secondary', options: Firebase.app().options);
    try {
      /*await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      */
      UserCredential userCredential =
          await FirebaseAuth.instanceFor(app: app).createUserWithEmailAndPassword(email: email, password: password);
      showSuccessSnackBar("Đăng ký tài khoản thành công !!", context);
      await Future.delayed(Duration(seconds: 5));
    } catch (e) {
      if (e.toString().indexOf("The email address is already in use by another account.") != -1) {
        showErrorSnackBar("Email đã được đăng ký trước đó.", context);
      }
      if (e.toString().indexOf("The email address is badly formatted.") != -1) {
        showErrorSnackBar("Vui lòng nhập đúng định dạng Email.", context);
      }

      print(e.toString());
    }
    app.delete();
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
