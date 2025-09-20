import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_time_app/core/shared_widgets/app_button_widget.dart';
import 'package:in_time_app/core/utils/app_asset_path.dart';
import 'package:in_time_app/features/home/data/models/service_model.dart';
import 'package:in_time_app/features/home/presentation/logic/home_cubit.dart';
import '../../../../core/utils/app_colors.dart';

class ServiceCard extends StatelessWidget {
  final ServiceModel service;
  const ServiceCard({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    // debugPrint('ServiceCard: ${service.toJson()}');
    final homeCubit = BlocProvider.of<HomeCubit>(context);
    return Container(
      decoration: BoxDecoration(
          // color: const Color(0xFF4CAF50), // Green background
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.green.shade100)),
      padding: const EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          // Doctor Image
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              service.imageUrl,
              // AppAsset.servicesImage,
              fit: BoxFit.fitWidth,
              height: 150,
               width: 70,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(AppAsset.inTimeApp,
                  fit: BoxFit.fitWidth,
                  height: 150,
                  width: 70,);
                  const Center(
                  child: Icon(Icons.error),
                );
              },
            ),
          ),

          const SizedBox(width: 16),

          // Doctor Info and Button
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(
                  // 'Achieve Your Goals',
                  service.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                  ),
                ),
                const SizedBox(height: 6),
                 Text(
                  service.description,
                  // 'Practical guidance from the Core curriculum to grow ....',
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.black,
                  ),
                ),
                const SizedBox(height: 12),
                AppButtonWidget(
                    title: 'More Details',
                    textColor: AppColors.black,
                    backgroundColor: AppColors.kLightGreen,
                    onPressed: () {
                      homeCubit.getSubServices(id: service.id);

                    })

                // Book Now button
                // SizedBox(
                //   height: 36,
                //   child: ElevatedButton(
                //     onPressed: () {},
                //     style: ElevatedButton.styleFrom(
                //       backgroundColor: Colors.white,
                //       foregroundColor: Colors.black,
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(30),
                //       ),
                //     ),
                //     child: const Text('Book Now'),
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
