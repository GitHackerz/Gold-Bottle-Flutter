import 'package:bouteille_dor/screens/main/camera_screen.dart';
import 'package:bouteille_dor/screens/main/home/home_screen.dart';
import 'package:bouteille_dor/screens/main/market/market_screen.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

List<Widget> _buildScreens() {
  return [
    const HomeScreen(),
    const MarketScreen(),
    const CameraScreen(),
    const Screen4(),
    const Screen1()
  ];
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: "Home",
        activeColorPrimary: const Color(0XFF18BF67),
        inactiveColorPrimary: const Color(0xff676767),
        iconSize: 30),
    PersistentBottomNavBarItem(
        icon: const Icon(Icons.shop_2),
        title: "Market",
        activeColorPrimary: const Color(0XFF18BF67),
        inactiveColorPrimary: const Color(0xff676767),
        iconSize: 30),
    PersistentBottomNavBarItem(
      icon: const Icon(
        Icons.camera,
        color: Colors.white,
      ),
      title: ("Camera"),
      activeColorPrimary: const Color(0XFF18BF67),
      inactiveColorPrimary: const Color(0xff676767),
      iconSize: 35,
    ),
    PersistentBottomNavBarItem(
        icon: const Icon(Icons.delete),
        title: "Bins",
        activeColorPrimary: const Color(0XFF18BF67),
        inactiveColorPrimary: const Color(0xff676767),
        iconSize: 30),
    PersistentBottomNavBarItem(
        icon: const Icon(Icons.account_circle_rounded),
        title: "Profile",
        activeColorPrimary: const Color(0XFF18BF67),
        inactiveColorPrimary: const Color(0xff676767),
        iconSize: 30),
  ];
}

final PersistentTabController _controller =
    PersistentTabController(initialIndex: 0);

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineToSafeArea: true,
      padding: const EdgeInsets.only(top: 8),
      isVisible: true,
      animationSettings: const NavBarAnimationSettings(
        navBarItemAnimation: ItemAnimationSettings(
          duration: Duration(milliseconds: 400),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimationSettings(
          animateTabTransition: true,
          duration: Duration(milliseconds: 200),
          screenTransitionAnimationType: ScreenTransitionAnimationType.fadeIn,
        ),
      ),
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardAppears: true,
      decoration: NavBarDecoration(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20),
        ),
        colorBehindNavBar: Colors.white,
        border: Border.all(width: 0.0, color: Colors.grey),
      ),
      navBarStyle: NavBarStyle.style15,
    );
  }
}

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Center(
        child: Text(
          "Home Screen",
        ),
      ),
    );
  }
}

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Center(
        child: Text(
          "Camera Screen",
        ),
      ),
    );
  }
}

class Screen4 extends StatelessWidget {
  const Screen4({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Center(
        child: Text(
          "Notifications Screen",
        ),
      ),
    );
  }
}
