import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

const Color orangeColors = Color(0xffFF7E23);
const Color darkBlueColors = Color(0xff203B4E);
const Color whiteColor = Color(0xffFCF4F5);
const Color lightBlueColor = Color(0xff3598DB);
const Color lightgreyColor = Color(0xff787777);
const Color tabelColor2 = Color(0xffF0F0F0);

TextStyle logoStyle = GoogleFonts.montserrat(
  fontSize: 32,
  fontWeight: FontWeight.w800,
);

TextStyle appBarStyle = GoogleFonts.asap(
  fontSize: 24,
  fontWeight: FontWeight.w600,
  color: darkBlueColors,
);

TextStyle buttonWhiteStlye = GoogleFonts.asap(
  fontSize: 24,
  fontWeight: FontWeight.w600,
  color: whiteColor,
);

TextStyle titlePageStlye = GoogleFonts.asap(
  fontSize: 48,
  fontWeight: FontWeight.w700,
  color: darkBlueColors,
);

TextStyle subPageStlye = GoogleFonts.asap(
  fontWeight: FontWeight.w400,
  color: lightgreyColor,
);

TextStyle whitetitleStyle = GoogleFonts.asap(
  fontSize: 48,
  fontWeight: FontWeight.w700,
  color: whiteColor,
);

TextStyle whiteSubtitle = GoogleFonts.asap(
  fontSize: 20,
  fontWeight: FontWeight.w400,
  color: whiteColor,
);

TextStyle dropDownTextStyle = GoogleFonts.asap(
  fontSize: 20,
  fontWeight: FontWeight.w500,
  color: darkBlueColors,
);

TextStyle tableTextStyle = GoogleFonts.asap(
  fontSize: 14,
  fontWeight: FontWeight.w600,
  color: darkBlueColors,
);

TextStyle loginSubPageStlye = GoogleFonts.asap(
  fontSize: 24,
  fontWeight: FontWeight.w700,
  color: lightgreyColor,
);

TextStyle lilteBluestlye = GoogleFonts.asap(
  fontSize: 16,
  fontWeight: FontWeight.w700,
  color: lightBlueColor,
);

TextStyle routeTextStyle = GoogleFonts.asap(
  fontSize: 16,
  fontWeight: FontWeight.w600,
  color: darkBlueColors,
);

class GradienColor extends StatelessWidget {
  const GradienColor({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [lightBlueColor, lightgreyColor, orangeColors])),
    );
  }
}
