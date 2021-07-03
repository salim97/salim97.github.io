library projects_view;

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hovering/hovering.dart';
import 'package:my_portfolio/theme.dart';
import 'package:my_portfolio/ui/widgets/footer.widget.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/portfolio.dart' as g;
import 'package:url_launcher/url_launcher.dart';

part 'projects_mobile.view.dart';
part 'projects_tablet.view.dart';
part 'projects_desktop.view.dart';

class ProjectsView extends StatelessWidget {
  final ThemeData theme;

  const ProjectsView({Key? key, required this.theme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      breakpoints: ScreenBreakpoints(tablet: 760, desktop: 1380, watch: 300),
      mobile: _ProjectsMobile(theme),
      desktop: _ProjectsDesktop(theme),
      // tablet: _ProjectsTablet(theme),
      tablet: _ProjectsDesktop(theme),
    );
  }
}
