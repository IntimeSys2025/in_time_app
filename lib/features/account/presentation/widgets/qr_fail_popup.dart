import 'package:flutter/material.dart';
import 'package:in_time_app/core/helpers/extension.dart';
import 'package:in_time_app/core/shared_widgets/app_button_widget.dart';

import '../../../../core/utils/app_colors.dart';

class QrFailPopup extends StatelessWidget {
  const QrFailPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      contentPadding: EdgeInsets.zero,
      content: Container(
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(15)),
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Red Circle with White X
            Container(
              width: 70,
              height: 70,
              decoration: const BoxDecoration(
                color: AppColors.kRed,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.close,
                color: Colors.white,
                size: 40,
              ),
            ),
            24.heightSpace,

            // Title
            const Text(
              // "Invalid QR Code!",
              "Invalid Provider ID!",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            12.heightSpace,

            // Subtitle
            Text(
              "Provider ID is invalid, please try again",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32),

            // Buttons
            Row(
              children: [
                // Cancel Button
                Expanded(
                    child: AppButtonWidget(
                        title: 'Cancel',
                        backgroundColor: AppColors.white,
                        textColor: AppColors.kGreenButton,
                        borderColor: AppColors.kGreenButton,
                        onPressed: () {
                          Navigator.of(context).pop();
                        })
                    // OutlinedButton(
                    //   onPressed: () {
                    //     Navigator.of(context).pop(); // Close dialog
                    //   },
                    //   style: OutlinedButton.styleFrom(
                    //     foregroundColor: Colors.green,
                    //     side: BorderSide(color: Colors.green),
                    //     padding: const EdgeInsets.symmetric(vertical: 14),
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(30),
                    //     ),
                    //   ),
                    //   child: const Text(
                    //     "Cancel",
                    //     style:
                    //         TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    //   ),
                    // ),
                    ),
                16.widthSpace,

                // Try Again Button
                Expanded(
                    child: AppButtonWidget(
                        title: 'Try Again',
                        onPressed: () {
                          Navigator.of(context).pop();
                        })

                    // ElevatedButton(
                    //   onPressed: () {
                    //     Navigator.of(context).pop(); // Close dialog
                    //     // TODO: Retry QR scan logic here
                    //     debugPrint("Trying QR scan again...");
                    //   },
                    //   style: ElevatedButton.styleFrom(
                    //     backgroundColor: Colors.green,
                    //     foregroundColor: Colors.white,
                    //     padding: const EdgeInsets.symmetric(vertical: 14),
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(30),
                    //     ),
                    //     elevation: 0,
                    //   ),
                    //   child: const Text(
                    //     "Try Again",
                    //     style:
                    //         TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    //   ),
                    // ),
                    ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
