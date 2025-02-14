import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RecommendedSection extends StatelessWidget {
  final List<Map<String, dynamic>> recommendations = [
    {
      "icon": Icons.vaccines,
      "title": "Vaccination",
      "subtitle": "Next shot in 3 days"
    },
    {
      "icon": Icons.pets,
      "title": "Grooming Time",
      "subtitle": "Book appointment"
    },
    {
      "icon": Icons.health_and_safety,
      "title": "Health Check",
      "subtitle": "Regular checkup"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 12.0, bottom: 8.0),
          child: Text(
            "Recommended",
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
        SizedBox(height: 8),
        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: recommendations.length,
            padding: EdgeInsets.all(4),
            itemBuilder: (context, index) {
              return Container(
                width: 160,
                margin: EdgeInsets.symmetric(horizontal: 8),
                padding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.12),
                      blurRadius: 6,
                      spreadRadius: 3,
                      offset: Offset(0, 3),
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 4,
                      spreadRadius: 2,
                      offset: Offset(0, -2),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      recommendations[index]["icon"],
                      color: Colors.redAccent,
                      size: 30,
                    ),
                    SizedBox(height: 5),
                    Text(
                      recommendations[index]["title"],
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    // SizedBox(height: 2),
                    Text(
                      recommendations[index]["subtitle"],
                      style: GoogleFonts.poppins(
                        fontSize: 10,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
