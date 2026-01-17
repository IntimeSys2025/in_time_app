import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_time_app/core/helpers/extension.dart';
import 'package:in_time_app/features/home/presentation/logic/home_states.dart';
import 'package:in_time_app/features/home/presentation/screens/partner_details_screen.dart';
import 'package:in_time_app/features/home/presentation/widgets/appointmant_card.dart';
import 'package:in_time_app/features/home/presentation/widgets/custom_search_bar.dart';
import 'package:in_time_app/features/home/presentation/widgets/doctor_card.dart';
import 'package:in_time_app/features/home/presentation/widgets/hospital_card.dart';
import 'package:in_time_app/features/home/presentation/widgets/welcome_header.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/app_font_size.dart';
import '../logic/home_cubit.dart';
import 'home_screen_one_doctor.dart';

class HomeScreenMoreThanDoctor extends StatelessWidget {
  const HomeScreenMoreThanDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    final homeCubit = BlocProvider.of<HomeCubit>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.moreLightGrey,
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: BlocConsumer<HomeCubit,HomeState>(
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
            builder: (context, state) {
              if(state is GetPartnerLoadingState){
                return const Align(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(),
                );
              }else if(state is GetPartnerFailureState){
                return const Center(
                  child: Text('Something went wrong, Please try again!'),
                );

              }else{
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const WelcomeHeader(),
                      // const SizedBox(height: 20),
                      // const CustomSearchBar(),
                      20.heightSpace,
                      const HospitalCard(),
                      20.heightSpace,
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
                      if(homeCubit.partners.isNotEmpty && homeCubit.partners.length >1)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Explore Our Doctors',
                            style: TextStyle(
                                fontSize: AppFontSize.fontSize20,
                                fontWeight: FontWeight.w700),
                          ),
                          TextButton(
                              onPressed: () {},
                              child: const Text(
                                'View All',
                                style: TextStyle(
                                    decoration: TextDecoration.underline),
                              ))
                        ],
                      ),
                      // 6.heightSpace,
                      if (homeCubit.partners.isNotEmpty)
                        Flexible(
                          // flex: 1,
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            // itemCount: homeCubit.isViewAllServices ? homeCubit.filteredItems.length: 1,
                            itemCount: homeCubit.partners.length,
                            itemBuilder: (context, index) {
                              final partner = homeCubit.partners[index];
                              return DoctorCard(
                                // onTap:  () {
                                //   Navigator.push(
                                //       context,
                                //       MaterialPageRoute(
                                //         builder: (context) => HomeScreenOneDoctor(partner: partner,),
                                //       ));
                                // },
                                partner: partner,
                              );
                            },
                          ),
                        ),
                      if (homeCubit.partners.isEmpty)
                        const Center(
                          child: Text('There are no partners!'),
                        )
                    ],
                  ),
                );
              }

            },

          ),
        ),
      ),
    );
  }
}
