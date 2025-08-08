import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnim;
  late final Animation<double> _fadeAnim;

  @override
  void initState() {
    super.initState();

    // Animation controller for logo pop/scale effect
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    _scaleAnim = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );

    _fadeAnim = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    // Start animation
    _controller.forward();

    // After 2.2 seconds navigate to home
    Timer(const Duration(milliseconds: 2200), () {
      // Replace the splash with home
      if (mounted) {
        Navigator.of(context).pushReplacementNamed('/home');
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Theme colors (kept inline so file is standalone)
    const background = Color(0xFF0D1117);
    const cardBg = Color(0xFF161B22);
    const neon = Color(0xFF00FFA3);
    const mutedText = Color(0xFF8B949E);

    return Scaffold(
      backgroundColor: background,
      body: Center(
        child: FadeTransition(
          opacity: _fadeAnim,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ScaleTransition(
                scale: _scaleAnim,
                child: Container(
                  // small card behind the logo to give depth
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: cardBg,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.6),
                        blurRadius: 12,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Image.asset(
                    'lib/assets/images/logo.png',
                    width: 96,
                    height: 96,
                    fit: BoxFit.contain,
                    // If the asset is missing, Flutter will throw an error — replace with a placeholder if needed.
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'NeoTrade Learn',
                style: TextStyle(
                  color: Color(0xFFF5F5F5),
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Learn candlestick & chart patterns',
                style: TextStyle(
                  color: mutedText,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 24),
              // small progress shimmer-like indicator (simple)
              SizedBox(
                width: 80,
                height: 6,
                child: LinearProgressIndicator(
                  value: null,
                  backgroundColor: Colors.white24,
                  // progress color matches neon accent
                  valueColor: AlwaysStoppedAnimation<Color>(neon),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
