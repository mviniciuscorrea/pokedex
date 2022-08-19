import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokedex/controller/routes.dart';
import 'package:pokedex/styles/style.dart';
import 'package:pokedex/view/home/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom]);

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final style = Styles();

    return MaterialApp(
      title: 'Movies App',
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      onGenerateRoute: Routes.generateRoute,
      theme: ThemeData(
          primarySwatch: style.materialColor(),
          scaffoldBackgroundColor: const Color(0xfff6f6f6),
          primaryColor: style.colorPrimary(),
          brightness: Brightness.light,
          hintColor: style.colorTextDefault(),
          fontFamily: 'Raleway',
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: Colors.yellow.shade700,
            selectionHandleColor: Colors.yellow.shade700,
          )),
      home: const Home(),
    );
  }
}
