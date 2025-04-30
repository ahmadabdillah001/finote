import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

Color primaryColor = Color(0xff191919);
Color lightenPrimaryColor = Color(0xff2B2B2B);
Color darkenSecondaryColor = Color(0xff986642);
Color lightenSecondaryColor = Color.fromARGB(255, 255, 202, 164);
Color secondaryColor = Color(0xffFEAA6E);
Color whiteColor = Color(0xFFFFFFFF);
Color greenColor = Color(0xff00A638);
Color redColor = Color(0xffDD0E0E);
Color greyColor = Color(0xff5A5A5A);

TextStyle logoTextStyle = GoogleFonts.gugi(
  fontSize: 48,
  color: secondaryColor,
);

TextStyle navTextStyle = GoogleFonts.inter(
  fontSize: 24,
  color: primaryColor,
  fontWeight: semiBold
);

TextStyle labelFormTextStyle = GoogleFonts.inter(
  fontWeight: semiBold,
  color: whiteColor,
);

TextStyle hintFormTextStyle = GoogleFonts.inter(
  color: greyColor,
);

TextStyle linkTextStyle = GoogleFonts.inter(
  fontWeight: semiBold,
  color: secondaryColor,
);

TextStyle lableListTextStyle = GoogleFonts.inter(
  fontSize: 20,
  color: whiteColor,
  fontWeight: semiBold,
);

TextStyle titleListTextStyle = GoogleFonts.inter(
  fontSize: 18,
  color: whiteColor,
  fontWeight: medium,
);

TextStyle subTitleListTextStyle = GoogleFonts.inter(
  fontSize: 12,
  color: whiteColor,
);

TextStyle buttonTextStyle = GoogleFonts.inter(
  color: primaryColor,
  fontWeight: semiBold,
);

TextStyle bottomBarTextStyle = GoogleFonts.inter(
  fontSize: 12,
  color: whiteColor,
  fontWeight: semiBold
);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extraBold = FontWeight.w800;
FontWeight black = FontWeight.w900;