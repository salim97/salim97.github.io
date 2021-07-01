import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/portfolio.dart' as g;
import 'package:my_portfolio/theme.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactMeView extends StatefulWidget {
  final ThemeData theme;
  ContactMeView({Key? key, required this.theme}) : super(key: key);

  @override
  _ContactMeViewState createState() => _ContactMeViewState();
}

class _ContactMeViewState extends State<ContactMeView> {
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
              right: 0,
              bottom: 0,
              width: width * 0.45,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      g.contactPageData["contactSection"]!["title"].toString(),
                      style: widget.theme.textTheme.headline1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      g.contactPageData["contactSection"]!["description"].toString(),
                      style: widget.theme.textTheme.bodyText1!.copyWith(fontSize: 20),
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
                          "See My Resume",
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
              left: 0,
              bottom: 0,
              width: width * 0.40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    g.contactPageData["contactSection"]!["profile_image_path"].toString(),
                    // height: 125.0,
                    // width: 125.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        width: width,
        height: height * 0.8,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              bottom: 0,
              width: width * 0.45,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      g.contactPageData["addressSection"]!["title"].toString(),
                      style: widget.theme.textTheme.headline1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      g.contactPageData["addressSection"]!["subtitle"].toString(),
                      style: widget.theme.textTheme.subtitle1!.copyWith(fontWeight: FontWeight.w400),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      g.contactPageData["phoneSection"]!["title"].toString(),
                      style: widget.theme.textTheme.headline1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      g.contactPageData["phoneSection"]!["subtitle"].toString(),
                      style: widget.theme.textTheme.subtitle1!.copyWith(fontWeight: FontWeight.w400),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: MyTheme.jacketColor),
                      onPressed: () async {
                        final url = g.contactPageData["addressSection"]!["location_map_link"].toString();
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Visit on Google Maps",
                          style: widget.theme.textTheme.button!.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
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
                  Image.asset(
                    g.contactPageData["addressSection"]!["avatar_image_path"].toString(),
                    // height: 125.0,
                    // width: 125.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ];

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
}
