import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'dart:math';
import 'package:myvillagevoice/widgets/custom_main_button.dart';
import 'complaint_form.dart';
import 'complaint_list.dart';


void main() => runApp(MyVillageVoiceApp());

class MyVillageVoiceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Village Voice',
      theme: ThemeData(primarySwatch: Colors.green),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ConfettiController _confettiController;
  bool showDetails = false;

  @override
  void initState() {
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 2));
    super.initState();
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  void showHello() {
    if (!showDetails) _confettiController.play();
    setState(() {
      showDetails = !showDetails;
    });
  }

  void getStarted(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AuthChoicePage()),
    );
  }

  void showSurvey(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SurveyPage()),
    );
  }

  void showAbout(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AboutPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Village Voice')),
      body: Stack(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: showHello,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple, // 🔵 Change this to any color
                      foregroundColor: Colors.white, // ✅ Text color
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(showDetails ? 'Hide Details' : '👋 Hello Everyone'),
                  ),

                  if (showDetails) ...[
                    SizedBox(height: 20),
                    Text("Name: Harika"),
                    Text("Branch: CSM"),
                    Text("Roll No: 22BQ1A4235"),
                    Text("College: VVITU"),
                  ],
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () => getStarted(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text('🚀 Get Started'),
                  ),

                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => showSurvey(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text('🖼️ Survey'),
                  ),

                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => showAbout(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text('📖 About App'),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: _confettiController,
              blastDirection: pi / 2,
              emissionFrequency: 0.05,
              numberOfParticles: 20,
              maxBlastForce: 8,
              minBlastForce: 3,
              gravity: 0.2,
              particleDrag: 0.05,
              shouldLoop: false,
              colors: [
                Colors.pinkAccent,
                Colors.orange,
                Colors.lightBlueAccent,
                Colors.purple,
                Colors.yellow,
              ],
              // Define a slim rectangle to reduce thickness
              createParticlePath: (size) {
                final path = Path();
                // Width = 2, Height = 6 → slim and tall
                path.addRect(Rect.fromLTWH(0, 0, 5, 8));
                return path;
              },
            ),
          ),


        ],
      ),
    );
  }
}

// ------------------------ Auth Page ------------------------
class AuthChoicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Welcome")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Choose an Option", style: TextStyle(fontSize: 20)),
            SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
                child: Text("🔐 Sign In", style: TextStyle(fontSize: 16)),
                onPressed: () {
                Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserInfoPage(mode: 'signin'),
              ),
            );},
    ),
            SizedBox(height: 20), // spacing added
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text("📝 Sign Up", style: TextStyle(fontSize: 16)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserInfoPage(mode: 'signup'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// ------------------------ Survey Page ------------------------
class SurveyPage extends StatelessWidget {
  final List<String> imagePaths = [
    'assets/village1.jpg',
    'assets/village2.jpg',
    'assets/village3.jpg',
    'assets/village4.jpg',
    'assets/village5.jpg',
    'assets/village6.jpg',
    'assets/village7.jpg',
    'assets/village8.jpg',
    'assets/village9.jpg',
    'assets/village10.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Survey Photos")),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        itemCount: imagePaths.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // shows 3 images per row
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.8,
        ),
        itemBuilder: (ctx, index) => ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            imagePaths[index],
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
      ),
    );
  }
}

// ------------------------ About Page ------------------------
class AboutPage extends StatelessWidget {
  final String aboutText = '''
My Village Voice is a Flutter-based mobile app that enables villagers to report civic issues using voice messages, images, and location tagging. It supports Telugu and English, and uses Firebase for OTP login, Firestore for data storage, and Firebase Storage for media. The app simplifies issue reporting, especially for non-tech-savvy users, and ensures faster grievance redressal.
''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("About App")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Text(
          aboutText,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}

// ------------------------ User Info Page ------------------------
class UserInfoPage extends StatefulWidget {
  final String mode; // 'signin' or 'signup'

  UserInfoPage({required this.mode});

  @override
  _UserInfoPageState createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String village = '';
  String phone = '';
  String selectedLanguage = 'English';
  final List<String> languages = ['English', 'Telugu', 'Hindi'];

  void showOtpDialog() {
    final otpController = TextEditingController();
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text("Enter OTP"),
        content: TextField(
          controller: otpController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(hintText: "Enter 4-digit OTP"),
        ),
        actions: [
          TextButton(
            onPressed: () {
              if (otpController.text == '1234') {
                Navigator.of(ctx).pop();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeAppPage(
                      name: name,
                      village: village,
                      phone: phone,
                      language: selectedLanguage,
                    ),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Invalid OTP")),
                );
              }
            },
            child: Text("Verify"),
          ),
        ],
      ),
    );
  }

  void submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      showOtpDialog(); // Proceed to OTP
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isSignup = widget.mode == 'signup';

    return Scaffold(
      appBar: AppBar(title: Text(widget.mode == 'signin' ? "Sign In" : "Sign Up")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              if (isSignup) ...[
                TextFormField(
                  decoration: InputDecoration(labelText: 'Name'),
                  onSaved: (value) => name = value ?? '',
                  validator: (value) => value!.isEmpty ? 'Enter your name' : null,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Village'),
                  onSaved: (value) => village = value ?? '',
                  validator: (value) => value!.isEmpty ? 'Enter your village' : null,
                ),
              ],
              TextFormField(
                decoration: InputDecoration(labelText: 'Mobile Number'),
                keyboardType: TextInputType.phone,
                onSaved: (value) => phone = value ?? '',
                validator: (value) => value!.length != 10 ? 'Enter valid 10-digit number' : null,
              ),
              if (isSignup)
                DropdownButtonFormField<String>(
                  value: selectedLanguage,
                  decoration: InputDecoration(labelText: 'Language'),
                  items: languages
                      .map((lang) => DropdownMenuItem(value: lang, child: Text(lang)))
                      .toList(),
                  onChanged: (value) {
                    setState(() => selectedLanguage = value!);
                  },
                ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    textStyle: TextStyle(fontSize: 16),
                  ),
                  child: Text("📲 Send OTP"),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}


// ------------------------ Final Home App Page ------------------------
class HomeAppPage extends StatelessWidget {
  final String name;
  final String village;
  final String phone;
  final String language;

  HomeAppPage({
    required this.name,
    required this.village,
    required this.phone,
    required this.language,
  });

  void showProfileDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text("Profile"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Name: $name"),
            Text("Village: $village"),
            Text("Phone: $phone"),
            Text("Language: $language"),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text("Close"),
          ),
        ],
      ),
    );
  }

  void makeComplaint(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ComplaintFormPage()),
    );
  }

  void viewComplaints(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ComplaintListPage()),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Village Voice"),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () => showProfileDialog(context),
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            CustomMainButton(
            text: "Make a Complaint",
            icon: Icons.record_voice_over,
            color: Colors.deepPurple,
            onPressed: () => makeComplaint(context),
          ),


              SizedBox(height: 20),
          CustomMainButton(
            text: "View Complaints",
            icon: Icons.library_books,
            color: Colors.green,
            onPressed: () => viewComplaints(context),
          ),
            ],
          ),
        ),
      ),
    );
  }
}
