part of projects_view;

class _ProjectsMobile extends StatelessWidget {
  final ThemeData theme;

  _ProjectsMobile(this.theme);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    List<Widget> body = [
      SizedBox(
        width: width,
        height: height * 0.5,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/projects_image.png",
                    // height: 125.0,
                    // width: 125.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Projects",
                      style: theme.textTheme.headline1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "My projects makes use of vast variety of latest technology tools",
                      style: theme.textTheme.bodyText1,
                    ),
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
      "My Top Flutter projects as Frontend Developer",
      style: theme.textTheme.headline2,
      textAlign: TextAlign.center,
    )));
    body.add(_projectItem2(g.flutter_projects, context));

    body.add(Center(
        child: Text(
      "My Top QT5 project as Embedded Systems Engineer",
      style: theme.textTheme.headline2,
      textAlign: TextAlign.center,
    )));
    body.add(_projectItem(g.projects, context));

    body.add(Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: MyTheme.jacketColor),
          onPressed: () async {
            final url = g.github_repository_link;
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              throw 'Could not launch $url';
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "More Projects",
              style: theme.textTheme.button!.copyWith(color: Colors.white, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    ));

    body.add(SizedBox(height: 30.0));

    body.add(MyFooter());
    return ListView(
      // children: body.reversed.toList(),
      children: body,
    );
  }

  _projectItem(List<dynamic> projects, context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 0.0),
      child: GridView.count(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 1,
        crossAxisSpacing: 50,
        mainAxisSpacing: 50,
        childAspectRatio: 1.0,
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
                  Expanded(
                    flex: 1,
                    child: Container(
                      // width: 200,
                      // color: MyTheme.card_header_color,
                      // decoration: BoxDecoration(
                      //   color: certification["color_code"] as Color,
                      //   shape: BoxShape.rectangle,
                      //   borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
                      // ),
                      child: Image.asset(
                        project["cover_image_url"],
                        // height: 400,
                        //  width: 200,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
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
                            child: Text(project["title"], style: theme.textTheme.headline4),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(project["subtitle"], style: theme.textTheme.bodyText2),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                                          style: theme.textTheme.button!.copyWith(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                                          style: theme.textTheme.button!.copyWith(color: Colors.white),
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

  _projectItem2(List<dynamic> projects, context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      child: GridView.count(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 1,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: (width / height) +0.25,
        children: projects.map((project) {
          return Column(
            children: [
              HoverButton(
                onpressed: () async {
                  final url = project["repository_url"];
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
                child: Card(
                  elevation: 1.0,
                  color: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Column(
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
                          height: 300,
                          width: double.infinity,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        // height: 150,
                        width: double.infinity,
                        // color: MyTheme.card_body_color,
                        decoration: BoxDecoration(
                          color: MyTheme.card_body_color,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15.0), bottomRight: Radius.circular(15.0)),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(project["title"], style: theme.textTheme.bodyText2),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                project["subtitle"],
                                style: theme.textTheme.bodyText2!.copyWith(fontWeight: FontWeight.w400),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                project["youtube_url"] == null
                                    ? Container()
                                    : Padding(
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
                                                style: theme.textTheme.button!.copyWith(color: Colors.white),
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
                                          style: theme.textTheme.button!.copyWith(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
