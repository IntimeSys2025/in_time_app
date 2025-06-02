import 'package:flutter/material.dart';
import 'package:in_time_app/core/helpers/extension.dart';
import 'package:in_time_app/core/localization/locale_keys.g.dart';
import 'package:in_time_app/core/shared_widgets/app_button_widget.dart';
import 'package:in_time_app/core/utils/app_asset_path.dart';
import 'package:in_time_app/core/utils/app_colors.dart';
import '../../../../core/utils/app_font_size.dart';
import '../../data/models/slider_model.dart';

class DoctorDescCard extends StatelessWidget {
  final SliderModel sliderModel;
  const DoctorDescCard({super.key, required this.sliderModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 180,
      decoration: BoxDecoration(
        color: AppColors.kGreenBackground, // Green background
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all( 16),
      child: Row(
        children: [
          // SizedBox(width: MediaQuery.of(context).size.width * 0.4,),
          Image.network(
            sliderModel.media,
            // fit: BoxFit.fitWidth,
            // height: 200,
            width: MediaQuery.of(context).size.width * 0.3,
          ),
          10.widthSpace,
          // const SizedBox(width: 12),

          // Doctor Info and Button
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                 Text( sliderModel.title,
                  style: TextStyle(
                    fontSize: AppFontSize.fontSize18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 6),
                 Text(
                  sliderModel.text,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 12),

                // Book Now button
                if(sliderModel.isButton == 1)
                AppButtonWidget(
                    title: sliderModel.buttonText,
                    backgroundColor: AppColors.white,
                    textColor: AppColors.black,
                    onPressed: () {}),
                const SizedBox(height: 12),
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

    Stack(
      children: [
        Container(
          height: 180,
          decoration: BoxDecoration(
            color: AppColors.kGreenBackground, // Green background
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
              ),

              const SizedBox(width: 12),

              // Doctor Info and Button
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Linda AbdelAziz',
                      style: TextStyle(
                        fontSize: AppFontSize.fontSize18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'Over 7 years helping individuals build confidence, and maintain healthy routines',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Book Now button
                    AppButtonWidget(
                        title: 'Book Now',
                        backgroundColor: AppColors.white,
                        textColor: AppColors.black,
                        onPressed: () {})
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
        ),
        Positioned(
          top: 0,
          left: 0,
          child: Image.asset(
            AppAsset.doctorImage,
            fit: BoxFit.fitHeight,
            height: 200,
            width: MediaQuery.of(context).size.width * 0.4,
          ),
        ),
      ],
    );
  }
}
