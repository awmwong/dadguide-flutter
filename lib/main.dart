import 'package:dadguide2/screens/home/root_screen.dart';
import 'package:dadguide2/screens/settings/settings_manager.dart';
import 'package:dadguide2/theme/theme.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fimber/flutter_fimber.dart';
import 'package:provider/provider.dart';

void main() async {
  // Dont report errors from dev mode to crashlytics.
  Crashlytics.instance.enableInDevMode = false;

  // Pass all uncaught errors to Crashlytics.
  FlutterError.onError = (FlutterErrorDetails details) {
    Crashlytics.instance.onError(details);
  };

  // Set up logging.
  Fimber.plantTree(FimberTree());

  await preferenceInit();
  runApp(DadGuideApp());
}

class DadGuideApp extends StatelessWidget {
  static FirebaseAnalytics analytics = FirebaseAnalytics();
  static FirebaseAnalyticsObserver observer = FirebaseAnalyticsObserver(analytics: analytics);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<FirebaseAnalytics>.value(value: analytics),
        Provider<FirebaseAnalyticsObserver>.value(value: observer),
      ],
      child: MaterialApp(
        title: 'DadGuide',
        theme: appTheme(),
        navigatorObservers: [observer],
//      initialRoute: '/',
//      routes: <String, WidgetBuilder>{
//        "/": (BuildContext context) => HomeScreen(),
////        "/ExScreen2": (BuildContext context) => ExScreen2(),
//      },
//    ),
        home: StatefulHomeScreen(),
      ),
    );
  }
}
