import 'package:flutter/cupertino.dart';

Color primary = const Color(0xFF687daf);

class AppStyles {
  static Color primaryColor = primary;
  static Color bgColor = const Color(0xFFFFFFFF);
  static Color textColor = const Color(0xFF3b3b3b);
  static Color layoutColor = const Color(0xFFF4F6FD);
  static Color expansionTileColor = const Color(0x330000ff);
  static Color simpleBarColor = const Color(0xFFD3D3D3); // => simplebar widget을 위한 색상입니다. 세진이 세팅쪽에서도 이걸 활용해서 통일하면 좋을듯
  static TextStyle textStyle =
      const TextStyle(fontSize: 16, fontWeight: FontWeight.w500);
  static TextStyle headLineStyle1 =
      const TextStyle(fontSize: 26, fontWeight: FontWeight.bold);
  static TextStyle headLineStyle2 =
      const TextStyle(fontSize: 21, fontWeight: FontWeight.bold);
  static TextStyle headLineStyle3 =
      const TextStyle(fontSize: 17, fontWeight: FontWeight.w500);
}
