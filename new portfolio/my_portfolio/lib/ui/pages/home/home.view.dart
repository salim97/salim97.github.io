library home_view;

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/portfolio.dart' as g;
import 'package:my_portfolio/theme.dart';
import 'package:my_portfolio/ui/widgets/entranceFader.widget.dart';
import 'package:my_portfolio/ui/widgets/footer.widget.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:url_launcher/url_launcher.dart';

part 'home_mobile.view.dart';
part 'home_tablet.view.dart';
part 'home_desktop.view.dart';


class HomeView extends StatelessWidget {
  final ThemeData theme;

  const HomeView({Key? key, required this.theme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      breakpoints: ScreenBreakpoints(tablet: 760, desktop: 1380, watch: 300),
      mobile: _HomeMobile(theme),
      desktop: _HomeDesktop(theme),
      tablet: _HomeDesktop(theme),
    );
  }
}


