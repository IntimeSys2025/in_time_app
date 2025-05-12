import 'package:flutter/material.dart';
import 'package:in_time_app/features/home/presentation/widgets/appointmant_card.dart';
import 'package:in_time_app/features/home/presentation/widgets/custom_search_bar.dart';
import 'package:in_time_app/features/home/presentation/widgets/doctor_card.dart';
import 'package:in_time_app/features/home/presentation/widgets/doctor_desc_card.dart';
import 'package:in_time_app/features/home/presentation/widgets/hospital_card.dart';
import 'package:in_time_app/features/home/presentation/widgets/welcome_header.dart';
import '../../../../core/utils/app_font_size.dart';
import '../widgets/service_card.dart';

class HomeScreenMoreThanDoctor extends StatelessWidget {
  const HomeScreenMoreThanDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const WelcomeHeader(),
                const SizedBox(height: 20),
                const CustomSearchBar(),
                const SizedBox(height: 20),
                const HospitalCard(),
                const SizedBox(height: 20),
                const Text(
                  'Upcoming Appointments',
                  style: TextStyle(
                      fontSize: AppFontSize.fontSize20,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 10),

                const AppointmentCard(),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Explore Our Doctors',
                      style: TextStyle(
                          fontSize: AppFontSize.fontSize20,
                          fontWeight: FontWeight.w500),
                    ),
                    TextButton(onPressed: () {}, child: const Text('View All'))
                  ],
                ),
                const SizedBox(height: 10),
                const DoctorCard(),
                const SizedBox(height: 10),
                const DoctorCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


