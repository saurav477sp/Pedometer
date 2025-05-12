import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:pedometer/helper/firebase_helper.dart.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  FirebaseHelper authentication = FirebaseHelper();
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;
  bool isLogedin = true;
  DatabaseReference ref = FirebaseDatabase.instance.ref('user');
  int _currentIndex = 0;
  DateTime? currentBackPressTime;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_currentIndex != 0) {
          // If not on home screen, navigate to home
          setState(() => _currentIndex = 0);
          return false; // Prevent default back behavior
        }

        // On home screen, implement double tap to exit
        DateTime now = DateTime.now();
        if (currentBackPressTime == null ||
            now.difference(currentBackPressTime!) >
                const Duration(seconds: 2)) {
          currentBackPressTime = now;
          // Fluttertoast.showToast(msg: 'press again to exit');
          return false;
        }
        return true; // Exit app
      },
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.green),
        body: Center(
          child: FilledButton(
            onPressed: () async => await authentication.signout(),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.amber),
            ),
            child: const Text('sign out'),
          ),
        ),
        // bottomNavigationBar: const CustomBottomNavigationBar(),
      ),
    );
  }
}

// Reusable White Box Component
class WhiteInfoBox extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget? icon;
  const WhiteInfoBox({
    super.key,
    required this.title,
    required this.subtitle,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          if (icon != null)
            Padding(padding: const EdgeInsets.only(right: 8.0), child: icon),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              Text(
                subtitle,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Reusable Bottom Swap Button
class BottomSwapButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const BottomSwapButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 8),
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black),
          ],
        ),
      ),
    );
  }
}

class FitnessJourneySplashScreen extends StatelessWidget {
  const FitnessJourneySplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF4A4A6A), Color(0xFF2C2C3C)],
          ),
        ),
        child: Stack(
          children: [
            // Background Image and Text
            const Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.only(top: 80, left: 24, right: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Start your\nFitness Journey',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Start your fitness journey with our app\'s guidance and support.',
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),

            // Fitness Person Image
            Positioned(
              bottom: 100,
              right: -50,
              child: Image.network(
                'https://example.com/fitness-person.jpg', // Replace with actual image
                width: 300,
                fit: BoxFit.cover,
              ),
            ),

            // Curved Arrow
            Positioned(
              top: 250,
              left: 24,
              child: Transform.rotate(
                angle: -0.5,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Colors.white24,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.arrow_downward, color: Colors.white),
                ),
              ),
            ),

            // White Info Box
            const Positioned(
              top: 300,
              left: 24,
              child: WhiteInfoBox(
                title: 'Drink',
                subtitle: '150 ml',
                icon: Icon(Icons.wine_bar, color: Colors.blue),
              ),
            ),

            // Bottom Swap Button
            Positioned(
              bottom: 40,
              left: 0,
              right: 0,
              child: Center(
                child: BottomSwapButton(
                  text: 'Lets start',
                  onPressed: () {
                    // Navigation logic here
                    log('Starting fitness journey');
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
