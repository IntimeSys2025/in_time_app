import 'package:flutter/material.dart';
import 'package:in_time_app/core/shared_widgets/app_button_widget.dart';
import 'package:in_time_app/core/utils/app_colors.dart';
import '../screens/navigation_screen.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NavigationBarScreen(),
            ));
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 3,
        margin: const EdgeInsets.all(8),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              // Doctor Image
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/images/doctor.png', // Replace with your image
                  width: 70,
                  height: 70,
                  fit: BoxFit.fitWidth,
                ),
              ),
              const SizedBox(width: 12),

              // Info Column
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Name and heart icon
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Amir El-Sayed",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(Icons.favorite_border, color: Colors.grey),
                      ],
                    ),
                    const SizedBox(height: 4),

                    const Text(
                      "Specialist Cardiology",
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 2),

                    const Text(
                      "7 Years experience",
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 4),
                    if (screenSize.width > 447)
                      Row(children: [
                        const Row(
                          children: [
                            Icon(Icons.location_on,
                                size: 16, color: Colors.redAccent),
                            SizedBox(width: 4),
                            Text("Eloubour, Egypt",
                                style: TextStyle(fontSize: 13, color: Colors.grey)),
                          ],
                        ),
                        const SizedBox(width: 10),
                        const Row(
                          children: [
                            Icon(Icons.circle, size: 16, color: Colors.green),
                            SizedBox(width: 4),
                            Text("76 Patient Stories",
                                style: TextStyle(fontSize: 13, color: Colors.grey)),
                          ],
                        ),
                        const SizedBox(height: 6),
                      ],),
                      if (screenSize.width < 447)
                        Column(
                          children: [
                            const Row(
                              children: [
                                Icon(Icons.location_on,
                                    size: 16, color: Colors.redAccent),
                                SizedBox(width: 4),
                                Text("Eloubour, Egypt",
                                    style: TextStyle(fontSize: 13, color: Colors.grey)),
                              ],
                            ),
                            const SizedBox(width: 10),
                            const Row(
                              children: [
                                Icon(Icons.circle, size: 16, color: Colors.green),
                                SizedBox(width: 4),
                                Text("76 Patient Stories",
                                    style: TextStyle(fontSize: 13, color: Colors.grey)),
                              ],
                            ),
                            const SizedBox(height: 6),
                          ],
                        ),

                    const SizedBox(height: 10),
                    if (screenSize.width > 447)
                      Row(children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             Text("Next Available",
                                style: TextStyle(color: Colors.green)),
                             Text("11:00 AM tomorrow",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.black)),
                          ],
                        ),
                        const SizedBox(width: 10),
                        AppButtonWidget(
                          width: screenSize.width * 0.3,
                          title: 'Book Now',
                          onPressed: () {},
                          backgroundColor: AppColors.kLightGreen2,
                          textColor: AppColors.black,),
                      ],),

                    if (screenSize.width < 447)
                     Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Next Available",
                            style: TextStyle(color: Colors.green)),
                        const Text("11:00 AM tomorrow",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.black)),
                         const SizedBox(height: 6),
                        AppButtonWidget(
                          title: 'Book Now',
                          onPressed: () {},
                          backgroundColor: AppColors.kLightGreen2,
                          textColor: AppColors.black,),
                      ],
                    ),

                    const SizedBox(width: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
