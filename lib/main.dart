import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Madeasy',
      theme: ThemeData(
        primaryColor: Color(0xFF008080),
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Roboto',
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF008080),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: EdgeInsets.symmetric(vertical: 14, horizontal: 30),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey[100],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          labelStyle: TextStyle(color: Colors.teal[800]),
        ),
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _login(BuildContext context) {
    String username = usernameController.text.trim();
    String password = passwordController.text;

    if (username == 'mim' && password == 'siam') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Invalid username or password')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.local_hospital, size: 80, color: Colors.teal),
              SizedBox(height: 20),
              Text(
                'Welcome to Madeasy',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal[800],
                ),
              ),
              SizedBox(height: 30),
              TextField(
                controller: usernameController,
                decoration: InputDecoration(labelText: 'Username'),
              ),
              SizedBox(height: 15),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Password'),
              ),
              SizedBox(height: 25),
              ElevatedButton(
                onPressed: () => _login(context),
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> options = [
    {
      'label': 'Urgent Appointment',
      'icon': Icons.access_alarm,
      'page': UrgentAppointmentPage(),
    },
    {
      'label': 'Doctor Details',
      'icon': Icons.person,
      'page': DoctorDetailsPage(),
    },
    {
      'label': 'Sample Collection',
      'icon': Icons.collections,
      'page': SampleCollectionPage(),
    },
    {
      'label': 'Foreign Doctor Consultation',
      'icon': Icons.language,
      'page': ForeignDoctorPage(),
    },
    {
      'label': 'Health Care Plans',
      'icon': Icons.favorite,
      'page': HealthCarePlansPage(),
    },
    {
      'label': 'Subscription',
      'icon': Icons.subscriptions,
      'page': SubscriptionPage(),
    },
    {
      'label': 'Notifications',
      'icon': Icons.notifications,
      'page': NotificationPage(),
    },
    {'label': 'Hotline', 'icon': Icons.phone, 'page': HotlinePage()},
    {
      'label': 'Symptom Checker',
      'icon': Icons.health_and_safety,
      'page': SymptomCheckerPage(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Madeasy Services'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 0.9,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          children:
              options.map((option) {
                return Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  color: Colors.teal[50],
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => option['page']),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            option['icon'],
                            size: 40,
                            color: Colors.teal[700],
                          ),
                          SizedBox(height: 12),
                          Text(
                            option['label'],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.teal[900],
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
        ),
      ),
    );
  }
}

// Urgent Appointment, Doctor Details, etc. pages remain unchanged

class UrgentAppointmentPage extends StatefulWidget {
  @override
  _UrgentAppointmentPageState createState() => _UrgentAppointmentPageState();
}

class _UrgentAppointmentPageState extends State<UrgentAppointmentPage> {
  List<Map<String, String>> availableDoctors = [
    {'name': 'Dr. Ahsan', 'time': 'Within 1 hour'},
    {'name': 'Dr. Mahiya', 'time': 'Within 2 hours'},
  ];

  String selectedDoctor = '';
  bool appointmentBooked = false;
  bool ambulanceRequested = false;
  String queueStatus = '5 patients ahead of you';

  void bookAppointment(String doctor) {
    setState(() {
      selectedDoctor = doctor;
      appointmentBooked = true;
    });
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Appointment booked with $doctor')));
  }

  void requestAmbulance() async {
    final Uri phoneUri = Uri(scheme: 'tel', path: '999');
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Could not launch phone')));
    }
  }

  void sendConfirmation() {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Confirmation sent via SMS/Email')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Urgent Appointments'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              '🩺 Available Doctors (1-2 hours):',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            ...availableDoctors.map((doc) {
              return ListTile(
                leading: Icon(Icons.person),
                title: Text(doc['name']!),
                subtitle: Text(doc['time']!),
                trailing: ElevatedButton(
                  onPressed: () => bookAppointment(doc['name']!),
                  child: Text('Book'),
                ),
              );
            }).toList(),
            Divider(),
            ListTile(
              leading: Icon(Icons.local_hospital),
              title: Text('🚨 Book Emergency Slot'),
              trailing: ElevatedButton(
                onPressed: selectedDoctor.isNotEmpty ? sendConfirmation : null,
                child: Text('Confirm'),
              ),
            ),
            ListTile(
              leading: Icon(Icons.local_shipping),
              title: Text('🚑 Request Ambulance'),
              trailing: ElevatedButton(
                onPressed: requestAmbulance,
                child: Text('Call Now'),
              ),
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('📨 SMS/Email Confirmation'),
              trailing: ElevatedButton(
                onPressed: sendConfirmation,
                child: Text('Send'),
              ),
            ),
            ListTile(
              leading: Icon(Icons.list_alt),
              title: Text('📊 Live Queue Status'),
              subtitle: Text(queueStatus),
            ),
          ],
        ),
      ),
    );
  }
}

// === Other Pages ===

Widget subFeatureList(String title, List<String> features) {
  return Scaffold(
    appBar: AppBar(title: Text(title), backgroundColor: Colors.teal),
    body: ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: features.length,
      itemBuilder:
          (context, index) => ListTile(
            leading: Icon(Icons.check_circle_outline, color: Colors.teal),
            title: Text(features[index]),
          ),
    ),
  );
}

class DoctorDetailsPage extends StatelessWidget {
  final features = [
    "Doctor's Name, Specialization",
    'Experience (years)',
    'Patient ratings & reviews',
    'Available time slots',
    'Languages spoken',
    'Consultation fee',
    'Hospital/Clinic address',
  ];

  @override
  Widget build(BuildContext context) =>
      subFeatureList('Doctor Details', features);
}

class SampleCollectionPage extends StatelessWidget {
  final features = [
    'Select Test (Blood, Urine, COVID, etc.)',
    'Choose collection time',
    'Home address input',
    'Payment gateway',
    'Live tracking of lab person',
    'Report delivery status',
  ];

  @override
  Widget build(BuildContext context) =>
      subFeatureList('Sample Collection', features);
}

class ForeignDoctorPage extends StatelessWidget {
  final features = [
    'Country-wise filter (USA, UK, India, etc.)',
    'Language preference',
    'Availability for video consultation',
    'Price comparison',
    'Certification and credentials',
    'Translator (optional)',
  ];

  @override
  Widget build(BuildContext context) =>
      subFeatureList('Foreign Doctor Consultation', features);
}

class HealthCarePlansPage extends StatelessWidget {
  final features = [
    'Monthly/Yearly plans',
    'Includes doctor visit, tests, discounts',
    'Compare plans',
    'Family plan options',
    'Renewal reminders',
    'Member benefits',
  ];

  @override
  Widget build(BuildContext context) =>
      subFeatureList('Health Care Plans', features);
}

class SubscriptionPage extends StatelessWidget {
  final features = [
    'What’s included in premium',
    'Monthly / yearly options',
    'Auto-renew toggle',
    'Trial period',
    'Secure payment integration',
  ];

  @override
  Widget build(BuildContext context) =>
      subFeatureList('Subscription', features);
}

class NotificationPage extends StatelessWidget {
  final features = [
    'Appointment reminders',
    'Test report ready',
    'Health tips',
    'New doctor available',
    'Subscription expiry warning',
    'Emergency health alerts (e.g., Dengue outbreak)',
  ];

  @override
  Widget build(BuildContext context) =>
      subFeatureList('Notifications', features);
}

class HotlinePage extends StatelessWidget {
  final features = [
    '24/7 live chat or call',
    'Different departments (Doctor support, Lab, Tech issue)',
    'Emergency call button',
    'Support ticket history',
    'Language support',
  ];

  @override
  Widget build(BuildContext context) => subFeatureList('Hotline', features);
}

class SymptomCheckerPage extends StatelessWidget {
  final features = [
    'Input symptoms (fever, cough, etc.)',
    'Get possible conditions',
    'Suggest doctor type to consult',
    'Risk level indicator (Low/Moderate/High)',
    'Immediate advice (rest, water, consult now)',
  ];

  @override
  Widget build(BuildContext context) =>
      subFeatureList('Symptom Checker', features);
}
