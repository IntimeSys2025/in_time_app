// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:in_time_app/core/helpers/extension.dart';
// import 'package:in_time_app/features/home/data/models/partner_model.dart';
// import 'package:in_time_app/features/home/data/models/slider_model.dart';
// import 'package:in_time_app/features/home/presentation/logic/home_cubit.dart';
// import 'package:in_time_app/features/home/presentation/logic/home_states.dart';
// import 'package:in_time_app/features/home/presentation/screens/service_details_screen.dart';
// import 'package:in_time_app/features/home/presentation/widgets/appointmant_card.dart';
// import 'package:in_time_app/features/home/presentation/widgets/custom_search_bar.dart';
// import 'package:in_time_app/features/home/presentation/widgets/doctor_desc_card.dart';
// import 'package:in_time_app/features/home/presentation/widgets/welcome_header.dart';
// import '../../../../core/utils/app_colors.dart';
// import '../../../../core/utils/app_constants.dart';
// import '../../../../core/utils/app_font_size.dart';
// import '../widgets/service_card.dart';
//
// class HomeScreenOneDoctor extends StatelessWidget {
//   // final PartnerModel? partner;
//   const HomeScreenOneDoctor({super.key,});
//
//   @override
//   Widget build(BuildContext context) {
//     final homeCubit = BlocProvider.of<HomeCubit>(context);
//     // SliderModel? slider;
//     // if (partner != null) {
//     //   slider = SliderModel(
//     //       title: partner!.name,
//     //       text: partner!.specialty,
//     //       isButton: 0,
//     //       buttonText: '',
//     //       buttonLink: '',
//     //       media: partner!.media);
//     // }else if (homeCubit.sliders.isNotEmpty){
//     //   slider = homeCubit.sliders[1];
//     // }
//     return BlocConsumer<HomeCubit, HomeState>(
//       listener: (context, state) {
//         if (state is GetSubServicesSuccessState) {
//           // Navigator.push(
//           //     context,
//           //     MaterialPageRoute(
//           //       builder: (context) => ServiceDetailsScreen(
//           //         subServiceModel: state.subServiceModel,
//           //       ),
//           //     ));
//         }
//       },
//       buildWhen: (previous, current) =>
//           current is GetSlidersSuccessState ||
//           current is GetServicesSuccessState ||
//           current is GetHomeDataLoadingState ||
//           current is ToggleViewAllServices ||
//           current is FilterServices,
//       builder: (context, state) {
//         return Scaffold(
//           // backgroundColor: AppColors.white,
//           appBar: AppBar(
//             backgroundColor: AppColors.moreLightGrey,
//             elevation: 0,
//             toolbarHeight: 0,
//           ),
//           body: SafeArea(
//             child: state is GetHomeDataLoadingState
//                 ? const Center(
//                     child: CupertinoActivityIndicator(),
//                   )
//                 : SingleChildScrollView(
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 24.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           const WelcomeHeader(),
//                           20.heightSpace,
//                            CustomSearchBar(
//                             controller: homeCubit.searchController,
//                              onPressed: (value) {
//                                homeCubit.filterServices();
//                              },
//                              hintText: 'Find a service',
//
//                           ),
//                           50.heightSpace,
//                           if(homeCubit.sliders.isNotEmpty)
//                           DoctorDescCard(sliderModel: homeCubit.sliders[0]),
//                           const SizedBox(height: 20),
//                           if (AppConstants.userToken != '' )
//                             const Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   'Upcoming Appointments',
//                                   style: TextStyle(
//                                       fontSize: AppFontSize.fontSize16,
//                                       fontWeight: FontWeight.w600),
//                                 ),
//                                 SizedBox(height: 10),
//                                 AppointmentCard(),
//                               ],
//                             ),
//                           const SizedBox(height: 20),
//                           if (homeCubit.filteredServices.isNotEmpty)
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 const Text(
//                                   'Explore Our Services',
//                                   style: TextStyle(
//                                       fontSize: AppFontSize.fontSize16,
//                                       fontWeight: FontWeight.w600),
//                                 ),
//                                 TextButton(
//                                     onPressed: () {
//                                       homeCubit.toggleViewAllServices();
//                                       homeCubit.scrollToEnd(offset: homeCubit.scrollController.position.maxScrollExtent);
//                                     },
//                                     child: const Text('View All',style: TextStyle(
//                                       decoration: TextDecoration.underline
//                                     ),))
//                               ],
//                             ),
//                           if (homeCubit.filteredServices.isNotEmpty)
//                             10.heightSpace,
//                           if (homeCubit.filteredServices.isNotEmpty)
//                             Flexible(
//                               // flex: 1,
//                               child: ListView.builder(
//                                 controller: homeCubit.scrollController,
//
//                                 shrinkWrap: true,
//                                 // physics: const NeverScrollableScrollPhysics(),
//                                 scrollDirection: Axis.vertical,
//                                 itemCount: homeCubit.isViewAllServices
//                                     ? homeCubit.filteredServices.length
//                                     : 1,
//                                 itemBuilder: (context, index) {
//                                   final service =
//                                       homeCubit.filteredServices[index];
//                                   return ServiceCard(service: service);
//                                 },
//                               ),
//                             ),
//                           if (homeCubit.filteredServices.isEmpty)
//                             const Center(
//                               child: Text(
//                                 'No Services Available',
//                                 style:
//                                     TextStyle(fontSize: AppFontSize.fontSize16),
//                               ),
//                             ),
//                           // const ServiceCard(),
//                           // const SizedBox(height: 10),
//                           // const ServiceCard(),
//                         ],
//                       ),
//                     ),
//                   ),
//           ),
//         );
//       },
//     );
//   }
// }
//
// // Center(
// // child: TextButton(child: Text('Log out'),
// // onPressed: (){
// // // Clear the secure storage
// // saveBoolValue(key: 'loggedIn', value: false);
// // // Navigate to login screen
// // Navigator.pushReplacement(
// // context,
// // MaterialPageRoute(
// // builder: (context) => const LoginScreen(),
// // ),
// // );
// // },),
// // )
