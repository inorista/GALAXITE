import 'dart:async';
import 'dart:ui' as ui;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/textstyle.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'dart:typed_data';
import 'dart:io';

class ContactUsPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactUsPage> {
  Completer<GoogleMapController> _controller = Completer();

  /////////AUTH FIREBASE
  final _auth = FirebaseAuth.instance;

  ///////CHANGE ICON GOOGLE MAPS

  @override
  Widget build(BuildContext context) {
    /////////CONFIG
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    //////LAUNCH APP
    Future<void> _launchInApp(String url) async {
      if (await canLaunch(url)) {
        await launch(url,
            forceSafariVC: true,
            forceWebView: true,
            headers: <String, String>{'header_key': 'header_value'});
      } else {
        throw "Không thế truy cập đường dẫn vào lúc này !";
      }
    }

    ///////SMS
    Future<void> _SMSPhone(String url) async {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw "Không thế truy cập đường dẫn vào lúc này !";
      }
    }

    ///////MAKE CALL
    Future<void> _makeCall(String url) async {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw "Không thế truy cập đường dẫn vào lúc này !";
      }
    }

    return Scaffold(
      body: Container(
        height: double.infinity,
        child: SingleChildScrollView(
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                overflow: Overflow.visible,
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 200,
                    width: width,
                    decoration: BoxDecoration(
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
                  Positioned(
                    left: 30,
                    top: 30,
                    child: SafeArea(
                      child: Text("Liên Hệ Với Chúng Tôi",
                          style: kStyleContactHeader),
                    ),
                  ),
                  Positioned(
                    top: 54,
                    right: 30,
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
                  Positioned(
                    bottom: -30,
                    child: Container(
                      height: 130,
                      width: width - 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Email hiện tại của bạn ",
                            style: kStyleContactItems,
                          ),
                          Container(
                            height: 40,
                            width: width - 100,
                            decoration: BoxDecoration(
                              color: Color(0xff2D3037).withOpacity(0.3),
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: 14, right: 14),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "${_auth.currentUser.email}",
                                      ),
                                      Icon(
                                        FontAwesome5Solid.arrow_down,
                                        size: 14,
                                        color: Colors.black54,
                                      )
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
                ],
              ),
              Container(height: 50),
              Container(
                margin: EdgeInsets.only(left: 24, right: 24),
                child: Text(
                  "Liên Hệ Qua Mạng Xã Hội",
                  style: kStyleContactTitle,
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 24, right: 24),
                child: GridView.count(
                  clipBehavior: Clip.none,
                  crossAxisCount: 2,
                  crossAxisSpacing: 40,
                  mainAxisSpacing: 40,
                  childAspectRatio: height / 550,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    GestureDetector(
                      onTap: () {
                        _launchInApp("https://www.facebook.com/Kozou.Inori/");
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(
                                        0, 1), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Icon(FontAwesome5Brands.facebook_f,
                                  color: Color(0xff3D548E), size: 32),
                            ),
                            Text(
                              "Facebook",
                              textAlign: TextAlign.center,
                              style: kStyleContactItems,
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _launchInApp("https://www.instagram.com/nqoqutu____/");
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(
                                        0, 1), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Icon(FontAwesome5Brands.instagram,
                                  color: Color(0xffE34963), size: 32),
                            ),
                            Text(
                              "Instagram",
                              textAlign: TextAlign.center,
                              style: kStyleContactItems,
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _launchInApp("https://twitter.com/Jaeris4");
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(
                                        0, 1), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Icon(FontAwesome5Brands.twitter,
                                  color: Color(0xff1D9BF0), size: 32),
                            ),
                            Text(
                              "Twitter",
                              textAlign: TextAlign.center,
                              style: kStyleContactItems,
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _SMSPhone(
                            "sms:+84 768696569?body=Bạn cần giúp đỡ điều gì ?");
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(
                                        0, 1), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Icon(FontAwesome5Solid.comment,
                                  color: Color(0xff35D465), size: 32),
                            ),
                            Text(
                              "Liên hệ qua SMS",
                              textAlign: TextAlign.center,
                              style: kStyleContactItems,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 40, bottom: 20),
                margin: EdgeInsets.only(left: 24, right: 24),
                child: Text(
                  "Các Thông Tin Khác",
                  style: kStyleContactTitle,
                  textAlign: TextAlign.left,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 24, right: 24, bottom: 24),
                child: Row(
                  children: [
                    Text("Số điện thoại: "),
                    GestureDetector(
                      onTap: () {
                        _makeCall("tel:+84 768696569");
                      },
                      child: Text(" +84 768696569", style: kStylePhone),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 24, right: 24),
                height: 300,
                width: width,
                decoration: BoxDecoration(
                  border: Border.all(width: 0.2, color: Colors.black),
                ),
                child: GoogleMap(
                  mapType: MapType.terrain,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                  initialCameraPosition: CameraPosition(
                    target: LatLng(10.774314395933947, 106.68956296848974),
                    zoom: 15,
                  ),
                  markers: {
                    Marker(
                      markerId: MarkerId('marker_2'),
                      position: LatLng(10.774314395933947, 106.68956296848974),
                      draggable: true,
                      infoWindow: InfoWindow(
                          title: "Văn phòng GALAXITE",
                          snippet:
                              "254 Nguyễn Thị Minh Khai, Phường 6, Quận 3."),
                      icon: BitmapDescriptor.defaultMarker,
                    ),
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

  void Signout(context) async {
    try {
      await _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}
