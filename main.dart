import 'package:flutter/material.dart';
import 'package:junkee/global.dart';
import 'package:junkee/homepage.dart';
import 'package:junkee/login.dart';
import 'package:junkee/dbhelper.dart';
import 'package:junkee/recycle.dart';
import 'package:junkee/homepage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
        future: DBHelper().checkUserLoggedIn(), // Call checkUserLoggedIn from DBHelper
        builder: (context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator(); // Show loading indicator while checking
          } else {
            if (snapshot.data == true) {
              return HomePage(); // Navigate to RecyclePage if user is logged in
            } else {
              //return HomePage();
              return const OnboardingScreen(); // Navigate to OnboardingScreen if user is not logged in
            }
          }
        },
      ),
    );
  }
}


class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentIndex = 0;

  void _nextScreen() {
    setState(() {
      if (_currentIndex < onboardingPages.length - 1) {
        _currentIndex++;
      } else {
        // Navigate to the next screen after the onboarding screens
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => SignupScreen(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Green header with inclined bottom border
          CustomPaint(
            size: Size(
              MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height * 0.65,
            ),
            painter: InclinedBorderPainter(),
          ),
          Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.15),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Center(child: onboardingPages[_currentIndex]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _nextScreen,
                          style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Color(0xff00926d)), // Change button color to green
    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0), // Adjust border radius
      ),
    ),
    minimumSize: MaterialStateProperty.all<Size>(Size(double.infinity, 60)), // Increase button height
  ),
                          child: Text(_currentIndex == onboardingPages.length - 1 ? 'Start' : 'Next'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


// Onboarding Pages
List<Widget> onboardingPages = [
  OnboardingPage(
    title: 'Doorstep Waste Pickup',
    description: 'Sell your scrap and waste material. Get the best rate and doorstep waste pickup at your convient time.',
    imagePath: "assets/Screenshot 2024-02-16 143643.png",
  ),
  OnboardingPage(
    title: 'Waste Management Guide',
    description: 'Get waste sorting guides and scanning helps you to identify what can be recycled at home',
    imagePath: "assets/Screenshot 2024-02-16 144224.png",
  ),
  OnboardingPage(
    title: 'Nearest Recycling Plant',
    description: 'The app also helps to find the nearest recycling shop, and share directions and number',
    imagePath: "assets/Screenshot 2024-02-16 144235.png",
  ),
];

class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath; // Path to your image file

  const OnboardingPage({
    Key? key,
    required this.title,
    required this.description,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "$imagePath",
                  width: 500, // Adjust the width as needed
                  height: 300, // Adjust the height as needed
                ),
                Text(
                  title,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18,fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

