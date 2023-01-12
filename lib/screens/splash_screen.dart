import 'dart:async';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:github_repos/constants/global_colors.dart';
import 'package:github_repos/screens/home_screen.dart';
import 'package:github_repos/services/navigation_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? timer;
  @override
  void initState() {
    super.initState();
    navigate();
  }

  navigate() {
    timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      NavigationService.pushReplacement(context, screen: const HomeScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: FaIcon(
          FontAwesomeIcons.github,
          size: 100,
          color: GlobalColors.textColor,
        ),
      ),
    );
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }
}
