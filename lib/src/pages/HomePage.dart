import 'package:marvel_app/config/translate/translate_config.dart';
import 'package:marvel_app/src/constants/global_constants.dart';

import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

class HomePage extends StatefulWidget {
  HomePage();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: FutureBuilder(
        future: initMenuItems(context),
        builder: (_, AsyncSnapshot<List<ScreenHiddenDrawer>> snapshot) {
          if (snapshot.hasData) {
            return HiddenDrawerMenu(
              isTitleCentered: true,
              tittleAppBar: Hero(
                tag: HERO_TAG_LOGO,
                child: Container(
                    width: 130,
                    child: Image.asset('assets/images/transparent_logo.png')),
              ),
              elevationAppBar: 0,
              leadingAppBar: Icon(Icons.menu),
              backgroundColorMenu: Theme.of(context).primaryColor,
              backgroundColorContent: Theme.of(context).backgroundColor,
              backgroundColorAppBar: Theme.of(context).backgroundColor,
              screens: snapshot.data,
              contentCornerRadius: 40.0,
              verticalScalePercent: 80.0,
              slidePercent: 50.0,
            );
          }
          return Container();
        },
      ),
    );
  }

  Future<List<ScreenHiddenDrawer>> initMenuItems(BuildContext context) async {
    MarvelLocalizations localizations = MarvelLocalizations.of(context);
    List<ScreenHiddenDrawer> result = [];
    menuItems.forEach((element) => result.add(new ScreenHiddenDrawer(
        new ItemHiddenMenu(
            name: localizations.t(element['label']),
            baseStyle: Theme.of(context).textTheme.bodyText1),
        element['screen'])));

    return result;
  }
}
