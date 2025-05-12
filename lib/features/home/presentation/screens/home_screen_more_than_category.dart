import 'package:flutter/material.dart';
import 'package:in_time_app/features/home/presentation/widgets/appointmant_card.dart';
import 'package:in_time_app/features/home/presentation/widgets/custom_search_bar.dart';
import 'package:in_time_app/features/home/presentation/widgets/hospital_card.dart';
import 'package:in_time_app/features/home/presentation/widgets/welcome_header.dart';
import '../../../../core/utils/app_font_size.dart';
import '../widgets/category_widget.dart';
import '../widgets/service_card.dart';

class HomeScreenMoreThanCategory extends StatelessWidget {
  const HomeScreenMoreThanCategory({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {'icon': Icons.local_hospital, 'label': 'Clinics'},
      {'icon': Icons.medical_services, 'label': 'Labs'},
      {'icon': Icons.local_pharmacy, 'label': 'Pharmacy'},
      {'icon': Icons.healing, 'label': 'Therapy'},
      {'icon': Icons.pregnant_woman, 'label': 'Maternity'},
      {'icon': Icons.health_and_safety, 'label': 'Wellness'},
    ];
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
                SizedBox(
                  height: 300,
                  child: GridView.count(
                    crossAxisCount: 3, // 3 columns
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    // childAspectRatio: 1.1,
                    children: [
                      CategoryCard(
                        icon: categories.first['icon'],
                        label: categories.first['label'],
                        isSelected: true,
                      ),
                      ... categories.map((item) {
                        return CategoryCard(
                          icon: item['icon'],
                          label: item['label'],
                        );
                      }).toList(),
                    ],


                  ),
                ),

                // const HospitalCard(),
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


