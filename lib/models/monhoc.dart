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
  final List mucnho, noidung, vidu, ketqua, noidungvd, noidungketqua, ketquaoutput;
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

final listS = <monhoc>[python, python_nangcao, reactjs, reactjs_nangcao, nodejs, nodejs_nangcao];
baigiang baigiang_1 = new baigiang(
  anh: "assets/images/python/variable.png",
  tieude: "Bài 1: Khai báo biến trong Python",
  intro:
      """Python là một ngôn ngữ đặc biệt, bạn không cần phải đặt dấu chấm phẩy (;) đằng sau mỗi dòng lệnh. Điều này đôi khi khiến những người học từ C/ C++ sang cảm thấy bỡ ngỡ.\n
Tuy nhiên bạn đừng lo lắng, bởi khi học Python thì bạn sẽ phải trình bày một cách sáng sủa về vị trí, khoảng trắng và xuống dòng. Nói thì dài dòng, sau đây ta sẽ học cách khai báo biến.""",
  mucnho: [
    "1. Cách khai báo biến trong Python",
    "2. Cách thay đổi dữ liệu cho biến Python",
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
    '''>>> site = "GALAXYITE.vn"\n
>>> print(site)''',
    ">>> print(site)",
  ],
  ketquaoutput: [">>> GALAXYITE.vn", ">>> http://GALAXYITE.vn"],
);

class baihoc {
  final List mucnho, noidungchinh, vidu, ketqua, invidu, inketqua, output;
  final String id, anh, tieude, gioithieu;
  baihoc({
    @required this.id,
    @required this.gioithieu,
    @required this.anh,
    @required this.tieude,
    @required this.mucnho,
    @required this.noidungchinh,
    @required this.vidu,
    @required this.invidu,
    @required this.ketqua,
    @required this.inketqua,
    @required this.output,
  });
}

baihoc bai01 = new baihoc(
  id: "bai01",
  anh: "assets/images/python/bai01.png",
  tieude: "Bài 1: Khai báo biến trong Python",
  gioithieu:
      """Python là một ngôn ngữ đặc biệt, bạn không cần phải đặt dấu chấm phẩy (;) đằng sau mỗi dòng lệnh. Điều này đôi khi khiến những người học từ C/ C++ sang cảm thấy bỡ ngỡ.\nTuy nhiên bạn đừng lo lắng, bởi khi học Python thì bạn sẽ phải trình bày một cách sáng sủa về vị trí, khoảng trắng và xuống dòng. Nói thì dài dòng, sau đây ta sẽ học cách khai báo biến.""",
  mucnho: [
    "1. Cách khai báo biến trong Python",
    "2. Cách thay đổi dữ liệu cho biến Python",
  ],
  noidungchinh: [
    """Trong Python, biến là một định danh dùng để lưu trữ dữ liệu trong quá trình biên dịch mã code Python.\nBiến đóng vai trò rất quan trọng, nếu không có biến thì bạn không thể tạo ra một chương trình hoàn hảo, nói cách khác bạn không thể giải quyết bất kì một bài toán nào cả, kể cả một ứng dụng đơn giản.\nĐiều đặc biệt ở trong Python là bạn phải gán một giá trị trong lúc khai báo biến, điều đó sẽ giúp Python nhận biết được biến đó sẽ lưu trữ kiểu dữ liệu gì.\n""",
    "Để thay đổi dữ liệu cho biến thì bạn chỉ việc sử dụng toán tử gán\n",
  ],
  vidu: [
    "Ví dụ: Khai báo biến site.",
    "Ví dụ: Thay đổi dữ liệu cho biến site.",
  ],
  invidu: [
    '''>>> site = "GALAXYITE.vn"''',
    '''>>> site = "http://GALAXYITE.vn"''',
  ],
  ketqua: [
    "Để in giá trị của biến ra màn hình thì ta sử dụng lệnh print.",
    "Chạy chương trình ta thu được kết quả như sau:",
  ],
  inketqua: [
    '''>>> site = "GALAXYITE.vn"\n>>> print(site)''',
    ">>> print(site)",
  ],
  output: [
    ">>> GALAXYITE.vn",
    ">>> http://GALAXYITE.vn",
  ],
);

baihoc bai00 = new baihoc(
  id: "bai00",
  anh: "assets/images/python/bai00.png",
  tieude: "Bài 00: Giới thiệu đôi nét về Python",
  gioithieu:
      """Python là ngôn ngữ lập trình hướng đối tượng cấp cao, mạnh mẽ được tạo ra bởi Guido van Rossum. Nó dễ dàng để tìm hiểu và đang nổi lên như một trong những ngôn ngữ lập trình nhập môn tốt nhất cho người lần đầu tiếp xúc với ngôn ngữ lập trình. Python hoàn toàn tạo kiểu động và sử dụng cơ chế cấp phát bộ nhớ tự động. Python có cấu trúc dữ liệu cấp cao mạnh mẽ và cách tiếp cận đơn giản nhưng hiệu quả đối với lập trình hướng đối tượng. Cú pháp lệnh của Python là điểm cộng vô cùng lớn vì sự rõ ràng, dễ hiểu và cách gõ linh động làm cho nó nhanh chóng trở thành một ngôn ngữ lý tưởng để viết script và phát triển ứng dụng trong nhiều lĩnh vực, ở hầu hết các nền tảng.\n
      Python có thể dùng để phát triển một số lĩnh vực như:\n
      - Phát triển ứng dụng Web Application (back-end).
      - Phát triển ứng dụng phần mềm.
      - Dùng để phát triển và giải các thuật toán khó với thư viện Numpy, Scipy,...
      """,
  mucnho: [
    "1. Tại sao chọn Python?",
    "2. Cú pháp của Python so với các ngôn ngữ khác",
  ],
  noidungchinh: [
    """
    - Python có thể dễ edàng hoạt động trên nhiều nền tảng hệ điều hành khác nhau (Windows, Mac, Linux, Raspberry).\n
    - Python có một cú pháp lập trình đơn giản khá giống với tiếng Anh.\n
    - Python là một mã nguồn mở, miễn phí, người dùng có thể tự do sử dụng và phân phối Python. Thậm chí dùng nó trong mục đích thương mai.
    - Python có một cộng đồng lớn mạnh, cộng đồng người dùng Python có thể tự do code và tạo ra những thư viện giải quyết các tác vụ phổ biến và chia sẻ nó cho cộng đồng.
    """,
    """
    - Những cú pháp của Python được thiết kế một cách tối giản nhất và gần giống với tiếng Anh nên rất dễ học.
    - Python sử dụng cách dòng mới để kết thúc một dòng lệnh. Trái ngược với các ngôn ngữ khác dùng dấu (;) để kết thúc một dòng lệnh.
    - Python sử dụng khoảng cách để xác định phạm vi của các hàm, lớp, vòng lặp. Trái ngược với các ngôn ngữ khác thường dùng dấu ngoặc nhọn để đóng hoặc mở phạm vi của hàm. 
    """,
  ],
  vidu: [],
  invidu: [],
  ketqua: [],
  inketqua: [],
  output: [],
);

class Baihoc {
  final String tieude, id, anhbaihoc, ngonngu;
  final List giaithich, mucnho, noidung;
  Baihoc(
      {@required this.tieude,
      @required this.id,
      @required this.anhbaihoc,
      @required this.ngonngu,
      @required this.giaithich,
      @required this.mucnho,
      @required this.noidung});
}

Baihoc bh02 = new Baihoc(
  tieude: "Bài 02: Kiểu dữ liệu String (chuỗi) trong Python",
  id: "bai02",
  anhbaihoc: "bai02",
  ngonngu: "python",
  giaithich: [
    "Để khai báo một biến dạng chuỗi ta phải đặt chuỗi trong dấu "
        " hoặc dấu ' ' cả hai đều cho ra cùng một kết quả.\n\n Ở ví dụ trên ta đã khai báo hai biến gồm bienA và bienB. Với bienA ta khai báo với dấu "
        " và bienB ta khai báo với dấu ' '.",
    "Chuỗi trong Python được lưu trữ vào trong các ô nhớ với mỗi ô nhớ tương đương với một ký tự đơn (khác với các ngôn ngữ khác) và các ký tự này được xếp liên tiếp với nhau. Do đó kiểu dữ liệu chuỗi trong Python có thể được truy xuất đến từng ký tự trong nó.\n\nTa có thể thấy ở ví dụ trên ta đã truy xuất ra ký tự thứ [0] và [-1] trong chuỗi hoten.\n\nCú pháp sử dụng bao gồm:\n• string là tên tương ứng của một biến dạng chuỗi.\n• index là vị trí của ký tự mà bạn muốn truy xuất từ chuỗi đó.",
    "Python không chỉ hỗ trợ bạn truy xuất một ký tự trong chuỗi mà còn hỗ trợ bạn truy xuất một đoạn chuỗi trong chuỗi",
  ],
  mucnho: [
    "Khai báo một biến dạng chuỗi",
    "Truy xuất một ký tự từ chuỗi",
    "Truy xuất một đoạn chuỗi từ chuỗi",
  ],
  noidung: [
    "assets/images/python_coban/bai02/00.png",
    "assets/images/python_coban/bai02/01.png",
    "assets/images/python_coban/bai02/02.png",
  ],
);
Baihoc bh03 = new Baihoc(
  tieude: "Bài 03: Kiểu dữ liệu số (number) trong Python",
  id: "bai03",
  anhbaihoc: "bai03",
  ngonngu: "python",
  giaithich: [
    "Cũng giống như các ngôn ngữ lập trình khác, Python cũng có kiểu dữ liệu số (number). Nó dùng để lưu trữ hầu hết các kiểu về số như số thực, số phức, số nguyên. Trong Python hỗ trợ cho người dùng ba loại kiểu dữ liệu số:\n\n• int là kiểu số nguyên.\n• float là kiểu số thực.\n• complex là kiểu số phức. Kiểu số nguyên int và kiểu số thực float được phân biệt với nhau qua dấu chấm động (.), Nếu một số có dấu chấm động là kiểu số thực, còn một số không có dấu chấm động là kiểu số nguyên.\n\nVí dụ: a = 5 là kiểu số nguyên, trong khi a = 5.0 là kiểu số thực.\n\n",
    "Trong Python ta có thể dễ dàng kiểm tra kiểu dữ liệu của một biến thông qua hàm type().\n\nỞ ví dụ trên ta thấy được dựa vào cách mà người dùng khai báo biến số, Python sẽ tự động hiểu được kiểu dữ liệu của biến đó là gì. ",
    "Python cũng hỗ trợ người dùng thực hiện các phép toán tử số học để đưa vào tính toán các phép tính từ cơ bản đến phức tạp. Các phép toán tử số học mà Python hỗ trợ bao gồm: \n\n• Phép cộng (+) cộng các giá trị lại với nhau.\n• Phép trừ (-) trừ các giá trị với nhau.\n• Phép nhân (*) nhân các giá trị với nhau.\n• Phép chia (/) chia các giá trị cho nhau.\n•  Phép chia lấy phần dư (%) chia các giá chỉ lấy phần dư.\n• Phép chia làm tròn xuống (//)",
    "Để thực hiện phép cộng số học trong Python và gán kết quả cho một biến khác ta thực hiện theo cú pháp: \n\n' bienGan = soA + soB '\n\nTrong đó: \n\n• bienGan là tên của biến ta cần gán kết quả giá trị của phép tính.\n• soA là tên biến của số hạng đầu tiên.\n• soB là tên biến của số hạng thứ hai.",
    "Để thực hiện phép trừ số học trong Python và gán kết quả cho một biến khác ta thực hiện theo cú pháp: \n\n' bienGan = soA - soB '\n\nTrong đó: \n\n• bienGan là tên của biến ta cần gán kết quả giá trị của phép tính.\n• soA là tên biến của số cần trừ.\n• soB là tên biến của số bị trừ.",
    "Để thực hiện phép nhân số học trong Python và gán kết quả cho một biến khác ta thực hiện theo cú pháp: \n\n' bienGan = soA * soB '\n\nTrong đó: \n\n• bienGan là tên của biến ta cần gán kết quả giá trị của phép tính.\n• soA là tên biến của thừa số đầu tiên.\n• soB là tên biến của thừa số thứ hai.",
    "Để thực hiện phép chia số học trong Python và gán kết quả cho một biến khác ta thực hiện theo cú pháp: \n\n' bienGan = soA / soB '\n\nTrong đó: \n\n• bienGan là tên của biến ta cần gán kết quả giá trị của phép tính.\n• soA là tên biến của số cần chia.\n• soB là tên biến của số bị chia.",
    "Để thực hiện phép chia làm tròn xuống số học trong Python và gán kết quả cho một biến khác ta thực hiện theo cú pháp: \n\n' bienGan = soA // soB '\n\nTrong đó: \n\n• bienGan là tên của biến ta cần gán kết quả giá trị của phép tính.\n• soA là tên biến của số cần chia.\n• soB là tên biến của số bị chia.",
    "Để thực hiện phép chia lấy phần dư số học trong Python và gán kết quả cho một biến khác ta thực hiện theo cú pháp: \n\n' bienGan = soA % soB '\n\nTrong đó: \n\n• bienGan là tên của biến ta cần gán kết quả giá trị của phép tính.\n• soA là tên biến của số cần chia.\n• soB là tên biến của số bị chia.",
    "Để thực hiện phép lũy thừa số học trong Python và gán kết quả cho một biến khác ta thực hiện theo cú pháp: \n\n' bienGan = soA ** soB '\n\nTrong đó: \n\n• bienGan là tên của biến ta cần gán kết quả giá trị của phép tính.\n• soA là tên biến của cơ số.\n• soB là tên biến của số mũ.",
    "Trong Python cho phép chúng ta xóa đi giá trị của một biến, nhằm giải phóng bộ nhớ cho cho máy tính với lệnh 'del'. Cú pháp sử dụng: \n\nXóa một biến ' del tenBiencanXoa '\n\nXóa nhiều biến một lúc ' del tenBiencanXoa1, tenBiencanXoa2, tenBiencanXoa3 '",
  ],
  mucnho: [
    "Các kiểu dữ liệu số",
    "Hàm type()",
    "Toán tử số học trong Python",
    "Phép cộng (+)",
    "Phép trừ (-)",
    "Phép nhân (*)",
    "Phép chia (/)",
    "Phép chia làm tròn (//)",
    "Phép chia lấy phần dư (%)",
    "Phép lũy thừa (**)",
    "Xóa giá trị của biến",
  ],
  noidung: [
    "assets/images/python_coban/bai03/00.png",
    "assets/images/python_coban/bai03/01.png",
    "assets/images/python_coban/bai03/02.png",
    "assets/images/python_coban/bai03/03.png",
    "assets/images/python_coban/bai03/02.png",
    "assets/images/python_coban/bai03/02.png",
    "assets/images/python_coban/bai03/02.png",
    "assets/images/python_coban/bai03/02.png",
    "assets/images/python_coban/bai03/02.png",
    "assets/images/python_coban/bai03/02.png",
    "assets/images/python_coban/bai03/02.png",
  ],
);
