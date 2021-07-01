import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/portfolio.dart' as g;
import 'package:my_portfolio/theme.dart';
import 'package:my_portfolio/ui/widgets/entranceFader.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeView extends StatefulWidget {
  final ThemeData theme;
  HomeView({Key? key, required this.theme}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      breakpoints: ScreenBreakpoints(tablet: 760, desktop: 1380, watch: 300),
      mobile: mobile(),
      tablet: desktop(),
      desktop: desktop(),
    );
  }

  desktop() {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    List<Widget> body = [
      SizedBox(
        width: width,
        height: height * 0.8,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              bottom: 0,
              width: width * 0.45,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      g.full_name,
                      style: widget.theme.textTheme.headline1,
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: EntranceFader(
                        offset: Offset(-10, 0),
                        delay: Duration(seconds: 1),
                        duration: Duration(milliseconds: 800),
                        child: Row(
                          children: [
                            Icon(
                              Icons.play_arrow_rounded,
                              color: MyTheme.secondaryText_color,
                            ),
                            TyperAnimatedTextKit(
                              isRepeatingAnimation: true,
                              speed: Duration(milliseconds: 50),
                              textStyle: widget.theme.textTheme.subtitle1,
                              text: g.nickname,
                            ),
                          ],
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: width * 0.42,
                      child: Text(
                        g.subTitle,
                        style: widget.theme.textTheme.bodyText1,
                      ),
                    ),
                  ),
                  Wrap(
                    // Generate 100 widgets that display their index in the List.
                    children: List.generate(g.socialMediaLinks.length, (index) {
                      // print(g.socialMediaLinks.elementAt(index)["fontAwesomeIcon"]);
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FloatingActionButton(
                          onPressed: () async {
                            final url = g.socialMediaLinks.elementAt(index)["link"].toString();
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                          child: FaIcon(g.socialMediaLinks.elementAt(index)["fontAwesomeIcon"] as IconData),
                          backgroundColor: g.socialMediaLinks.elementAt(index)["backgroundColor"] as Color,
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: MyTheme.jacketColor),
                      onPressed: () async {
                        final url = g.resumeLink;
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "See My Resume ( CV )",
                          style: widget.theme.textTheme.button!.copyWith(color: Colors.white, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              bottom: 0,
              width: width * 0.40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/code.gif",
                    // height: 125.0,
                    // width: 125.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      Center(
          child: Text(
        "What I Do ?",
        style: widget.theme.textTheme.headline2,
      )),
    ];

    g.skills.forEach((element) {
      body.add(_whatIdoItem(element));
    });

    body.add(
      Center(
          child: Text(
        "Made with Flutter Web by Salim Benabadji",
        style: widget.theme.textTheme.subtitle2,
      )),
    );
    return ListView(
      // children: body.reversed.toList(),
      children: body,
    );
  }

  mobile() {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    List<Widget> body = [
      SizedBox(
        width: width,
        height: height * 0.8,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              // height: height * 0.45,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      g.full_name,
                      style: widget.theme.textTheme.headline1,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: EntranceFader(
                        offset: Offset(-10, 0),
                        delay: Duration(seconds: 1),
                        duration: Duration(milliseconds: 800),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.play_arrow_rounded,
                              color: MyTheme.secondaryText_color,
                            ),
                            TyperAnimatedTextKit(
                              isRepeatingAnimation: true,
                              speed: Duration(milliseconds: 50),
                              textStyle: widget.theme.textTheme.subtitle1,
                              text: g.nickname,
                            ),
                          ],
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: width,
                      child: Text(
                        g.subTitle,
                        style: widget.theme.textTheme.bodyText1,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Wrap(
                    // Generate 100 widgets that display their index in the List.
                    children: List.generate(g.socialMediaLinks.length, (index) {
                      // print(g.socialMediaLinks.elementAt(index)["fontAwesomeIcon"]);
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FloatingActionButton(
                          onPressed: () async {
                            final url = g.socialMediaLinks.elementAt(index)["link"].toString();
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                          child: FaIcon(g.socialMediaLinks.elementAt(index)["fontAwesomeIcon"] as IconData),
                          backgroundColor: g.socialMediaLinks.elementAt(index)["backgroundColor"] as Color,
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: MyTheme.jacketColor),
                      onPressed: () async {
                        final url = g.resumeLink;
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "See My Resume ( CV )",
                          style: widget.theme.textTheme.button!.copyWith(color: Colors.white, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: Image.asset(
                      "assets/images/code.gif",
                      // height: 125.0,
                      // width: 125.0,
                    ),
                  ),
                  SizedBox(height: 50),
                ],
              ),
            ),
          ],
        ),
      ),
      Center(
          child: Text(
        "What I Do ?",
        style: widget.theme.textTheme.headline2,
      )),
    ];

    g.skills.forEach((element) {
      body.add(_whatIdoItem(element));
    });

    body.add(
      Center(
          child: Text(
        "Made with Flutter Web by Salim Benabadji",
        style: widget.theme.textTheme.subtitle2,
      )),
    );
    return ListView(
      // children: body.reversed.toList(),
      children: body,
    );
  }

  _whatIdoItem(element) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    List<dynamic> skills = element["skills"] as List<dynamic>;

    return SizedBox(
      width: width,
      height: height * 0.6,
      child: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              bottom: 0,
              width: width * 0.45,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    element["title"],
                    style: widget.theme.textTheme.headline3,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Wrap(
                      // Generate 100 widgets that display their index in the List.
                      children: List.generate(element["softwareSkills"].length, (index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            element["softwareSkills"][index]["fontAwesomeClassname"] as IconData,
                            color: element["softwareSkills"][index]["style"]["backgroundColor"] as Color,
                            size: 32.0,
                          ),
                          // child: Icon(SimpleIcons.github),
                        );
                      }),
                    ),
                  ),
                  SizedBox(height: 40),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: skills.map((e) {
                      return Text(
                        e,
                        style: widget.theme.textTheme.subtitle2,
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              bottom: 0,
              width: width * 0.40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0.0),
                    child: Image.asset(element["fileName"]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
