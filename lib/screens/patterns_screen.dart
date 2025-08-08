import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'pdf_viewer_screen.dart';

class PatternsScreen extends StatefulWidget {
  const PatternsScreen({Key? key}) : super(key: key);

  @override
  State<PatternsScreen> createState() => _PatternsScreenState();
}

class _PatternsScreenState extends State<PatternsScreen> {
  // Replace with your actual GitHub repo raw URL
  final String 
  hammerPdfUrl = "https://raw.githubusercontent.com/pasi-ya/neo-trading/main/lib/assets/patterns/bullish/hammer.pdf";


  final List<Map<String, String>> bullishPatterns = [
    {"name": "Hammer", "file": "lib/assets/patterns/bearish/hammer.pdf"},
    {"name": "Morning Star", "file": "bullish/morning_star.pdf"},
  ];

  final List<Map<String, String>> bearishPatterns = [
    {"name": "Shooting Star", "file": "bearish/shooting_star.pdf"},
    {"name": "Evening Star", "file": "bearish/evening_star.pdf"},
  ];

  Future<bool> checkPdfExists(String url) async {
    final res = await http.head(Uri.parse(url));
    return res.statusCode == 200;
  }

  Widget _buildPatternList(
      String title, List<Map<String, String>> patterns, Color borderColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Text(
          title,
          style: const TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Column(
          children: patterns.map((pattern) {
            final pdfUrl = "$baseUrl/${pattern['file']}";
            return Card(
              color: const Color(0xFF161B22),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(color: borderColor),
              ),
              child: ListTile(
                title: Text(
                  pattern['name']!,
                  style: const TextStyle(color: Colors.white),
                ),
                trailing: const Icon(Icons.arrow_forward_ios,
                    color: Colors.white54, size: 16),
                onTap: () async {
                  final exists = await checkPdfExists(pdfUrl);
                  if (!exists) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("${pattern['name']} PDF not found"),
                      ),
                    );
                    return;
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PDFViewerScreen(
                        title: pattern['name']!,
                        url: pdfUrl,
                      ),
                    ),
                  );
                },
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1117),
      appBar: AppBar(
        title: const Text("Patterns"),
        backgroundColor: const Color(0xFF0D1117),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildPatternList(
                "Bullish Patterns", bullishPatterns, const Color(0xFF00D26A)),
            _buildPatternList(
                "Bearish Patterns", bearishPatterns, const Color(0xFFFF4C4C)),
          ],
        ),
      ),
    );
  }
}


class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF0D1117),
      body: Center(
        child: Text('Patterns Screen', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}

class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF0D1117),
      body: Center(
        child: Text('Patterns Screen', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}

class QuizScreen extends StatelessWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF0D1117),
      body: Center(
        child: Text('Patterns Screen', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
