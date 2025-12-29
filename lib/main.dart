import 'package:flutter/material.dart';
import 'package:islami_app/config/theme/theme_manager.dart';
import 'package:islami_app/core/resources/prefs_manger/prefs-manager.dart';
import 'package:islami_app/core/routes_manager/routes_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // بيتاكد ان الحاجة دى اتعملها initialize قبل ما يعمل run لل app
  await PrefsManager.init();// هى دى الحاجة
  runApp(const IslamiApp());
}

class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeManager.light,
      darkTheme: ThemeManager.dark,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      routes: RoutesManager.routes,
      initialRoute: RoutesManager.splash,
    );
  }
}
