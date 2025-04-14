import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Doctor Matching',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: AIDoctorMatchingPage(),
    );
  }
}

class AIDoctorMatchingPage extends StatelessWidget {
  final List<Map<String, String>> doctors = [
    {
      'name': 'Dr. Shahriar',
      'specialization': 'AI Diagnostics Specialist',
      'experience': '10 years',
      'hospital': 'FutureCare Hospital',
    },
    {
      'name': 'Dr. Ahmed',
      'specialization': 'Neural Network Analyst',
      'experience': '8 years',
      'hospital': 'SmartHealth Institute',
    },
    {
      'name': 'Dr. Shovo',
      'specialization': 'Predictive Health Expert',
      'experience': '12 years',
      'hospital': 'NextGen Clinic',
    },
    {
      'name': 'Dr. Siam',
      'specialization': 'AI Diagnostics Specialist',
      'experience': '10 years',
      'hospital': 'FutureCare Hospital',
    },
    {
      'name': 'Dr. Mim',
      'specialization': 'Neural Network Analyst',
      'experience': '8 years',
      'hospital': 'SmartHealth Institute',
    },
    {
      'name': 'Dr. Abir',
      'specialization': 'Predictive Health Expert',
      'experience': '12 years',
      'hospital': 'NextGen Clinic',
    },
    {
      'name': 'Dr. Rabbi',
      'specialization': 'AI Diagnostics Specialist',
      'experience': '10 years',
      'hospital': 'FutureCare Hospital',
    },
    {
      'name': 'Dr. Raj Patel',
      'specialization': 'Neural Network Analyst',
      'experience': '8 years',
      'hospital': 'SmartHealth Institute',
    },
    {
      'name': 'Dr. Kajol',
      'specialization': 'Predictive Health Expert',
      'experience': '12 years',
      'hospital': 'NextGen Clinic',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Doctor's List"),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: doctors.length,
        itemBuilder: (context, index) {
          final doctor = doctors[index];
          return Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: const Icon(Icons.person, size: 40, color: Colors.teal),
              title: Text(
                doctor['name'] ?? '',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Specialization: ${doctor['specialization']}'),
                  Text('Experience: ${doctor['experience']}'),
                  Text('Hospital: ${doctor['hospital']}'),
                ],
              ),
              isThreeLine: true,
            ),
          );
        },
      ),
    );
  }
}
