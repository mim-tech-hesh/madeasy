import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MadeasyHotlineScreen extends StatelessWidget {
  final List<Map<String, String>> hotlines = [
    {'name': 'Support', 'number': '09612345678'},
    {'name': 'Doctor', 'number': '01711223344'},
    {'name': 'Emergency', 'number': '01880000000'},
    {'name': 'Lab', 'number': '01555555555'},
    {'name': 'Appointment', 'number': '01300001111'},
  ];

  Future<void> _callNumber(String number) async {
    final Uri url = Uri(scheme: 'tel', path: number);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      debugPrint('❌ Could not launch $number');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Madeasy Hotline'),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              'https://i.postimg.cc/NFZM5p31/top-view-blue-monday-concept-composition-with-telephone.jpg',
              fit: BoxFit.cover,
              color: Colors.black.withOpacity(0.3),
              colorBlendMode: BlendMode.darken,
            ),
          ),
          ListView.builder(
            itemCount: hotlines.length,
            itemBuilder: (context, index) {
              final hotline = hotlines[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                elevation: 4,
                color: Colors.white.withOpacity(0.85),
                child: ListTile(
                  leading: const Icon(Icons.support_agent, color: Colors.teal),
                  title: Text(hotline['name']!),
                  subtitle: Text(hotline['number']!),
                  trailing: const Icon(Icons.call, color: Colors.teal),
                  onTap: () => _callNumber(hotline['number']!),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MadeasyHotlineScreen(),
    );
  }
}
