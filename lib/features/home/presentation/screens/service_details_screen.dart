import 'package:flutter/material.dart';
import 'package:in_time_app/core/shared_widgets/app_button_widget.dart';
import 'package:in_time_app/features/home/data/models/sub_service_model.dart';
import '../../../../core/utils/app_colors.dart';

class ServiceDetailsScreen extends StatefulWidget {
  final SubServiceModel subServiceModel;
  const ServiceDetailsScreen({super.key, required this.subServiceModel});

  @override
  State<ServiceDetailsScreen> createState() => _ServiceDetailsScreenState();
}

class _ServiceDetailsScreenState extends State<ServiceDetailsScreen> {
  final Map<String, bool> _selectedServices = {
    "Individual Therapy": true,
    "Couples or Relationship Counseling": false,
    "Child & Adolescent Therapy": true,
    "Family Therapy": false,
    "Specialized Therapy": false,
  };

  final Map<String, String> _prices = {
    "Individual Therapy": "200\$",
    "Couples or Relationship Counseling": "200\$",
    "Child & Adolescent Therapy": "200\$",
    "Family Therapy": "200\$",
    "Specialized Therapy": "200\$",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Service Title'),
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
                child: Image.asset(
                  'assets/images/service_details.jpg',
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
                  const Text(
                    'Achieve Your Goals',
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
              const Text(
                "Practical guidance from the ‘Core’ curriculum to grow Practical guidance from the ‘Core’ curriculum to grow Practical guidance from the ‘Core’ curriculum to grow",
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
                child: ListView(
                  children: _selectedServices.keys.map((title) {
                    return CheckboxListTile(
                      value: _selectedServices[title],
                      onChanged: (val) {
                        setState(() {
                          _selectedServices[title] = val!;
                        });
                      },
                      title: Text(title),
                      subtitle: Text("Price: ${_prices[title]}"),
                      activeColor: Colors.green,
                      controlAffinity: ListTileControlAffinity.leading,
                    );
                  }).toList(),
                ),
              ),

              // Book Appointment Button

              AppButtonWidget(
                height: 50,

                title: 'Book Appointment',
                onPressed: () {},
                backgroundColor: AppColors.kGreenBackground,
                textColor: AppColors.white,
              )
              // SizedBox(
              //   width: double.infinity,
              //   child: ElevatedButton(
              //     onPressed: () {},
              //     style: ElevatedButton.styleFrom(
              //       backgroundColor: AppColors.kGreenBackground,
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(8),
              //       ),
              //       padding: const EdgeInsets.symmetric(vertical: 16),
              //     ),
              //     child: const Text(
              //       "Book Appointment",
              //       style: TextStyle(fontSize: 16,
              //       color: AppColors.white),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
