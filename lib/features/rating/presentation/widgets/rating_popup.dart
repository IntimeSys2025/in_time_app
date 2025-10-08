import 'package:flutter/material.dart';
import 'package:in_time_app/core/helpers/extension.dart';
import 'package:in_time_app/core/shared_widgets/app_button_widget.dart';
import 'package:in_time_app/core/utils/app_colors.dart';
import 'package:in_time_app/core/utils/app_font_size.dart';

class RatingPopup extends StatefulWidget {
  const RatingPopup({super.key});

  @override
  _RatingPopupState createState() => _RatingPopupState();
}

class _RatingPopupState extends State<RatingPopup> {
  int _rating = 0;
  final _reviewController = TextEditingController();
  bool _isAnonymous = false;

  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        // padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: AppColors.kLightGreen,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12),
                    topLeft: Radius.circular(12)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Your Review',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
            // 16.heightSpace,
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                // color:AppColors.kLightGreen,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(12),
                    bottomLeft: Radius.circular(12)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (index) {
                      return IconButton(
                        icon: Icon(
                          index < _rating ? Icons.star : Icons.star_border,
                          color: Colors.amber,
                          size: 30,
                        ),
                        onPressed: () {
                          setState(() {
                            _rating = index + 1;
                          });
                        },
                      );
                    }),
                  ),
                  16.heightSpace,
                  const Text('Enter Your Review (optional)'),
                  8.heightSpace,
                  TextField(
                    controller: _reviewController,
                    decoration: InputDecoration(
                      hintText: 'We appreciate your feedback...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    maxLines: 3,
                  ),
                  16.heightSpace,
                  Row(
                    children: [
                      Switch(
                        value: _isAnonymous,
                        onChanged: (value) {
                          setState(() {
                            _isAnonymous = value;
                          });
                        },
                        activeColor: Color(0xFF4CAF50),
                      ),
                      Text('Anonymous member'),
                    ],
                  ),
                  16.heightSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text(
                          'Cancel',
                          style: TextStyle(
                              color: AppColors.kGreenButton,
                              fontSize: AppFontSize.fontSize16),
                        ),
                      ),
                      8.widthSpace,
                      AppButtonWidget(
                          width: 150,
                          title: 'Submit',
                          onPressed: () {
                            Navigator.pop(context);
                            showModalBottomSheet(context: context, builder: (context) {
                              return SafeArea(
                                child: Container(
                                  padding: const EdgeInsets.all(35),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Text('Thanks For Rating',style: TextStyle(
                                        fontSize: AppFontSize.fontSize24,
                                        fontWeight: FontWeight.w700
                                      ),),
                                      30.heightSpace,
                                      AppButtonWidget(title: 'Go to home', onPressed: (){})
                                    ],
                                  ),
                                ),
                              );
                            },);
                          })
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
