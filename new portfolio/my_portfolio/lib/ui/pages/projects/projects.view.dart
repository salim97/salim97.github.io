import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/portfolio.dart' as g;
import 'package:my_portfolio/theme.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsView extends StatefulWidget {
  final ThemeData theme;
  ProjectsView({Key? key, required this.theme}) : super(key: key);

  @override
  _ProjectsViewState createState() => _ProjectsViewState();
}

class _ProjectsViewState extends State<ProjectsView> {
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Projects",
                      style: widget.theme.textTheme.headline1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "My projects makes use of vast variety of latest technology tools",
                      style: widget.theme.textTheme.subtitle1,
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
                    "assets/images/projects_image.png",
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
    body.add(Center(
        child: Text(
      "My Top QT5 project as Embedded Systems Engineer",
      style: widget.theme.textTheme.headline2,
    )));
    body.add(_projectItem());
    body.add(Center(
        child: Text(
      "My Top Flutter projects as Frontend Developer",
      style: widget.theme.textTheme.headline2,
    )));
    body.add(_projectItem());

    body.add(Center(
      child: Padding(
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
              "More Projects",
              style: widget.theme.textTheme.button!.copyWith(color: Colors.white, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    ));
    
    body.add(SizedBox(height: 30.0));

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

  _projectItem() {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    List<dynamic> projects = g.projects;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 80.0, horizontal: 90.0),
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 2,
        crossAxisSpacing: 50,
        mainAxisSpacing: 50,
        childAspectRatio: 2.9,
        children: projects.map((project) {
          return GestureDetector(
            onTap: () async {
              final url = project["certificate_link"];
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            },
            child: Card(
              elevation: 10.0,
              color: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Row(
                children: [
                  Container(
                    // width: double.infinity,
                    // color: MyTheme.card_header_color,
                    // decoration: BoxDecoration(
                    //   color: certification["color_code"] as Color,
                    //   shape: BoxShape.rectangle,
                    //   borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
                    // ),
                    child: Image.asset(
                      project["cover_image_url"],
                      // height: 400,
                      // width: 400,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      // height: 150,
                      width: double.infinity,
                      // color: MyTheme.card_body_color,
                      decoration: BoxDecoration(
                        color: MyTheme.card_body_color,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.only(topRight: Radius.circular(15.0), bottomRight: Radius.circular(15.0)),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(project["title"], style: widget.theme.textTheme.bodyText2),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(project["subtitle"], style: widget.theme.textTheme.bodyText2),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(primary: Colors.red),
                                    onPressed: () async {
                                      final url = project["youtube_url"];
                                      if (await canLaunch(url)) {
                                        await launch(url);
                                      } else {
                                        throw 'Could not launch $url';
                                      }
                                    },
                                    child: Row(
                                      children: [
                                        FaIcon(FontAwesomeIcons.youtube),
                                        SizedBox(width: 10),
                                        Text(
                                          "Youtube",
                                          style: widget.theme.textTheme.button!.copyWith(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      final url = project["repository_url"];
                                      if (await canLaunch(url)) {
                                        await launch(url);
                                      } else {
                                        throw 'Could not launch $url';
                                      }
                                    },
                                    child: Row(
                                      children: [
                                        FaIcon(FontAwesomeIcons.github),
                                        SizedBox(width: 10),
                                        Text(
                                          "Source Code",
                                          style: widget.theme.textTheme.button!.copyWith(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
