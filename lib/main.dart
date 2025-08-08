import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/home_screen.dart';

void main() {
  // Ensure binding is initialized (useful if you add async init later)
  WidgetsFlutterBinding.ensureInitialized();
  runApp(NeoTradeLearnApp());
}

class NeoTradeLearnApp extends StatelessWidget {
  NeoTradeLearnApp({Key? key}) : super(key: key);

  // Color constants according to your theme
  final Color background = const Color(0xFF0D1117);
  final Color cardBg = const Color(0xFF161B22);
  final Color primaryAccent = const Color(0xFF00FFA3); // neon green

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NeoTrade Learn',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: background,
        cardColor: cardBg,
        primaryColor: primaryAccent,
        textTheme: ThemeData.dark().textTheme.apply(
          bodyColor: const Color(0xFFF5F5F5),
          displayColor: const Color(0xFFF5F5F5),
        ),
        // Later we will configure fonts (Poppins, Inter, Space Mono)
      ),
      // initial route points to our in-app splash screen
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}
