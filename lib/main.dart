import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final isWebMobileIOS = kIsWeb && defaultTargetPlatform == TargetPlatform.iOS;
  final isWebMobileAndroid = kIsWeb && defaultTargetPlatform == TargetPlatform.android;

  @override
  void initState() {
    if (isWebMobileIOS) {
      launchUrl(Uri.parse('https://www.apple.com/app-store/'), webOnlyWindowName: '_self');
    } else if (isWebMobileAndroid) {
      launchUrl(Uri.parse('https://play.google.com/store/apps'), webOnlyWindowName: '_self');
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
