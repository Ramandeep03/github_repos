import 'package:flutter/material.dart';
import 'package:github_repos/constants/global_theme.dart';
import 'package:github_repos/providers/public_repo_provider.dart';
import 'package:github_repos/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_)=> PublicRepoProvider(),)
    ],
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Github',
      theme: GlobalTheme.githubTheme,
      home: const SplashScreen(),
    );
  }
}
