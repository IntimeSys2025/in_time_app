import 'package:flutter/material.dart';
import 'package:in_time_app/core/helpers/extension.dart';
import 'package:in_time_app/core/shared_widgets/app_button_widget.dart';
import 'package:in_time_app/features/appointment/presentation/screens/book_appointment_screen.dart';
import 'package:in_time_app/features/home/data/models/sub_service_model.dart';
import '../../../../core/utils/app_colors.dart';

class ServiceDetailsScreen extends StatefulWidget {
  final SubServiceModel subServiceModel;
  const ServiceDetailsScreen({super.key, required this.subServiceModel});

  @override
  State<ServiceDetailsScreen> createState() => _ServiceDetailsScreenState();
}

class _ServiceDetailsScreenState extends State<ServiceDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    debugPrint(
        'ServiceDetailsScreen: ${widget.subServiceModel.subServices.length}');
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.subServiceModel.service.title),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
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

              const Text(
                "Select Sub-Service",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),

              // Sub-Services List
              Expanded(
                child: (widget.subServiceModel.subServices.isEmpty)
                    ? Row(
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
                                10.widthSpace,
                                if (subService.stateLabel != 'none')
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: subService.stateLabel == 'new'
                                          ? AppColors.kGreenButton
                                          : AppColors.kRed,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Text(
                                      subService.stateLabel,
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

              AppButtonWidget(
                height: 50,
                title: 'Add To Cart',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CartScreen(subServiceModel: widget.subServiceModel,),
                      ));
                },
                backgroundColor: AppColors.kGreenBackground,
                textColor: AppColors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
