import 'package:flutter/material.dart';
import 'screen_blank.dart';
import 'package:intl/intl.dart';
import 'generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // removes the debug banner that hides the home button
      title: 'ACS',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue), // deepPurple
        useMaterial3: true,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 20), // size of hello
        ),
        // see https://docs.flutter.dev/cookbook/design/themes
      ), // ✅ DEBUG condicional (mejor performance)

      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      supportedLocales: S.delegate.supportedLocales,

      home: const ScreenBlank(),

    );
  }
}
