// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import '../widgets/pattern_card.dart';
import 'patterns_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const _HomeContent(),
    const PatternsScreen(),
    const QuizScreen(),
    const FavoritesScreen(),
    const MoreScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final neon = const Color(0xFF00FFA3);
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF161B22),
        selectedItemColor: neon,
        unselectedItemColor: Colors.white54,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.show_chart), label: 'Patterns'),
          BottomNavigationBarItem(icon: Icon(Icons.quiz), label: 'Quiz'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'More'),
        ],
      ),
    );
  }
}

class _HomeContent extends StatelessWidget {
  const _HomeContent();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1117),
      appBar: AppBar(
        title: const Text('NeoTrade Learn'),
        backgroundColor: const Color(0xFF0D1117),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _sectionTitle('Popular Bullish Patterns'),
            const SizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: const [
                  PatternCard(
                    title: 'Hammer',
                    description: 'Bullish reversal after downtrend',
                    imagePath: 'lib/assets/images/hammer.png',
                    borderColor: Color(0xFF00D26A),
                  ),
                  PatternCard(
                    title: 'Morning Star',
                    description: 'Strong bullish reversal signal',
                    imagePath: 'lib/assets/images/hammer.png',
                    borderColor: Color(0xFF00D26A),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _sectionTitle('Popular Bearish Patterns'),
            const SizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: const [
                  PatternCard(
                    title: 'Shooting Star',
                    description: 'Bearish reversal after uptrend',
                    imagePath: 'lib/assets/images/hammer.png',
                    borderColor: Color(0xFFFF4C4C),
                  ),
                  PatternCard(
                    title: 'Evening Star',
                    description: 'Signals bearish reversal and things',
                    imagePath: 'lib/assets/images/hammer.png',
                    borderColor: Color(0xFFFF4C4C),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
