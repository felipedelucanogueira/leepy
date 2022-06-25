import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:leepy/values/strings.dart';
import 'package:window_size/window_size.dart';

import 'features/home/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  //disable fullscreen

  runApp(const InitialRoute());

  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowTitle('Flutter Demo');
    setWindowTitle(Strings.leepy);
    setWindowMinSize(const Size(400, 400));
    setWindowMaxSize(const Size(400, 400));
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
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
