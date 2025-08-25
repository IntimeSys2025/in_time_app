import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_time_app/core/helpers/extension.dart';
import 'package:in_time_app/core/shared_widgets/app_button_widget.dart';
import 'package:in_time_app/core/utils/app_colors.dart';
import 'package:in_time_app/features/appointment/presentation/logic/appointment_cubit.dart';
import 'package:in_time_app/features/appointment/presentation/screens/cart_screen.dart';
import 'package:in_time_app/features/appointment/presentation/widgets/payment_summary_widget.dart';
import 'package:in_time_app/features/home/presentation/screens/home_screen_one_doctor.dart';

import '../../../home/data/models/sub_service_model.dart';
import '../../../home/presentation/screens/navigation_screen.dart';
import '../widgets/cart_item_widget.dart';
import '../widgets/date_selection_bottom_sheet.dart';
import '../widgets/date_selection_widget.dart';

class BookAppointmentScreen extends StatelessWidget {
  // final SubServiceModel subServiceModel;
  const BookAppointmentScreen({
    super.key,
    // required this.subServiceModel
  });

  // final List<CartItem> cartItems = [
  //   CartItem(
  //     title: 'Achieve Your Goals',
  //     subtitle: 'Practical guidance from the Core curriculum to grow...',
  //     services: [
  //       'Individual Therapy',
  //       'Child & Adolescent Therapy',
  //     ],
  //     price: '\$200',
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
    final appointmentCubit = BlocProvider.of<AppointmentCubit>(context);
    return BlocBuilder<AppointmentCubit, AppointmentState>(
      buildWhen: (previous, current) => current is ShowDateSelectorStates ||
      current is ConfirmDateAndTimeSuccessState
      ,
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Color(0xFFF2F2F5),
          appBar: AppBar(
            // backgroundColor: Color(0xFFF2F2F5),
            centerTitle: true,
            // leading: IconButton(
            //   icon: Icon(Icons.arrow_back),
            //   onPressed: () {},
            // ),
            title: const Text('Book Appointment'),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CartItemWidget(
                    item: appointmentCubit.selectedService!,
                    showBookButton: false,
                  ),
                  // ListView.builder(
                  //   shrinkWrap: true,
                  //   itemCount: appointmentCubit.subServicesBooked.length ?? 0,
                  //   itemBuilder: (context, index) {
                  //     final subServiceModel =
                  //         appointmentCubit.subServicesBooked[index];
                  //     return CartItemWidget(
                  //       item: subServiceModel,
                  //       showBookButton: false,
                  //     );
                  //   },
                  // ),
                  10.heightSpace,
                  Column(
                    children: [
                      // if (appointmentCubit.showDateSelector)
                      DateTimeSelectorWidget(),
                      10.heightSpace,
                      // if (appointmentCubit.showDateSelector)
                      PaymentSummaryWidget(
                        itemTotal: appointmentCubit.totalPrice,
                      ),

                    ],
                  ),
                  10.heightSpace,
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: (appointmentCubit.selectedService != null &&
                            appointmentCubit.selectedService!.selectedDate !=
                                null)
                            ? AppButtonWidget(
                            height: 60,
                            title: 'Go To Cart',
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CartScreen(isCheckout: true,),
                                  ));
                            })
                            :
                        // (appointmentCubit.showDateSelector )
                        //         ?
                        AppButtonWidget(
                          title: 'Checkout',
                          onPressed: () {},
                          backgroundColor:
                          AppColors.kGreenButton.withOpacity(0.8),
                        )
                    ),
                  )
                ],
              ),
            ),
          ),
          // bottomNavigationBar:
          // // (appointmentCubit.showBottomSheet)
          // //     ? null
          // //     :
          // SafeArea(
          //         child: Padding(
          //             padding: const EdgeInsets.symmetric(
          //                 horizontal: 10, vertical: 5),
          //             child: (appointmentCubit.selectedService != null &&
          //                     appointmentCubit.selectedService!.selectedDate !=
          //                         null)
          //                 ? AppButtonWidget(
          //                     height: 60,
          //                     title: 'Go To Cart',
          //                     onPressed: () {
          //                       Navigator.push(
          //                           context,
          //                           MaterialPageRoute(
          //                             builder: (context) => CartScreen(),
          //                           ));
          //                     })
          //                 :
          //                 // (appointmentCubit.showDateSelector )
          //                 //         ?
          //                 AppButtonWidget(
          //                     title: 'Checkout',
          //                     onPressed: () {},
          //                     backgroundColor:
          //                         AppColors.kGreenButton.withOpacity(0.8),
          //                   )
          //             ),
          //       ),
        );
      },
    );
  }
}
