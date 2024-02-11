import 'package:discipline/ui/home.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class NavbarWidget extends StatelessWidget {
  const NavbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      tabs: [
        PersistentTabConfig(
          screen: const HomeWidget(),
          item: ItemConfig(
            icon: const Icon(FluentIcons.home_24_filled),
            inactiveIcon: const Icon(FluentIcons.home_24_regular),
            inactiveColorPrimary: Colors.white70,
            activeColorPrimary: Colors.white,
          ),
        ),
        PersistentTabConfig(
          screen: const Placeholder(),
          item: ItemConfig(
            icon: const Icon(FluentIcons.trophy_24_filled),
            inactiveIcon: const Icon(FluentIcons.trophy_24_regular),
            inactiveColorPrimary: Colors.white70,
            activeColorPrimary: Colors.white,
          ),
        ),
        PersistentTabConfig(
          screen: const Placeholder(),
          item: ItemConfig(
            icon: const Icon(FluentIcons.people_24_filled),
            inactiveIcon: const Icon(FluentIcons.people_24_regular),
            inactiveColorPrimary: Colors.white70,
            activeColorPrimary: Colors.white,
          ),
        ),
        PersistentTabConfig(
          screen: const Placeholder(),
          item: ItemConfig(
            icon: const Icon(FluentIcons.settings_24_filled),
            inactiveIcon: const Icon(FluentIcons.settings_24_regular),
            inactiveColorPrimary: Colors.white70,
            activeColorPrimary: Colors.white,
          ),
        ),
      ],
      navBarBuilder: (navBarConfig) => NeumorphicBottomNavBar(
        navBarConfig: navBarConfig,
        navBarDecoration: const NavBarDecoration(
          color: Color(0xFF272B34),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          padding: EdgeInsets.zero,
        ),
        neumorphicProperties: const NeumorphicProperties(
          bevel: 1,
          decoration: NeumorphicDecoration(
            color: Color(0xFF272B34),
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
