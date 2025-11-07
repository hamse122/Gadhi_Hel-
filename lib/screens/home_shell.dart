import 'package:flutter/material.dart';
import '../models/app_screen.dart';
import '../widgets/bottom_nav.dart';
import 'welcome_screen.dart';
import 'discover_screen.dart';
import 'login_screen.dart';
import 'register_screen.dart';

class HomeShell extends StatefulWidget {
  const HomeShell({super.key});

  @override
  State<HomeShell> createState() => _HomeShellState();
}


class _HomeShellState extends State<HomeShell> {
  AppScreen current = AppScreen.welcome;
  int navIndex = 0;

  void showScreen(AppScreen screen) {
    setState(() {
      current = screen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 430),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                child: _buildScreen(context),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: (current == AppScreen.welcome || 
                            current == AppScreen.login || 
                            current == AppScreen.discover || 
                            current == AppScreen.register)
          ? const SizedBox.shrink()
          : BottomNav(
              currentIndex: navIndex,
              onTap: (i) => setState(() => navIndex = i),
            ),
    );
  }

  Widget _buildScreen(BuildContext context) {
    switch (current) {
      case AppScreen.welcome:
        return WelcomeScreen(onGetStarted: () => showScreen(AppScreen.discover));
      case AppScreen.discover:
        return DiscoverScreen(
          onLogin: () => showScreen(AppScreen.login),
          onRegister: () => showScreen(AppScreen.register),
        );
      case AppScreen.login:
        return LoginScreen(
          onToRegister: () => showScreen(AppScreen.register),
        );
      case AppScreen.register:
        return RegisterScreen(
          onToLogin: () => showScreen(AppScreen.login),
        );
    }
  }
}

