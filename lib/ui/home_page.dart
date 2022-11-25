import 'package:flutter/material.dart';
import 'package:mykrs_projek/util/color_textstyle.dart';
import 'package:mykrs_projek/widget/top_navbar.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (contex, constrains) {
         if(constrains.maxWidth <1020){
          return HomePageTablet();
        } else{
          return HomepageDesktop();
        }
        
      },
    );
  }
}



final ScrollController _controllerOne = ScrollController();

class HomepageDesktop extends StatefulWidget {
  const HomepageDesktop({super.key});

  @override
  State<HomepageDesktop> createState() => _HomepageDesktopState();
}
class _HomepageDesktopState extends State<HomepageDesktop> {
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      controller: _controllerOne,
      child: Column(
        children: [
          WelcomSection(),
          const SizedBox(
            height: 61,
          ),
          //GAMBAR LINGKARANG FULL
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 100),
                child: Image.asset(
                  "assets/lingkarang.png",
                  width: 489,
                  height: 489,
                ),
              )),
          const SizedBox(
            height: 61,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.2,
            color: Colors.red,
          ),
          contactUsSection(context),
        ],
      ),
    ));
  }
}

class HomePageTablet extends StatefulWidget {
  const HomePageTablet({super.key});

  @override
  State<HomePageTablet> createState() => _HomePageTabletState();
}

class _HomePageTabletState extends State<HomePageTablet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      controller: _controllerOne,
      child: Column(
        children: [
         WelcomSection(isShow: false,),
          const SizedBox(
            height: 50,
          ),
          //GAMBAR KALENDER + ORANG
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 100),
                child: Image.asset(
                "assets/kalender.png",
                width: 410,
                height: 450,
              ),
              )),
          
          
          const SizedBox(
            height: 61,
          ),
          //GAMBAR LINGKARANG FULL
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 100),
                child: Image.asset(
                  "assets/lingkarang.png",
                  width: 489,
                  height: 489,
                ),
              )),
          const SizedBox(
            height: 61,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.2,
            color: Colors.red,
          ),

          //BAGIAN KONTAK US
          contactUsSection(context),
          
        ],
      ),
    ));
  }
}

Widget contactUsSection(BuildContext context) => Container(
            width: MediaQuery.of(context).size.width,
            height: 354,
            color: darkBlueColors,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 58,
                ),
                Center(
                  child: Text(
                    "Contact Us",
                    style: whitetitleStyle,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Container(
                  height: 119,
                  width: 203,
                  margin: const EdgeInsets.only(left: 81),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: whiteColor),
                  child: Center(
                    child: logoMyKRS()
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 81),
                  child: Text(
                    "Developed by BCC Team © 2022",
                    style: whiteSubtitle,
                  ),
                )
              ],
            ),
          );




