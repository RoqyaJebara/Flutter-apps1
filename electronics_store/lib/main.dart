import 'package:electronics_store/constants.dart';
import 'package:electronics_store/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Electrical Store",
      theme: ThemeData(
        textTheme: GoogleFonts.lugrasimoTextTheme(
          Theme.of(context).textTheme,
        ),
        primaryColor: kPrimaryColor,
        // accentColor:kSecondaryColor,
        // colorScheme: ColorScheme(primary: kPrimaryColor,secondary: kSecondaryColor);
        colorScheme:
            Theme.of(context).colorScheme.copyWith(secondary: kSecondaryColor),
      ),
      // localizationsDelegates: [
      //   GlobalCupertinoLocalizations.delegate,
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      // ],
      // supportedLocales: [Locale("ar", "AE")],
      // locale: Locale("ar", "AE"),
      home: const Scaffold(
        body: Center(
          child: HomeScreen(),
        ),
      ),
    );
  }
}
