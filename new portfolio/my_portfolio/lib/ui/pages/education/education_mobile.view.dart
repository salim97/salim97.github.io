part of education_view;

class _EducationMobile extends StatelessWidget {
  _EducationMobile();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    List<Widget> body = [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/education.png",
            // height: 125.0,
            // width: 125.0,
          ),
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
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 20),
        ],
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

    body.add(_certificationReceivedItem(context));

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
      child: Column(
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
          SizedBox(
            width: width * 0.8,
            height: height * 0.7,
            child: Card(
              elevation: 10.0,
              color: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                children: [
                  Container(
                    height: 170,
                    // color: MyTheme.card_header_color,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: MyTheme.card_header_color,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(element["title"], style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 23)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(element["subtitle"], style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 18)),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 1.0),
                          child: Text(element["duration"], style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 16)),
                        ),
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
                                child: Text(e,
                                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 18, fontWeight: FontWeight.w400)),
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
    );
  }

  _certificationReceivedItem(context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    List<dynamic> certifications = g.certifications;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
      child: GridView.count(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 1,
        crossAxisSpacing: 25,
        mainAxisSpacing: 25,
        childAspectRatio: 1.8,
        children: certifications.map((certification) {
          return GestureDetector(
            onTap: () async {
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
                        height: 200,
                        width: 200,
                      ),
                    ),
                  ),
                  Container(
                    height: 110,
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
