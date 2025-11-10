import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:in_time_app/core/utils/app_colors.dart';
import 'package:in_time_app/core/utils/app_font_size.dart';

class WalletInfoWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String date;
  const WalletInfoWidget(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.date});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: GoogleFonts.lexend(fontSize: AppFontSize.fontSize18,fontWeight: FontWeight.w500),
      ),
      subtitle: Text(subtitle,style: GoogleFonts.lexend(color: AppColors.kGray),),
      trailing: Text(date ,style: GoogleFonts.lexend(color: AppColors.kGray)),
    );
  }
}
