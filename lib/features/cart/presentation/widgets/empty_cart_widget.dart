import 'package:flutter/material.dart';

import '../../../../core/utils/app_asset_path.dart';
import '../../../../core/utils/app_font_size.dart';

class EmptyCartWidget extends StatelessWidget {
  const EmptyCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      spacing: 0,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AppAsset.emptyCart),
        const Text(
          'Add your favorite service',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: AppFontSize.fontSize16, fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
