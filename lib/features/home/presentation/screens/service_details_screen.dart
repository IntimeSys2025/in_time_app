import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_time_app/core/helpers/extension.dart';
import 'package:in_time_app/core/shared_widgets/app_button_widget.dart';
import 'package:in_time_app/features/appointment/presentation/screens/cart_screen.dart';
import 'package:in_time_app/features/home/data/models/sub_service_model.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../appointment/presentation/logic/appointment_cubit.dart';

class ServiceDetailsScreen extends StatefulWidget {
  final SubServiceModel subServiceModel;
  const ServiceDetailsScreen({super.key, required this.subServiceModel});

  @override
  State<ServiceDetailsScreen> createState() => _ServiceDetailsScreenState();
}

class _ServiceDetailsScreenState extends State<ServiceDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final appointmentCubit = BlocProvider.of<AppointmentCubit>(context);
    debugPrint(
        'ServiceDetailsScreen: ${widget.subServiceModel.subServices.length}');
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(widget.subServiceModel.service.title),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back),
        //   onPressed: () {
        //     Navigator.push(
        //         context,
        //         MaterialPageRoute(
        //           builder: (context) =>
        //               (AppConstants.productType == ProductType.oneDoctor)
        //                   ? const NavigationBarScreen()
        //                   : const HomeScreenOneDoctor(),
        //         ));
        //   },
        // ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Image
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  widget.subServiceModel.service.imageUrl,
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 100,
                      width: double.infinity,
                      color: Colors.grey.shade300,
                      child: const Center(
                        child: Text(
                          "Image not available",
                          style: TextStyle(color: Colors.black54),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),

              // Title and Rating
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.subServiceModel.service.title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Row(
                    children: List.generate(
                      5,
                      (index) => Icon(
                        Icons.star,
                        color: index < 4 ? Colors.amber : Colors.grey.shade300,
                        size: 18,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // Description
              Text(
                widget.subServiceModel.service.description,
                style: TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 16),
              if (widget.subServiceModel.subServices.isNotEmpty)
                const Text(
                  "Select Sub-Service",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              const SizedBox(height: 12),

              // Sub-Services List
              Expanded(
                child: (widget.subServiceModel.subServices.isEmpty)
                    ? const Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "There're no sub services",
                          )
                        ],
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        // physics: const NeverScrollableScrollPhysics(),
                        itemCount: widget.subServiceModel.subServices.length,
                        itemBuilder: (context, index) {
                          final subService =
                              widget.subServiceModel.subServices[index];
                          return ListTile(
                            leading: Checkbox(
                              value: subService.isSelected,
                              onChanged: (bool? value) {
                                setState(() {
                                  subService.isSelected = value ?? false;
                                });
                                if (subService.isSelected) {
                                  appointmentCubit.addSubServiceBooked(
                                    subService: SubServiceModel(
                                        service: widget.subServiceModel.service,
                                        subServices: [
                                          widget.subServiceModel
                                              .subServices[index]
                                        ]),
                                  );
                                } else {
                                  appointmentCubit.removeSubServiceBooked(
                                    serviceId:
                                        widget.subServiceModel.service.id,
                                    subServiceId: subService.id,
                                  );
                                }
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
                                20.widthSpace,
                                if (subService.stateLabel != 'none' && subService.stateLabel != '' )
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: subService.stateLabel == 'new'
                                          ? AppColors.tagGreen
                                          : (subService.stateLabel ==
                                                  'best seller')
                                              ? AppColors.tagYellow
                                              : AppColors.tagRed,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                        '${subService.stateLabel[0].toUpperCase()}${subService.stateLabel.substring(1)}',
                                      // subService.stateLabel,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                // ],
                              ],
                            ),
                            subtitle: Text(
                              "Price: ${subService.price.toStringAsFixed(0)} EGP",
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.grey),
                            ),
                          );
                        },
                      ),
              ),
              // if(widget.subServiceModel.subServices.isNotEmpty)
              AppButtonWidget(
                height: 50,
                title: 'Add To Cart',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CartScreen(
                            // subServiceModel: widget.subServiceModel,
                            ),
                      ));
                },
                // backgroundColor: AppColors.kGreenBackground,
                textColor: AppColors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
