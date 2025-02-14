import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Background gradient
          Container(
            width: screenWidth,
            height: screenHeight,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFFFF8E1), Color(0xFF1E6F52)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          // Curved Design
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: screenHeight * 0.45,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
            ),
          ),

          // Main Content
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight * 0.1),

              // Large Circle Placeholder (Main Dog Image)
              Center(
                child: CircleAvatar(
                  radius: screenWidth * 0.2,
                  backgroundColor: Colors.grey[300],
                  child: Icon(Icons.pets, size: screenWidth * 0.15, color: Colors.white),
                ),
              ),

              SizedBox(height: screenHeight * 0.02),

              // Small Circular Placeholders
              Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 0,
                    left: screenWidth * 0.2,
                    child: CircleAvatar(
                      radius: screenWidth * 0.08,
                      backgroundColor: Colors.grey[300],
                      child: Icon(Icons.pets, size: screenWidth * 0.05, color: Colors.white),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: screenWidth * 0.2,
                    child: CircleAvatar(
                      radius: screenWidth * 0.08,
                      backgroundColor: Colors.grey[300],
                      child: Icon(Icons.pets, size: screenWidth * 0.05, color: Colors.white),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: screenWidth * 0.15,
                    child: CircleAvatar(
                      radius: screenWidth * 0.06,
                      backgroundColor: Colors.grey[300],
                      child: Icon(Icons.pets, size: screenWidth * 0.04, color: Colors.white),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: screenWidth * 0.15,
                    child: CircleAvatar(
                      radius: screenWidth * 0.06,
                      backgroundColor: Colors.grey[300],
                      child: Icon(Icons.pets, size: screenWidth * 0.04, color: Colors.white),
                    ),
                  ),
                ],
              ),

              SizedBox(height: screenHeight * 0.05),

              // Title Text
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
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

              // Subtitle Text
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.15),
                child: Text(
                  "Effortlessly track your pet’s health, mood, and activity for better care.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: screenWidth * 0.04,
                    color: Colors.black54,
                  ),
                ),
              ),

              SizedBox(height: screenHeight * 0.05),

              // Get Started Button
              ElevatedButton(
                onPressed: () {
                  Get.offAllNamed('/home');
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.02,
                    horizontal: screenWidth * 0.25,
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
            ],
          ),
        ],
      ),
    );
  }
}
