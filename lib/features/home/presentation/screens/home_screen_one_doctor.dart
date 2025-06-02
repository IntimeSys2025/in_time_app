import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_time_app/features/home/presentation/logic/home_cubit.dart';
import 'package:in_time_app/features/home/presentation/logic/home_states.dart';
import 'package:in_time_app/features/home/presentation/screens/service_details_screen.dart';
import 'package:in_time_app/features/home/presentation/widgets/appointmant_card.dart';
import 'package:in_time_app/features/home/presentation/widgets/custom_search_bar.dart';
import 'package:in_time_app/features/home/presentation/widgets/doctor_desc_card.dart';
import 'package:in_time_app/features/home/presentation/widgets/welcome_header.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/app_font_size.dart';
import '../widgets/service_card.dart';

class HomeScreenOneDoctor extends StatelessWidget {
  const HomeScreenOneDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    final homeCubit = BlocProvider.of<HomeCubit>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: BlocConsumer<HomeCubit, HomeState>(
              listener: (context, state) {
                if(state is GetSubServicesSuccessState){
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>  ServiceDetailsScreen(subServiceModel: state.subServiceModel ,),));

                }
              },
              buildWhen: (previous, current) => current is GetSlidersSuccessState,
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const WelcomeHeader(),
                    const SizedBox(height: 20),
                    const CustomSearchBar(),
                    const SizedBox(height: 20),
                    if(homeCubit.sliders.isNotEmpty)
                    DoctorDescCard(sliderModel: homeCubit.sliders.first),
                    const SizedBox(height: 20),
                    if (AppConstants.token != '' && AppConstants.isLoggedIn)
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
                        ],
                      ),
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
                        TextButton(
                            onPressed: () {}, child: const Text('View All'))
                      ],
                    ),
                    const SizedBox(height: 10),
                    Flexible(
                      // flex: 1,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: homeCubit.services.length,
                        itemBuilder: (context, index) {
                          final service = homeCubit.services[index];
                         return ServiceCard(service: service);
                      },),
                    ),
                    // const ServiceCard(),
                    // const SizedBox(height: 10),
                    // const ServiceCard(),
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
