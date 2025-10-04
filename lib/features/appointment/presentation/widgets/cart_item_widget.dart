import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_time_app/core/helpers/extension.dart';
import 'package:in_time_app/core/utils/app_font_size.dart';
import 'package:in_time_app/features/appointment/presentation/screens/book_appointment_screen.dart';
import '../../../../core/shared_widgets/app_button_widget.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../home/data/models/sub_service_model.dart';
import '../logic/appointment_cubit.dart';
import 'doctor_info_card.dart';

class CartItemWidget extends StatelessWidget {
  final bool showBookButton;
  final SubServiceModel item;
  final bool isCheckout;

  CartItemWidget(
      {required this.item,
      this.showBookButton = false,
      this.isCheckout = false});

  @override
  Widget build(BuildContext context) {
    final appointmentCubit = BlocProvider.of<AppointmentCubit>(context);
    return Card(
      color: AppColors.white,
      child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              if (isCheckout &&
                  item.selectedDate != null &&
                  item.selectedTimeFormat12Hours != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${DateFormat('MMMM d, yyyy').format(item.selectedDate!)} - ${item.selectedTimeFormat12Hours}',
                      style: const TextStyle(
                        fontSize: AppFontSize.fontSize16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.black,
                      ),
                    ),
                    Divider()
                  ],
                ),
              // ListTile(
              //   leading: Image.network(
              //     item.service.imageUrl,
              //     fit: BoxFit.cover,
              //     errorBuilder: (context, error, stackTrace) {
              //       return Container(
              //         color: AppColors.moreLightGrey.withOpacity(0.2),
              //         child: Center(
              //           child: Icon(Icons.error),
              //         ),
              //       );
              //     },
              //   ),
              //   title: Text(
              //     item.service.title,
              //     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              //   ),
              //   subtitle: Text(
              //     item.service.description,
              //     style: TextStyle(color: Colors.grey[600]),
              //   ),
              // ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    // color: Colors.grey[300],
                    child: Image.network(
                      item.service.imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: AppColors.moreLightGrey.withOpacity(0.2),
                          child: Center(
                            child: Icon(Icons.error),
                          ),
                        );
                      },
                    ),
                    // Center(child: Text('Image')),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              item.service.title,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                                onPressed: () {
                                  appointmentCubit.removeServiceFromCart(
                                      serviceId: item.service.id);
                                },
                                icon: Icon(
                                  Icons.delete_outlined,
                                  color: AppColors.kRed,
                                ))
                          ],
                        ),
                        SizedBox(height: 4),
                        Text(
                          item.service.description,
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                        SizedBox(height: 8),

                        // ...item.subServices.map((service) => Row(
                        //       children: [
                        //         Icon(Icons.check, color: Colors.green, size: 16),
                        //         SizedBox(width: 4),
                        //         Text(service.title),
                        //       ],
                        //     )),
                        // SizedBox(height: 8),
                        // Text(
                        //   'Price: ${item.}',
                        //   style: TextStyle(fontWeight: FontWeight.bold),
                        // ),
                      ],
                    ),
                  ),
                  // IconButton(
                  //   icon: const Icon(Icons.delete_outline,
                  //       size: 30, color: Colors.red),
                  //   onPressed: () {},
                  // ),
                ],
              ),
              ListView.builder(
                shrinkWrap: true,
                // physics: const NeverScrollableScrollPhysics(),
                itemCount: item.subServices.length,
                itemBuilder: (context, index) {
                  final subService = item.subServices[index];
                  return ListTile(
                    leading: Checkbox(
                      value: subService.isSelected,
                      onChanged: (bool? value) {
                        // subService.isSelected = value ?? false;
                      },
                      activeColor: Colors.green,
                    ),
                    title: Row(
                      children: [
                        Text(
                          subService.title,
                          style: const TextStyle(fontSize: 16),
                        ),
                        // ...[
                        // 10.widthSpace,
                        // if (subService.stateLabel != 'none')
                        //   Container(
                        //     padding: const EdgeInsets.symmetric(
                        //         horizontal: 8, vertical: 4),
                        //     decoration: BoxDecoration(
                        //       color: subService.stateLabel == 'new'
                        //           ? AppColors.kGreenButton
                        //           : AppColors.kRed,
                        //       borderRadius: BorderRadius.circular(12),
                        //     ),
                        //     child: Text(
                        //       subService.stateLabel,
                        //       style: const TextStyle(
                        //         color: Colors.white,
                        //         fontSize: 12,
                        //       ),
                        //     ),
                        //   ),
                        // ],
                      ],
                    ),
                    subtitle: Text(
                      "Price: ${subService.price.toStringAsFixed(0)} EGP",
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  );
                },
              ),
              // 10.heightSpace,
              // if(!isCheckout)
              const Column(
                children: [
                  Divider(),
                  DoctorInfoCard(),
                ],
              ),
              // 10.heightSpace,
              if ((!appointmentCubit.showDateSelector) &&
                  showBookButton &&
                  (item.selectedDate == null &&
                      item.selectedTimeFormat12Hours == null))
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: AppButtonWidget(
                      textColor: AppColors.kGreenButton,
                      backgroundColor: AppColors.kLightGreen,
                      height: 60,
                      title:
                          // showBookButton
                          //     ? 'Modify Appointment'
                          //     :
                          'Book Appointment',
                      onPressed: () {
                        appointmentCubit.setSelectedService(service: item);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const BookAppointmentScreen(),
                            ));

                        // if(showBookButton){
                        //   showBottomSheet(
                        //     context: context,
                        //     builder: (context) {
                        //       return const DateSelectionBottomSheet();
                        //     },
                        //   );
                        // }else{
                        //   appointmentCubit.toggleDateSelector();
                        // }
                      }),
                ),
            ],
          )),
    );
  }
}
