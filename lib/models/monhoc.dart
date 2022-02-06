import 'package:flutter/material.dart';

class monhoc {
  final String tenmonhoc, anhmonhoc, tghoc;
  final int status;
  final List cacbaigiang;

  monhoc({
    @required this.tenmonhoc,
    @required this.anhmonhoc,
    @required this.tghoc,
    @required this.status,
    @required this.cacbaigiang,
  });
}

class baigiang {
  final List mucnho,
      noidung,
      vidu,
      ketqua,
      noidungvd,
      noidungketqua,
      ketquaoutput;
  final String anh, tieude, intro;
  baigiang({
    @required this.ketqua,
    @required this.intro,
    @required this.anh,
    @required this.tieude,
    @required this.mucnho,
    @required this.noidung,
    @required this.vidu,
    @required this.noidungvd,
    @required this.noidungketqua,
    @required this.ketquaoutput,
  });
}

monhoc python = new monhoc(
  tenmonhoc: "Python cơ bản",
  anhmonhoc: "assets/images/python_courses.png",
  tghoc: "5h 25m",
  status: 0,
  cacbaigiang: [
    baigiang_1,
  ],
);

monhoc python_nangcao = new monhoc(
    tenmonhoc: "Python nâng cao",
    anhmonhoc: "assets/images/python_nangcao_courses.png",
    tghoc: null,
    status: 1,
    cacbaigiang: null);

monhoc reactjs = new monhoc(
    tenmonhoc: "ReactJS cơ bản",
    anhmonhoc: "assets/images/reactjs_courses.png",
    tghoc: null,
    status: 1,
    cacbaigiang: null);
monhoc reactjs_nangcao = new monhoc(
    tenmonhoc: "ReactJS nâng cao",
    anhmonhoc: "assets/images/reactjs_nangcao_courses.png",
    tghoc: null,
    status: 1,
    cacbaigiang: null);

monhoc nodejs = new monhoc(
  tenmonhoc: "NodeJS cơ bản",
  anhmonhoc: "assets/images/nodejs_courses.png",
  tghoc: null,
  status: 1,
  cacbaigiang: null,
);

monhoc nodejs_nangcao = new monhoc(
  tenmonhoc: "NodeJS nâng cao",
  anhmonhoc: "assets/images/nodejs_nangcao_courses.png",
  tghoc: null,
  status: 1,
  cacbaigiang: null,
);

final listS = <monhoc>[
  python,
  python_nangcao,
  reactjs,
  reactjs_nangcao,
  nodejs,
  nodejs_nangcao
];
baigiang baigiang_1 = new baigiang(
  anh: "assets/images/python/variable.png",
  tieude: "Bài 1: Khai báo biến trong Python",
  intro:
      """Python là một ngôn ngữ đặc biệt, bạn không cần phải đặt dấu chấm phẩy (;) đằng sau mỗi dòng lệnh. Điều này đôi khi khiến những người học từ C/ C++ sang cảm thấy bỡ ngỡ.\n
Tuy nhiên bạn đừng lo lắng, bởi khi học Python thì bạn sẽ phải trình bày một cách sáng sủa về vị trí, khoảng trắng và xuống dòng. Nói thì dài dòng, sau đây ta sẽ học cách khai báo biến.""",
  mucnho: [
    "1. Cách khai báo biến trong Python",
    "3. Cách thay đổi dữ liệu cho biến Python",
  ],
  noidung: [
    """Trong Python, biến là một định danh dùng để lưu trữ dữ liệu trong quá trình biên dịch mã code Python.\n
Biến đóng vai trò rất quan trọng, nếu không có biến thì bạn không thể tạo ra một chương trình hoàn hảo, nói cách khác bạn không thể giải quyết bất kì một bài toán nào cả, kể cả một ứng dụng đơn giản.\n
Điều đặc biệt ở trong Python là bạn phải gán một giá trị trong lúc khai báo biến, điều đó sẽ giúp Python nhận biết được biến đó sẽ lưu trữ kiểu dữ liệu gì.\n""",
    "Để thay đổi dữ liệu cho biến thì bạn chỉ việc sử dụng toán tử gán\n",
  ],
  noidungvd: [
    "Ví dụ: Khai báo biến site.",
    "Ví dụ: Thay đổi dữ liệu cho biến site.",
  ],
  vidu: [
    '''>>> site = "GALAXYITE.vn"''',
    '''>>> site = "http://GALAXYITE.vn"''',
  ],
  noidungketqua: [
    "Để in giá trị của biến ra màn hình thì ta sử dụng lệnh print.",
    "Chạy chương trình ta thu được kết quả như sau:",
  ],
  ketqua: [
    '''>>> site = "GALAXYITE.vn"
>>> print(site)''',
    ">>> print(site)",
  ],
  ketquaoutput: [">>> GALAXYITE.vn", ">>> http://GALAXYITE.vn"],
);
