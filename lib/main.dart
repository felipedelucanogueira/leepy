import 'dart:io';

import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:leepy/values/strings.dart';

import 'features/home/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const InitialRoute());

  if (Platform.isMacOS || Platform.isLinux || Platform.isWindows) {
    DesktopWindow.setMaxWindowSize(const Size(400, 400));
    DesktopWindow.setMinWindowSize(const Size(400, 400));
    DesktopWindow.setWindowSize(const Size(400, 400));
  }
}

class InitialRoute extends StatelessWidget {
  const InitialRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.leepy,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.fredokaOneTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => const HomeScreen(),
      },
    );
  }
}
