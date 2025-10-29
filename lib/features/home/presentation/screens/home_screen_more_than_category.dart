import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_time_app/core/utils/app_colors.dart';
import 'package:in_time_app/features/home/presentation/logic/home_cubit.dart';
import 'package:in_time_app/features/home/presentation/logic/home_states.dart';
import 'package:in_time_app/features/home/presentation/screens/partner_details_screen.dart';
import 'package:in_time_app/features/home/presentation/widgets/appointmant_card.dart';
import 'package:in_time_app/features/home/presentation/widgets/custom_search_bar.dart';
import 'package:in_time_app/features/home/presentation/widgets/welcome_header.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/app_font_size.dart';
import '../widgets/category_widget.dart';
import '../widgets/doctor_card.dart';
import '../widgets/service_card.dart';
import 'home_screen_one_doctor.dart';

class HomeScreenMoreThanCategory extends StatelessWidget {
  const HomeScreenMoreThanCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final homeCubit = BlocProvider.of<HomeCubit>(context);
    List<Map<String, dynamic>> categories = [
      {'icon': Icons.local_hospital, 'label': 'Clinics'},
      {'icon': Icons.medical_services, 'label': 'Labs'},
      {'icon': Icons.local_pharmacy, 'label': 'Pharmacy'},
      {'icon': Icons.healing, 'label': 'Therapy'},
      {'icon': Icons.pregnant_woman, 'label': 'Maternity'},
      {'icon': Icons.health_and_safety, 'label': 'Wellness'},
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.moreLightGrey,
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 6),
            child: BlocConsumer<HomeCubit, HomeState>(
              listener: (context, state) {
                if (state is GetPartnerDetailsSuccessState) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PartnerDetailsScreen(
                          partnerDetails: state.partnerDetails,
                          // partner: partner,
                        ),
                      ));
                }
              },
              buildWhen: (previous, current) =>
                  current is GetCategoriesSuccessState,
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const WelcomeHeader(),
                    const SizedBox(height: 20),
                    // const CustomSearchBar(),
                    // const SizedBox(height: 20),
                    GridView.builder(
                      shrinkWrap: true,
                      itemCount: homeCubit.categories.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                               crossAxisCount: 3,
                              childAspectRatio:1,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10),
                      itemBuilder: (context, index) {
                        final item = homeCubit.categories[index];
                        return CategoryCard(
                          isSelected: homeCubit.selectedCategoryIndex == index,
                          imageUrl: item.imageUrl,
                          label: item.name,
                          onPressed: () {
                            homeCubit.changeCategory(index);
                          },
                        );
                      },
                    ),

                    // const HospitalCard(),
                    const SizedBox(height: 20),
                    if (AppConstants.userToken != '' && AppConstants.isLoggedIn)
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Upcoming Appointments',
                            style: TextStyle(
                                fontSize: AppFontSize.fontSize20,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 10),
                          AppointmentCard(),
                          SizedBox(height: 20),
                        ],
                      ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Explore Our Doctors',
                          style: TextStyle(
                              fontSize: AppFontSize.fontSize20,
                              fontWeight: FontWeight.w500),
                        ),
                        TextButton(
                            onPressed: () {}, child: const Text('View All'))
                      ],
                    ),
                    const SizedBox(height: 10),
                    if(homeCubit.partners.isNotEmpty)
                    Flexible(
                      // height: 1000,
                      // flex: 1,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        // itemCount: 3,
                        itemCount: homeCubit.partners.length,
                        itemBuilder: (context, index) {
                          final partner = homeCubit.partners[index];
                          return DoctorCard(partner: partner,
                          // onTap:  () {
                          //   homeCubit.getPartnerDetails(partnerId: partner.id.toString());
                          //   // Navigator.push(
                          //   //     context,
                          //   //     MaterialPageRoute(
                          //   //       builder: (context) => HomeScreenOneDoctor(partner: partner,),
                          //   //     ));
                          // },
                          );
                        },
                      ),
                    ),
                    if(homeCubit.partners.isEmpty)
                      const Center(
                        child: Text(
                          'No Doctors Available',
                          style: TextStyle(fontSize: AppFontSize.fontSize16),
                        ),
                      ),

                    // const DoctorCard(),
                    // const SizedBox(height: 10),
                    // const DoctorCard(),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
