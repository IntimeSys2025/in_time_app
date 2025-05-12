import 'package:flutter/material.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green.shade100),
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Tailored Sessions',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Icon(Icons.more_vert, color: Colors.grey),
            ],
          ),

          SizedBox(height: 4),

          // Subtitle
          Text(
            'Single',
            style: TextStyle(color: Colors.grey),
          ),

          SizedBox(height: 16),

          // Date and Time Row
          Row(
            children: [
              Icon(Icons.calendar_today, color: Colors.green, size: 18),
              SizedBox(width: 6),
              Text(
                '5 Oct',
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(width: 16),
              Icon(Icons.access_time, color: Colors.green, size: 18),
              SizedBox(width: 6),
              Text(
                '10:30pm',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
