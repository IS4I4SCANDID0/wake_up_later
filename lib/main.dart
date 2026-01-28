import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
import 'views/home_page.dart';

void main() {
  runApp(const WakeUpLaterApp());
}

// Classe externa, invólocro (Widget de nível superior)
class WakeUpLaterApp extends StatefulWidget {
  const WakeUpLaterApp({super.key});

  @override
  State<WakeUpLaterApp> createState() => _WakeUpLaterAppState();
}

class _WakeUpLaterAppState extends State<WakeUpLaterApp> {
  // Definição do modo de tema padrão como sistema
  ThemeMode _themeMode = ThemeMode.system;

  void _toggleTheme(ThemeMode mode) {
    setState(() {
      // O setState avisa o Flutter para reconstruir a interface com o novo tema
      _themeMode = mode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wake Up Later',
      themeMode: _themeMode,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.lightBlue,
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFF3399FF),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: const Color(0xFF02003F),
      ),
      home: AlarmHomePage(onThemeChanged: _toggleTheme),
    );
  }
}
