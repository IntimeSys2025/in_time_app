import 'package:flutter/material.dart';
import 'package:in_time_app/features/home/presentation/widgets/appointmant_card.dart';
import 'package:in_time_app/features/home/presentation/widgets/custom_search_bar.dart';
import 'package:in_time_app/features/home/presentation/widgets/doctor_desc_card.dart';
import 'package:in_time_app/features/home/presentation/widgets/welcome_header.dart';
import '../../../../core/utils/app_font_size.dart';
import '../widgets/service_card.dart';

class HomeScreenOneDoctor extends StatelessWidget {
  const HomeScreenOneDoctor({super.key});

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
                const DoctorDescCard(),
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
                      'Explore Our Services',
                      style: TextStyle(
                          fontSize: AppFontSize.fontSize20,
                          fontWeight: FontWeight.w500),
                    ),
                    TextButton(onPressed: () {}, child: const Text('View All'))
                  ],
                ),
                const SizedBox(height: 10),
                const ServiceCard(),
                const SizedBox(height: 10),
                const ServiceCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Center(
// child: TextButton(child: Text('Log out'),
// onPressed: (){
// // Clear the secure storage
// saveBoolValue(key: 'loggedIn', value: false);
// // Navigate to login screen
// Navigator.pushReplacement(
// context,
// MaterialPageRoute(
// builder: (context) => const LoginScreen(),
// ),
// );
// },),
// )
