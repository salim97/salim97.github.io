part of contactme_view;

class _ContactMeMobile extends StatelessWidget {
  final ThemeData theme;

  _ContactMeMobile(this.theme);

  @override
  Widget build(BuildContext context) {
final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    List<Widget> body = [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            g.contactPageData["contactSection"]!["profile_image_path"].toString(),
            // height: 125.0,
            // width: 125.0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              g.contactPageData["contactSection"]!["title"].toString(),
              style: theme.textTheme.headline1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              g.contactPageData["contactSection"]!["description"].toString(),
              style: theme.textTheme.bodyText1!.copyWith(fontSize: 20),
              textAlign: TextAlign.center,
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
                  style: theme.textTheme.button!.copyWith(color: Colors.white, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            g.contactPageData["addressSection"]!["avatar_image_path"].toString(),
            // height: 125.0,
            // width: 125.0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              g.contactPageData["addressSection"]!["title"].toString(),
              style: theme.textTheme.headline1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              g.contactPageData["addressSection"]!["subtitle"].toString(),
              style: theme.textTheme.bodyText1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              g.contactPageData["phoneSection"]!["title"].toString(),
              style: theme.textTheme.headline1,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              g.contactPageData["phoneSection"]!["subtitle"].toString(),
              style: theme.textTheme.bodyText1,
              textAlign: TextAlign.center,
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
                  style: theme.textTheme.button!.copyWith(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    ];

    body.add(
      Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 18.0),
            child: Text(
        "Made with Flutter Web by Salim Benabadji",
        style: theme.textTheme.subtitle2,
      ),
          )),
    );
    return ListView(
      // children: body.reversed.toList(),
      children: body,
    );
  }
}
