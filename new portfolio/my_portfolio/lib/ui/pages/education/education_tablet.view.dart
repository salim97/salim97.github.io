part of education_view;

class _EducationTablet extends StatelessWidget {
  _EducationTablet();

  @override
  Widget build(BuildContext context) {
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
                      "Education",
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Basic Qualification and Certifications",
                      style: Theme.of(context).textTheme.titleMedium,
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
                    "assets/images/education.png",
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
        "Degrees Received",
        style: Theme.of(context).textTheme.displayMedium,
      )),
    ];

    g.degrees.forEach((element) {
      body.add(_degreeReceivedItem(element, context));
    });

    // body.add(_certificationReceivedItem(context));

    body.add(MyFooter());
    return ListView(
      // children: body.reversed.toList(),
      children: body,
    );
  }

  _degreeReceivedItem(element, context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    List<dynamic> descriptions = element["descriptions"] as List<dynamic>;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: height * 0.37,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Image.asset(
                "assets/images/USTO-LOGO.png",
                height: 200.0,
                width: 200.0,
              ),
            ),
            Expanded(
              // width: width * 0.6,
              // width: double.infinity,
              child: Card(
                elevation: 10.0,
                color: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Column(
                  children: [
                    Container(
                      // height: 100,
                      width: double.infinity,
                      // color: MyTheme.card_header_color,
                      decoration: BoxDecoration(
                        color: MyTheme.card_header_color,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(element["title"], style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 23)),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(element["subtitle"], style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 18)),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(element["duration"], style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 16)),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Expanded(
                        child: Container(
                      // color: MyTheme.card_body_color,
                      decoration: BoxDecoration(
                        color: MyTheme.card_body_color,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15.0), bottomRight: Radius.circular(15.0)),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            bottom: 0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: descriptions.map((e) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(e, style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 18)),
                                );
                              }).toList(),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(backgroundColor: MyTheme.card_header_color),
                                onPressed: () async {
                                  final url = element["website_link"];
                                  if (await canLaunch(url)) {
                                    await launch(url);
                                  } else {
                                    throw 'Could not launch $url';
                                  }
                                },
                                child: Text(
                                  "Visit Website",
                                  style: Theme.of(context).textTheme.labelLarge!.copyWith(color: MyTheme.text_color),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _certificationReceivedItem(context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    List<dynamic> certifications = g.certifications;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 80.0, horizontal: 90.0),
      child: GridView.count(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        crossAxisSpacing: 50,
        mainAxisSpacing: 50,
        // childAspectRatio: 2.2,
        children: certifications.map((certification) {
          return HoverButton(
            onpressed: () async {
              final url = certification["certificate_link"];
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
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      // color: MyTheme.card_header_color,
                      decoration: BoxDecoration(
                        color: certification["color_code"] as Color,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
                      ),
                      child: Image.asset(
                        certification["logo_path"],
                        height: 250,
                        width: 300,
                      ),
                    ),
                  ),
                  Container(
                    // height: 110,
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
                          child: Text(certification["title"], style: Theme.of(context).textTheme.headlineMedium),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(certification["subtitle"], style: Theme.of(context).textTheme.bodyMedium),
                        ),
                      ],
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
