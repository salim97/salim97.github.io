library education_view;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hovering/hovering.dart';
import 'package:my_portfolio/portfolio.dart' as g;
import 'package:my_portfolio/theme.dart';
import 'package:my_portfolio/ui/widgets/footer.widget.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:url_launcher/url_launcher.dart';

part 'education_mobile.view.dart';
part 'education_tablet.view.dart';
part 'education_desktop.view.dart';

class EducationView extends StatelessWidget {
  final ThemeData theme;

  const EducationView({Key? key, required this.theme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      breakpoints: ScreenBreakpoints(tablet: 760, desktop: 1380, watch: 300),
      desktop: _EducationDesktop(theme),
      tablet: _EducationTablet(theme),
      mobile: _EducationMobile(theme),
    );
  }
}
