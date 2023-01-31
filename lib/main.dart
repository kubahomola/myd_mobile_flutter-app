import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'pages/home_page.dart';

void main() async {
//initialize hive
  await Hive.initFlutter();
  //open a box
  var box = await Hive.openBox('mybox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: const ColorScheme(
            primary: Color.fromARGB(45, 217, 217, 217),
            onPrimary: Colors.white,
            secondary: Color.fromARGB(255, 44, 48, 55),
            onSecondary: Colors.white,
            tertiary: Color.fromARGB(255, 87, 153, 153),
            error: Colors.red,
            onError: Colors.black,
            background: Color.fromARGB(255, 44, 48, 55),
            onBackground: Colors.white,
            surface: Color.fromARGB(255, 44, 48, 55),
            onSurface: Colors.white,
            brightness: Brightness.dark,
          ),
          dialogTheme: const DialogTheme(elevation: 0),
          scaffoldBackgroundColor: const Color.fromARGB(255, 44, 48, 55),
          textTheme: const TextTheme(
            bodyText2: TextStyle(
              color: Colors.white,
            ),
          ),
          iconTheme: const IconThemeData(color: Colors.white)),
    );
  }
}
