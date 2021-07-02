part of home_view;

class _HomeTablet extends StatelessWidget {
   final ThemeData theme;

  _HomeTablet(this.theme);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('ProjectsTablet')),
    );
  }
}