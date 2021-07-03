import 'package:flutter/material.dart';
import 'package:my_portfolio/ui/pages/education/education.view.dart';
import 'package:my_portfolio/ui/pages/projects/projects.view.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'theme.dart';
import 'ui/pages/contact/contactme.view.dart';
import 'ui/pages/home/home.view.dart';
// import 'ui/pages/projects/projects.view.dart.old';
import 'ui/widgets/navBarLogo.widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainWindow(),
    );
  }
}

class MainWindow extends StatefulWidget {
  const MainWindow({Key? key}) : super(key: key);

  @override
  _MainWindowState createState() => _MainWindowState();
}

enum Menu { home, education, projects, contact_me }

class _MainWindowState extends State<MainWindow> {
  Menu menu = Menu.contact_me;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    print(width);
    bool mobile = false;
    ThemeData _theme;
    double horizontal_padding = 100.0;
    double vertical_padding = 30.0;
    if (width > 1380) {
      // Desktop screen
      _theme = MyTheme.blueThemeDataDesktop;
      horizontal_padding = 100.0;
      vertical_padding = 30.0;
      mobile = false;
    } else {
      if (width > 760) {
        // tablet screen
        _theme = MyTheme.blueThemeDataTablet;
        horizontal_padding = 50.0;
        vertical_padding = 30.0;
        mobile = false;
      } else {
        // Mobile screen
        _theme = MyTheme.blueThemeDataMobile;
        horizontal_padding = 10.0;
        vertical_padding = 30.0;
        mobile = true;
      }
    }

    Widget bodyWidget = HomeView(theme: _theme);
    if (menu == Menu.home) bodyWidget = HomeView(theme: _theme);
    if (menu == Menu.education) bodyWidget = EducationView(theme: _theme);
    if (menu == Menu.projects) bodyWidget = ProjectsView(theme: _theme);
    if (menu == Menu.contact_me) bodyWidget = ContactMeView(theme: _theme);

    return Container(
      color: MyTheme.body,
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.transparent,
        endDrawer: Drawer(
          child: Column(
            children: [
              SizedBox(height: 40),
              NavBarLogo(
                height: 40,
                onTap: () {
                  setState(() {
                    menu = Menu.home;
                  });
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 18.0),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      menu = Menu.home;
                    });
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Home",
                    style: _theme.textTheme.button!
                        .copyWith(fontWeight: menu == Menu.home ? FontWeight.w700 : FontWeight.w400, color: Colors.black),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 18.0),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      menu = Menu.education;
                    });
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Education",
                    style: _theme.textTheme.button!
                        .copyWith(fontWeight: menu == Menu.education ? FontWeight.w700 : FontWeight.w400, color: Colors.black),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 18.0),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      menu = Menu.projects;
                    });
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Projects",
                    style: _theme.textTheme.button!
                        .copyWith(fontWeight: menu == Menu.projects ? FontWeight.w700 : FontWeight.w400, color: Colors.black),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 18.0),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      menu = Menu.contact_me;
                    });
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Contact Me",
                    style: _theme.textTheme.button!
                        .copyWith(fontWeight: menu == Menu.contact_me ? FontWeight.w700 : FontWeight.w400, color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            Positioned(
              top: mobile ? 30 : 20,
              left: mobile ? 20 : 40,
              right: mobile ? 00 : 40,
              child: Row(
                children: [
                  NavBarLogo(
                    height: 40,
                    onTap: () {
                      setState(() {
                        menu = Menu.home;
                      });
                    },
                  ),
                  Expanded(child: Container()),
                  !mobile
                      ? Container()
                      : Padding(
                          padding: EdgeInsets.symmetric(horizontal: 18.0),
                          child: IconButton(
                            onPressed: () {
                              _scaffoldKey.currentState!.openEndDrawer();
                            },
                            icon: Icon(Icons.menu),
                            color: Colors.black,
                          ),
                        ),
                  mobile
                      ? Container()
                      : Padding(
                          padding: EdgeInsets.symmetric(horizontal: 18.0),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                menu = Menu.home;
                              });
                            },
                            child: Text(
                              "Home",
                              style: _theme.textTheme.button!
                                  .copyWith(fontWeight: menu == Menu.home ? FontWeight.w700 : FontWeight.w400, color: Colors.black),
                            ),
                          ),
                        ),
                  mobile
                      ? Container()
                      : Padding(
                          padding: EdgeInsets.symmetric(horizontal: 18.0),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                menu = Menu.education;
                              });
                            },
                            child: Text(
                              "Education",
                              style: _theme.textTheme.button!
                                  .copyWith(fontWeight: menu == Menu.education ? FontWeight.w700 : FontWeight.w400, color: Colors.black),
                            ),
                          ),
                        ),
                  mobile
                      ? Container()
                      : Padding(
                          padding: EdgeInsets.symmetric(horizontal: 18.0),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                menu = Menu.projects;
                              });
                            },
                            child: Text(
                              "Projects",
                              style: _theme.textTheme.button!
                                  .copyWith(fontWeight: menu == Menu.projects ? FontWeight.w700 : FontWeight.w400, color: Colors.black),
                            ),
                          ),
                        ),
                  mobile
                      ? Container()
                      : Padding(
                          padding: EdgeInsets.symmetric(horizontal: 18.0),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                menu = Menu.contact_me;
                              });
                            },
                            child: Text(
                              "Contact Me",
                              style: _theme.textTheme.button!
                                  .copyWith(fontWeight: menu == Menu.contact_me ? FontWeight.w700 : FontWeight.w400, color: Colors.black),
                            ),
                          ),
                        ),
                ],
              ),
            ),
            Positioned(
              top: 100,
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontal_padding, vertical: 0.0),
                child: bodyWidget,
              ),
            )
          ],
        ),
      ),
    );
  }
}
