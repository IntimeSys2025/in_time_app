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
    return
        //   Center(
        //   child: Stack(
        //     clipBehavior: Clip.none, // allows the image to overflow
        //     children: [
        //       // The green container
        //       Container(
        //         width: 320,
        //         height: 150,
        //         decoration: BoxDecoration(
        //           color: const Color(0xFF4CAF50), // green background
        //           borderRadius: BorderRadius.circular(16),
        //         ),
        //         child: Padding(
        //           padding: const EdgeInsets.fromLTRB(140, 20, 20, 20),
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               const Text(
        //                 "Ali AbdelAziz",
        //                 style: TextStyle(
        //                   color: Colors.white,
        //                   fontSize: 20,
        //                   fontWeight: FontWeight.bold,
        //                 ),
        //               ),
        //               const SizedBox(height: 8),
        //               const Text(
        //                 "Over 7 years helping individuals build\nconfidence, and maintain healthy routines",
        //                 style: TextStyle(
        //                   color: Colors.white,
        //                   fontSize: 13,
        //                 ),
        //               ),
        //               const Spacer(),
        //               ElevatedButton(
        //                 onPressed: () {},
        //                 style: ElevatedButton.styleFrom(
        //                   backgroundColor: Colors.white,
        //                   foregroundColor: Colors.black,
        //                   shape: RoundedRectangleBorder(
        //                     borderRadius: BorderRadius.circular(12),
        //                   ),
        //                 ),
        //                 child: const Text("Book Now"),
        //               ),
        //             ],
        //           ),
        //         ),
        //       ),
        //
        //       // Doctor image (positioned partially above the container)
        //       Positioned(
        //         left: 0,
        //         top: -20,
        //         bottom: 0,// makes it go above the container
        //         child: Image.network(
        //           sliderModel.media, // your image path
        //           width: 130,
        //           fit: BoxFit.cover,
        //         ),
        //       ),
        //     ],
        //   ),
        // );

        Stack(
      clipBehavior: Clip.none,
      children: [

        Container(
          // height: 200,
          decoration: BoxDecoration(
            color: AppColors.kGreenBackground, // Green background
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              const SizedBox(
                width: 130,
              ),
              // 10.widthSpace,
              // Doctor Info and Button
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      sliderModel.title,
                      style: const TextStyle(
                        fontSize: AppFontSize.fontSize18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      sliderModel.text,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                    12.heightSpace,

                    // Book Now button
                    if (sliderModel.buttonText != '')
                      AppButtonWidget(
                          title: sliderModel.buttonText,
                          backgroundColor: AppColors.white,
                          textColor: AppColors.black,
                          onPressed: () {}),
                    12.heightSpace,
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: -40,
          bottom: 0,
          child: Image.network(
            sliderModel.media,
            fit: BoxFit.fitHeight,
            // height: 200,
            width: MediaQuery.of(context).size.width * 0.3,
            errorBuilder: (context, error, stackTrace) {
              return Image.asset(
                AppAsset.inTimeApp,
                fit: BoxFit.cover,
                height: 200,
                width: 130,
              );
            },
          ),
        ),
      ],
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
