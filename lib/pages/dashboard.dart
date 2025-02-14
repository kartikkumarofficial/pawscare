import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import 'package:pawscare/pages/AdoptionPage.dart';
import 'package:pawscare/pages/OnBoarding1.dart';

import 'package:lucide_icons/lucide_icons.dart';
import 'package:pawscare/widgets/customwidgets.dart';
import '../widgets/bottom_navigation_bar.dart';




class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _selectedIndex = 0;
  @override

  Widget build(BuildContext context) {
    double height = Get.height;
    double width = Get.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/happy1.jpg'),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome back, Kartik!",
                      style: TextStyle(color: Colors.white, fontSize:Get.height*0.023, fontWeight: FontWeight.bold),
                    ),
                    // Text(
                    //   "Let's take care of your pet 🐶",
                    //   style: TextStyle(color: Colors.white70, fontSize: 12),
                    // ),
                  ],
                ),
              ],
            ),
            IconButton(
              icon: Icon(Icons.notifications_active, color: Colors.white),
              onPressed: () {
              },
            ),
          ],
        ),
      ),

        body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [


            FadeInRight(
                child: Text("Your furry friend is doing great!",
                    style: TextStyle(fontSize: 16, color: Colors.grey)),
              ),
              SizedBox(height: height * 0.02),


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                      onTap: (){ Get.to(AdoptionPage());},
                      child: _buildFeatureButton(Icons.pets, "Adoption")),
                  InkWell(
                      onTap: (){ Get.to(WelcomePage());},
                      child: _buildFeatureButton(Icons.health_and_safety, "Health Scan")),
                  _buildFeatureButton(Icons.volunteer_activism, "Rescue"),
                  _buildFeatureButton(Icons.favorite, "Donations"),
                ],
              ),
              SizedBox(height: height * 0.03),
              FadeInLeft(
                child: Container(
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.only(left: 2,right: 2),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.white, Colors.white,],
                
                    ),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 5)],
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Colors.black12,
                    //     blurRadius: 10,
                    //     spreadRadius: 1,
                    //     offset: Offset(0, 4),
                    //   ),
                    // ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Today's Pet Insights",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Icon(LucideIcons.heartHandshake, size: 30, color: Colors.red),
                              SizedBox(height: 5),
                              Text("Health", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black54)),
                              SizedBox(height: 3),
                              Text("Excellent", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black)),
                            ],
                          ),
                
                          Column(
                            children: [
                              Icon(LucideIcons.barChart, size: 30, color: Colors.blue),
                              SizedBox(height: 5),
                              Text("Activity", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black54)),
                              SizedBox(height: 3),
                              Text("Active", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black)),
                            ],
                          ),
                
                          Column(
                            children: [
                              Icon(LucideIcons.smile, size: 30, color: Colors.green),
                              SizedBox(height: 5),
                              Text("Mood", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black54)),
                              SizedBox(height: 3),
                              Text("Happy", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black)),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // FadeInLeft(
              //   child: _buildCard("Today's Pet Insights", "87/100", "Excellent", "3 days until vet visit", width),
              // ),
              SizedBox(height: height * 0.03),
              FadeInRight(
                child: ActivityCard(),
              ),

              SizedBox(height: height * 0.03),
              FadeInUp(
                child: _buildRecommendedSection(),
              ),
              SizedBox(height: height * 0.03),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                ),
                onPressed: () {},
                child: Center(
                  child: Text("Emergency", style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: Color(0xFF1E6F52), // Greenish background color
        buttonBackgroundColor: Colors.orange, // Orange selected item background
        height: 60,
        items: <Widget>[
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.calendar_today, size: 30, color: Colors.white),
          Icon(Icons.favorite, size: 30, color: Colors.white),
          Icon(Icons.person, size: 30, color: Colors.white),
        ],
        index: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index; // Update the selected index
          });
        },
      ),
    );
  }

  Widget _buildFeatureButton(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.orangeAccent.withOpacity(0.2),
          child: Icon(icon, size: 30, color: Colors.orangeAccent),
        ),
        SizedBox(height: 5),
        Text(label, style: TextStyle(fontSize: 14)),
      ],
    );
  }

  Widget _buildCard(String title, String score, String status, String note, double width) {
    return Container(
      width: width,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 5)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(score, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text(status, style: TextStyle(fontSize: 16, color: Colors.green)),
            ],
          ),
          SizedBox(height: 5),
          Text(note, style: TextStyle(fontSize: 14, color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildActivityTracker(double width) {
    return Container(
      width: width,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 5)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Activity Tracker", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          Text("2,547 steps today | 1.8 km Distance", style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }

  Widget _buildRecommendedSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Recommended for You", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildRecommendedItem("Pet-Friendly Cafe", "Awesome Coffee, 6.5 km"),
            _buildRecommendedItem("Perfect Match", "Luna needs a home"),
          ],
        ),
      ],
    );
  }

  Widget _buildRecommendedItem(String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 100,
          height: 80,
          color: Colors.grey.shade300,
        ),
        SizedBox(height: 5),
        Text(title, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        Text(subtitle, style: TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }
}

