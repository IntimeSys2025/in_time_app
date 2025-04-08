import 'package:flutter/material.dart';

class TermsScreen extends StatelessWidget {
  final String title;
  final String subtitle;
  final String updatedDate;
  final String heading;
  final List<String> bulletPoints;

  const TermsScreen({
    super.key,
    required this.title,
    required this.subtitle,
    required this.updatedDate,
    required this.heading,
    required this.bulletPoints,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        leading: const BackButton(),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Last update: $updatedDate",
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              style: const TextStyle(fontSize: 15),
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                heading,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.green,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: bulletPoints.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Text("•", style: TextStyle(fontSize: 20)),
                    title: Text(bulletPoints[index]),
                    dense: true,
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text("Agree"),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
      // bottomNavigationBar:  SizedBox(
      //   width: double.infinity,
      //   child: ElevatedButton(
      //     onPressed: () {},
      //     style: ElevatedButton.styleFrom(
      //       backgroundColor: Colors.green,
      //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      //     ),
      //     child: const Text("Agree"),
      //   ),
      // ),
    );
  }
}
