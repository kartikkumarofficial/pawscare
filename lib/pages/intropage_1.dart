import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animate_do/animate_do.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
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
                Positioned(
                  top: Get.height * 0.15,
                  child: ElasticIn(
                    child: CircleAvatar(
                      radius: Get.width * 0.2,
                      backgroundImage: AssetImage('assets/dog_main.jpg'),
                    ),
                  ),
                ),
                Positioned(
                  top: Get.height * 0.05,
                  left: Get.width * 0.15,
                  child: BounceInDown(
                    child: CircleAvatar(
                      radius: Get.width * 0.08,
                      backgroundImage: AssetImage('assets/cat1.jpg'),
                    ),
                  ),
                ),
                Positioned(
                  top: Get.height * 0.05,
                  right: Get.width * 0.15,
                  child: BounceInDown(
                    child: CircleAvatar(
                      radius: Get.width * 0.08,
                      backgroundImage: AssetImage('assets/cat2.jpg'),
                    ),
                  ),
                ),
                Positioned(
                  bottom: Get.height * 0.15,
                  left: Get.width * 0.2,
                  child: BounceInUp(
                    child: CircleAvatar(
                      radius: Get.width * 0.07,
                      backgroundImage: AssetImage('assets/dog2.jpg'),
                    ),
                  ),
                ),
                Positioned(
                  bottom: Get.height * 0.15,
                  right: Get.width * 0.2,
                  child: BounceInUp(
                    child: CircleAvatar(
                      radius: Get.width * 0.07,
                      backgroundImage: AssetImage('assets/cat3.png'),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: Get.height * 0.05),
            FadeInUp(
              child: Text(
                "Stay Ahead of Your Pet’s Needs with Ease!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: Get.width * 0.06,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: Get.height * 0.02),
            FadeInUp(
              delay: Duration(milliseconds: 300),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.width * 0.1),
                child: Text(
                  "Effortlessly track your pet’s health, mood, and activity for better care.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: Get.width * 0.04,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
            SizedBox(height: Get.height * 0.05),
            FadeInUp(
              delay: Duration(milliseconds: 600),
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to home or next screen
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    vertical: Get.height * 0.02,
                    horizontal: Get.width * 0.2,
                  ),
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  "Get Started",
                  style: TextStyle(
                    fontSize: Get.width * 0.05,
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
