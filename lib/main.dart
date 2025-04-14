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
      title: 'AI Doctor Match',
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
        centerTitle: true,
        backgroundColor: Colors.teal,
        elevation: 4,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: doctors.length,
          itemBuilder: (context, index) {
            final doctor = doctors[index];
            return Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.teal,
                      child: Icon(Icons.person, color: Colors.white, size: 30),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            doctor['name'] ?? '',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'Specialization: ${doctor['specialization']}',
                            style: const TextStyle(color: Colors.black54),
                          ),
                          Text(
                            'Experience: ${doctor['experience']}',
                            style: const TextStyle(color: Colors.black54),
                          ),
                          Text(
                            'Hospital: ${doctor['hospital']}',
                            style: const TextStyle(color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
