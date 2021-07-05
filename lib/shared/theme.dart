part of 'shared.dart';

Color blueColor1 = "3366FF".toColor();
Color blueColor2 = "254EDB".toColor();
Color whiteColor1 = "F7F8FA".toColor();
Color blackColor1 = "2C2C2C".toColor();
Color blackColor2 = "363853".toColor();
Color grayColor1 = "868686".toColor();
Color grayColor2 = "CBCBCB".toColor();
Color grayColor3 = "888888".toColor();
Color grayColor4 = "B0B0B5".toColor();

TextStyle blackFontStyle1 = GoogleFonts.poppins().copyWith(color: Colors.black);
TextStyle blackFontStyle2 = GoogleFonts.poppins().copyWith(color: blackColor2);
TextStyle whiteFontStyle1 = GoogleFonts.poppins().copyWith(color: Colors.white);
TextStyle grayFontStyle1 = GoogleFonts.poppins().copyWith(color: grayColor1);
TextStyle grayFontStyle2 = GoogleFonts.poppins().copyWith(color: grayColor2);
TextStyle grayFontStyle3 = GoogleFonts.poppins().copyWith(color: grayColor3);
TextStyle grayFontStyle4 = GoogleFonts.poppins().copyWith(color: grayColor4);
TextStyle blueFontStyle1 = GoogleFonts.poppins().copyWith(color: blueColor1);

const double defaultMargin = 30;

Widget loadingIndicator = SpinKitFadingCircle(
  size: 45,
  color: blueColor1,
);