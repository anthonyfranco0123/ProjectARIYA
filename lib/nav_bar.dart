import 'package:object_detection/screens.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import 'bubble_bottom_bar.dart';
import 'database_lookup.dart';
import 'home.dart';
import 'object_detection.dart';
import 'settings.dart';
import 'voice_assistant.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  NavBarState createState() => NavBarState();
}

class NavBarState extends State<NavBar> {
  late PersistentTabController _controller;
  late bool _hideNavBar;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
    _hideNavBar = false;
  }

  List<Widget> _buildScreens() {
    return [
      MainScreen(
        hideStatus: _hideNavBar,
        onScreenHideButtonPressed: () {
          setState(() {
            _hideNavBar = !_hideNavBar;
          });
        },
      ),
      ObjectDetectionWidget(
        hideStatus: _hideNavBar,
        onScreenHideButtonPressed: () {
          setState(() {
            _hideNavBar = !_hideNavBar;
          });
        },
      ),
      MainScreen(
        hideStatus: _hideNavBar,
        onScreenHideButtonPressed: () {
          setState(() {
            _hideNavBar = !_hideNavBar;
          });
        },
      ),
      MainScreen(
        hideStatus: _hideNavBar,
        onScreenHideButtonPressed: () {
          setState(() {
            _hideNavBar = !_hideNavBar;
          });
        },
      ),
      MainScreen(
        hideStatus: _hideNavBar,
        onScreenHideButtonPressed: () {
          setState(() {
            _hideNavBar = !_hideNavBar;
          });
        },
      ),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    final sh = MediaQuery.of(context).size.height;
    final sw = MediaQuery.of(context).size.width;
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: "Home",
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
        inactiveColorSecondary: Colors.purple,
      ),
      PersistentBottomNavBarItem(
        icon: Container(
            alignment: Alignment.centerLeft,
            height: sh * 0.05,
            width: sw * 0.05,
            child: SvgPicture.asset(
                'assets/svgviewer-output.svg')), // const Icon(Icons.search),
        title: "Detection",
        activeColorPrimary: Colors.green,
        inactiveColorPrimary: Colors.grey,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: '/',
          routes: {
            '/first': (context) => const MainScreen2(),
            '/second': (context) => const MainScreen3(),
          },
        ),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.add),
        title: "Folder",
        activeColorPrimary: Colors.teal,
        inactiveColorPrimary: Colors.grey,
        // onPressed: (context) {
        //   setState(() {
        //     _hideNavBar = !_hideNavBar;
        //   });
        // },
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: '/',
          routes: {
            '/first': (context) => const MainScreen2(),
            '/second': (context) => const MainScreen3(),
          },
        ),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.message),
        title: "Messages",
        activeColorPrimary: Colors.deepOrange,
        inactiveColorPrimary: Colors.grey,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: '/',
          routes: {
            '/first': (context) => const MainScreen2(),
            '/second': (context) => const MainScreen3(),
          },
        ),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.settings),
        title: "Settings",
        activeColorPrimary: Colors.indigo,
        inactiveColorPrimary: Colors.grey,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: '/',
          routes: {
            '/first': (context) => const MainScreen2(),
            '/second': (context) => const MainScreen3(),
          },
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final sh = MediaQuery.of(context).size.height;
    final sw = MediaQuery.of(context).size.width;

    Icon hideIcon = const Icon(Icons.warning_rounded);
    Text hideText = const Text('');

    _hideNavBar == true
        ? hideIcon = const Icon(Icons.keyboard_arrow_up_rounded)
        : hideIcon = const Icon(Icons.keyboard_arrow_down_rounded);
    _hideNavBar == false
        ? hideText = const Text('Hide')
        : hideText = const Text('Unhide');

    return Scaffold(
      body: Stack(children: <Widget>[
        GestureDetector(
          onHorizontalDragEnd: (DragEndDetails details) {
            if (details.primaryVelocity! < 0 &&
                _controller.index != _navBarsItems().length - 1) {
              _controller.index++;
            } else if (details.primaryVelocity! > 0 && _controller.index != 0) {
              _controller.index--;
            }
          },
          child: PersistentTabView(
            context,
            controller: _controller,
            screens: _buildScreens(),
            items: _navBarsItems(),
            confineInSafeArea: true,
            backgroundColor: Colors.white,
            handleAndroidBackButtonPress: true,
            resizeToAvoidBottomInset: true,
            stateManagement: true,
            navBarHeight: kBottomNavigationBarHeight,
            hideNavigationBarWhenKeyboardShows: true,
            margin: const EdgeInsets.all(10),
            popActionScreens: PopActionScreensType.all,
            bottomScreenMargin: 0.0,
            onWillPop: (context) async {
              await showDialog(
                context: context!,
                useSafeArea: true,
                builder: (context) => Container(
                  height: 50.0,
                  width: 50.0,
                  color: Colors.white,
                  child: ElevatedButton(
                    child: const Text("Close"),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              );
              return false;
            },
            hideNavigationBar: _hideNavBar,
            decoration: NavBarDecoration(
                colorBehindNavBar: Colors.indigo,
                borderRadius: BorderRadius.circular(20.0)),
            popAllScreensOnTapOfSelectedTab: true,
            itemAnimationProperties: const ItemAnimationProperties(
              duration: Duration(milliseconds: 400),
              // curve: Curves.ease,
              curve: Curves.fastOutSlowIn,
            ),
            screenTransitionAnimation: const ScreenTransitionAnimation(
              animateTabTransition: true,
              // curve: Curves.ease,
              curve: Curves.fastOutSlowIn,
              duration: Duration(milliseconds: 200),
            ),
            navBarStyle: NavBarStyle.style9,
            // NavBarStyle.style17, // Choose the nav bar style with this property
          ),
        ),
        Align(
            alignment: const Alignment(0.98, 1.0748),
            child: SizedBox(
              height: sh * .1,
              width: sw * .1,
              child: FittedBox(
                child: FloatingActionButton.extended(
                  onPressed: () {
                    setState(() {
                      _hideNavBar = !_hideNavBar;
                      _hideNavBar == true
                          ? hideIcon =
                              const Icon(Icons.keyboard_arrow_up_rounded)
                          : hideIcon =
                              const Icon(Icons.keyboard_arrow_down_rounded);
                      _hideNavBar == false
                          ? hideIcon =
                              const Icon(Icons.keyboard_arrow_down_rounded)
                          : hideText = const Text('Hide');
                    });
                  },
                  label: hideText,
                  icon: hideIcon,
                ),
              ),
            ))
      ]),
    );
  }
}
