import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_time_app/core/shared_widgets/app_button_widget.dart';
import 'package:in_time_app/core/utils/app_colors.dart';
import 'package:in_time_app/features/home/data/models/partner_details_model.dart';
import 'package:in_time_app/features/home/data/models/partner_model.dart';
import 'package:in_time_app/features/home/data/models/slider_model.dart';
import 'package:in_time_app/features/home/presentation/logic/home_cubit.dart';
import 'package:in_time_app/features/home/presentation/logic/home_states.dart';
import 'package:in_time_app/features/home/presentation/screens/home_screen_one_doctor.dart';
import 'package:in_time_app/features/home/presentation/screens/partner_details_screen.dart';
import '../../../../core/utils/app_asset_path.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../account/presentation/screens/loginScreen.dart';
import '../screens/navigation_screen.dart';

class DoctorCard extends StatelessWidget {
  final PartnerModel partner;
  // final Function() onTap;
  const DoctorCard({super.key, required this.partner});

  @override
  Widget build(BuildContext context) {
    final homeCubit = BlocProvider.of<HomeCubit>(context);
    final screenSize = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        homeCubit.getPartnerDetails(partnerId: partner.id.toString());
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 3,
        margin: const EdgeInsets.symmetric(vertical: 8),
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
                    return Image.asset(
                      AppAsset.inTimeApp,
                      fit: BoxFit.fitWidth,
                      height: 150,
                      width: 70,
                    );
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
                      style: const TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 2),

                    if (partner.experience != '')
                      Text(
                        partner.experience,
                        style: TextStyle(color: Colors.grey),
                      ),
                    if (partner.experience != '') const SizedBox(height: 4),
                    if (screenSize.width > 447 && partner.address != '')
                      Row(
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.location_on,
                                  size: 16, color: Colors.redAccent),
                              SizedBox(width: 4),
                              Text(partner.address,
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.grey)),
                            ],
                          ),
                          SizedBox(height: 6),
                        ],
                      ),
                    if (screenSize.width < 447 && partner.address != '')
                      Column(
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.location_on,
                                  size: 16, color: Colors.redAccent),
                              SizedBox(width: 4),
                              Text(partner.address,
                                  style: const TextStyle(
                                      fontSize: 13, color: Colors.grey)),
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
                      Row(
                        children: [
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
                              if (AppConstants.userToken == '') {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const LoginScreen(),
                                    ));
                                return;
                              }

                              homeCubit.getPartnerDetails(
                                  partnerId: partner.id.toString());
                              // Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreenOneDoctor(),));
                            },
                            backgroundColor: AppColors.kLightGreen2,
                            textColor: AppColors.black,
                          ),
                        ],
                      ),

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
                              if (AppConstants.userToken == '') {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const LoginScreen(),
                                    ));
                                return;
                              }
                              homeCubit.getPartnerDetails(
                                  partnerId: partner.id.toString());
                              // Navigator.push(context, MaterialPageRoute(builder: (context) =>  HomeScreenOneDoctor(partner: partner,),));
                            },
                            backgroundColor: AppColors.kLightGreen2,
                            textColor: AppColors.black,
                          ),
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
