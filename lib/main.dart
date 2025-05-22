import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:task2/home_page.dart';
void main() {
  runApp(const PasswordGenerator());
}

class PasswordGenerator extends StatefulWidget {

  const PasswordGenerator({super.key});

  @override
  State<PasswordGenerator> createState() => _PasswordGeneratorState();
}

class _PasswordGeneratorState extends State<PasswordGenerator> {
  bool isDarkMode=false;

  @override
  Widget build(BuildContext context) {
    return NeumorphicApp(
      debugShowCheckedModeBanner: false,
      title: 'Neumorphic App',

      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light, // Can be light, dark, or system
      theme: const NeumorphicThemeData(
        baseColor: Colors.white,
        lightSource: LightSource.topLeft,
        depth: 4,
      ),
      darkTheme: const NeumorphicThemeData(
        baseColor: Colors.yellow,
        lightSource: LightSource.topLeft,
        depth: 4,
      ),
      home: HomePage(
        isDarkMode: isDarkMode,
        onThemeToggle: () {
          setState(() {
            isDarkMode = !isDarkMode;
          });
        },
      ),
    );
  }
}
