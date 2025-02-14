import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';


class utils{
  Container buildAIInsightsCard() {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            spreadRadius: 2,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "AI Insights",
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
                  Icon(LucideIcons.smile, size: 30, color: Colors.green),
                  SizedBox(height: 5),
                  Text("Mood", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black54)),
                  SizedBox(height: 3),
                  Text("Happy", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black)),
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
                  Icon(LucideIcons.heart, size: 30, color: Colors.red),
                  SizedBox(height: 5),
                  Text("Health", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black54)),
                  SizedBox(height: 3),
                  Text("Excellent", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }




}


class AIInsightsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            spreadRadius: 2,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "AI Insights",
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
              _buildInsightItem(LucideIcons.smile, "Mood", "Happy", Colors.green),
              _buildInsightItem(LucideIcons.barChart, "Activity", "Active", Colors.blue),
              _buildInsightItem(LucideIcons.heart, "Health", "Excellent", Colors.red),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInsightItem(IconData icon, String title, String value, Color color) {
    return Column(
      children: [
        Icon(icon, size: 30, color: color),
        SizedBox(height: 5),
        Text(title, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black54)),
        SizedBox(height: 3),
        Text(value, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black)),
      ],
    );
  }
}
