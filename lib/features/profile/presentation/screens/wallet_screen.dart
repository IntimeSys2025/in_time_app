import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:in_time_app/core/helpers/extension.dart';
import 'package:in_time_app/core/utils/app_asset_path.dart';
import 'package:in_time_app/core/utils/app_colors.dart';
import 'package:in_time_app/core/utils/app_font_size.dart';
import 'package:in_time_app/features/profile/presentation/widget/wallet_action_widget.dart';
import 'package:in_time_app/features/profile/presentation/widget/wallet_info_widget.dart';

class WalletScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wallet'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          // Padding(
          //   padding: const EdgeInsets.all(16.0),
          //   child: Text(
          //     '9:41',
          //     style: TextStyle(fontSize: 16, color: Colors.grey),
          //   ),
          // ),
          Card(
            color: AppColors.kGreenBackground,
            child: ListTile(
              title: Text(
                'Total Amount',
                style: GoogleFonts.lexend(
                    fontWeight: FontWeight.w500, color: AppColors.white),
                // style: TextStyle(fontWeight: FontWeight.bold,color: AppColors.white),
              ),
              isThreeLine: true,
              subtitle: Text(
                '2500.00 EGP',
                style: GoogleFonts.lexend(
                    fontSize: AppFontSize.fontSize30,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white),
              ),
              trailing: Image.asset(
                AppAsset.wallet,
                height: 100,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          10.heightSpace,
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            margin: const EdgeInsets.all(6.0),
            decoration: BoxDecoration(
                color: AppColors.moreLightGrey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                WalletActionWidget(
                  title: 'Reserved',
                  isSelected: true,
                  onPressed: () {},
                ),
                WalletActionWidget(
                  title: 'Refund',
                  isSelected: false,
                  onPressed: () {},
                ),
                WalletActionWidget(
                  title: 'Penalties',
                  isSelected: false,
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: [
                WalletInfoWidget(
                    title: '200.000 EGP',
                    subtitle: 'Reserved "Service 1" from...',
                    date: 'TUE 22 Jun 2025'),
                Divider(),
                WalletInfoWidget(
                    title: '200.000 EGP',
                    subtitle: 'Reserved "Service 1" from...',
                    date: 'TUE 22 Jun 2025'),
                Divider(),
                WalletInfoWidget(
                    title: '200.000 EGP',
                    subtitle: 'Reserved "Service 1" from...',
                    date: 'TUE 22 Jun 2025'),
                Divider(),
                WalletInfoWidget(
                    title: '200.000 EGP',
                    subtitle: 'Reserved "Service 1" from...',
                    date: 'TUE 22 Jun 2025'),
                Divider(),
                WalletInfoWidget(
                    title: '200.000 EGP',
                    subtitle: 'Reserved "Service 1" from...',
                    date: 'TUE 22 Jun 2025'),
                Divider(),
                WalletInfoWidget(
                    title: '200.000 EGP',
                    subtitle: 'Reserved "Service 1" from...',
                    date: 'TUE 22 Jun 2025'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
