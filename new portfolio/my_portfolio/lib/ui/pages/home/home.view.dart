import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/portfolio.dart' as g;
import 'package:my_portfolio/theme.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:simple_icons/simple_icons.dart';

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
      mobile: desktop(),
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
                    child: Text(
                      g.nickname,
                      style: widget.theme.textTheme.subtitle1,
                    ),
                  ),
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
                          onPressed: () {},
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
                        // final url = project["youtube_url"];
                        // if (await canLaunch(url)) {
                        //   await launch(url);
                        // } else {
                        //   throw 'Could not launch $url';
                        // }
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
    return Container(color: Colors.blue);
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
                            size: 64.0,
                          ),
                          // child: Icon(SimpleIcons.github),
                        );
                      }),
                    ),
                  ),
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
