import 'package:flutter/material.dart';
import 'package:in_time_app/core/shared_widgets/app_button_widget.dart';
import 'package:in_time_app/core/utils/app_colors.dart';
import 'package:in_time_app/features/home/data/models/partner_model.dart';
import 'package:in_time_app/features/home/data/models/slider_model.dart';
import 'package:in_time_app/features/home/presentation/screens/home_screen_one_doctor.dart';
import '../../../../core/utils/app_asset_path.dart';
import '../screens/navigation_screen.dart';

class DoctorCard extends StatelessWidget {
  final PartnerModel partner;
  const DoctorCard({super.key, required this.partner});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreenOneDoctor(partner: partner,),
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
                child: Image.network(
                  partner.media, // Replace with your image
                  width: 70,
                  height: 70,
                  fit: BoxFit.fitWidth,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(AppAsset.inTimeApp,
                      fit: BoxFit.fitWidth,
                      height: 150,
                      width: 70,);
                      Icon(Icons.error);
                  },
                ),
              ),
              const SizedBox(width: 12),

              // Info Column
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Name and heart icon
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          partner.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(Icons.favorite_border, color: Colors.grey),
                      ],
                    ),
                    const SizedBox(height: 4),

                     Text(
                      partner.specialty,
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 2),

                     Text(
                      partner.experience,
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 4),
                    if (screenSize.width > 447)
                       Row(children: [
                        Row(
                          children: [
                            Icon(Icons.location_on,
                                size: 16, color: Colors.redAccent),
                            SizedBox(width: 4),
                            Text(partner.address,
                                style: TextStyle(fontSize: 13, color: Colors.grey)),
                          ],
                        ),
                        // SizedBox(width: 10),
                        // Row(
                        //   children: [
                        //     Icon(Icons.circle, size: 16, color: Colors.green),
                        //     SizedBox(width: 4),
                        //     Text("76 Patient Stories",
                        //         style: TextStyle(fontSize: 13, color: Colors.grey)),
                        //   ],
                        // ),
                        SizedBox(height: 6),
                      ],),
                      if (screenSize.width < 447)
                         Column(
                          children: [
                            Row(
                              children: [
                                Icon(Icons.location_on,
                                    size: 16, color: Colors.redAccent),
                                SizedBox(width: 4),
                                Text(partner.address,
                                    style: TextStyle(fontSize: 13, color: Colors.grey)),
                              ],
                            ),
                            // SizedBox(width: 10),
                            // Row(
                            //   children: [
                            //     Icon(Icons.circle, size: 16, color: Colors.green),
                            //     SizedBox(width: 4),
                            //     Text("76 Patient Stories",
                            //         style: TextStyle(fontSize: 13, color: Colors.grey)),
                            //   ],
                            // ),
                            SizedBox(height: 6),
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
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreenOneDoctor(),));
                          },
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
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>  HomeScreenOneDoctor(partner: partner,),));
                          },
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
