part of home_view;

class _HomeMobile extends StatelessWidget {
  final ThemeData theme;

  _HomeMobile(this.theme);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    List<Widget> body = [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              g.full_name,
              style: theme.textTheme.headline1,
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
                      textStyle: theme.textTheme.subtitle1,
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
                style: theme.textTheme.bodyText1,
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
                  style: theme.textTheme.button!.copyWith(color: Colors.white, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
          // SizedBox(height: 20),
          Image.asset(
            "assets/images/code.gif",
            height: width,
            width: width,
            fit: BoxFit.fitWidth,
          ),
          SizedBox(height: 00),
        ],
      ),
      Center(
          child: Text(
        "What I Do ?",
        style: theme.textTheme.headline2,
      )),
    ];

    g.skills.forEach((element) {
      body.add(_whatIdoItem(element, context));
    });

    body.add(MyFooter());
    return ListView(
      // children: body.reversed.toList(),
      children: body,
    );
  }

  _whatIdoItem(element, context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    List<dynamic> skills = element["skills"] as List<dynamic>;

    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            element["title"],
            style: theme.textTheme.headline3,
            textAlign: TextAlign.center,
          ),
          Wrap(
            // Generate 100 widgets that display their index in the List.
            children: List.generate(element["softwareSkills"].length, (index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  element["softwareSkills"][index]["fontAwesomeClassname"] as IconData,
                  color: element["softwareSkills"][index]["style"]["backgroundColor"] as Color,
                  size: 48.0,
                ),
                // child: Icon(SimpleIcons.github),
              );
            }),
          ),
          SizedBox(height: 50),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: skills.map((e) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.star, color: Colors.yellow),
                    SizedBox(width: 5),
                    Flexible(
                      child: Text(
                        e,
                        style: theme.textTheme.subtitle2,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Image.asset(element["fileName"]),
          ),
        ],
      ),
    );
  }
}
