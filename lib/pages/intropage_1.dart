import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {}); // Ensure animations run after frame render
    });

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFF1DD), Color(0xFF1E6F52)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                if (screenWidth > 0)
                  Positioned(
                    top: screenHeight * 0.15,
                    child: ElasticIn(
                      child: CircleAvatar(
                        radius: screenWidth * 0.2,
                        backgroundImage: AssetImage('assets/dog_main.jpg'),
                      ),
                    ),
                  ),
                if (screenWidth > 0)
                  Positioned(
                    top: screenHeight * 0.05,
                    left: screenWidth * 0.15,
                    child: BounceInDown(
                      child: CircleAvatar(
                        radius: screenWidth * 0.08,
                        backgroundImage: AssetImage('assets/cat1.jpg'),
                      ),
                    ),
                  ),
                if (screenWidth > 0)
                  Positioned(
                    top: screenHeight * 0.05,
                    right: screenWidth * 0.15,
                    child: BounceInDown(
                      child: CircleAvatar(
                        radius: screenWidth * 0.08,
                        backgroundImage: AssetImage('assets/cat2.jpg'),
                      ),
                    ),
                  ),
                if (screenWidth > 0)
                  Positioned(
                    bottom: screenHeight * 0.15,
                    left: screenWidth * 0.2,
                    child: BounceInUp(
                      child: CircleAvatar(
                        radius: screenWidth * 0.07,
                        backgroundImage: AssetImage('assets/dog2.jpg'),
                      ),
                    ),
                  ),
                if (screenWidth > 0)
                  Positioned(
                    bottom: screenHeight * 0.15,
                    right: screenWidth * 0.2,
                    child: BounceInUp(
                      child: CircleAvatar(
                        radius: screenWidth * 0.07,
                        backgroundImage: AssetImage('assets/cat3.png'),
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(height: screenHeight * 0.05),
            FadeInUp(
              child: Text(
                "Stay Ahead of Your Pet’s Needs with Ease!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: screenWidth * 0.06,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            FadeInUp(
              delay: Duration(milliseconds: 300),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                child: Text(
                  "Effortlessly track your pet’s health, mood, and activity for better care.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: screenWidth * 0.04,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
            FadeInUp(
              delay: Duration(milliseconds: 600),
              child: ElevatedButton(
                onPressed: () {
                  Get.offAllNamed('/home'); // Ensure '/home' is in Get routes
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.02,
                    horizontal: screenWidth * 0.2,
                  ),
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  "Get Started",
                  style: TextStyle(
                    fontSize: screenWidth * 0.05,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
