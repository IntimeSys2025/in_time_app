import 'package:flutter/material.dart';
import 'package:in_time_app/core/shared_widgets/app_button_widget.dart';
import 'package:in_time_app/features/home/data/models/event_model.dart';
import '../../../../core/utils/app_colors.dart';

class EventBookingCard extends StatelessWidget {
  final EventModel event;
  const EventBookingCard({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.yellow, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Date & Time header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.amber.shade50,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child:  Text(
              // 'March 13, 2024 - 10:00 AM',
              '${event.date} - ${event.startTime}',
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black87,
                fontSize: 15,
              ),
            ),
          ),

          // Main content
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image + Title + Location row
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image container
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        width: 100,
                        height: 100,
                        color: Colors.grey.shade200,
                        child: Image.network(
                          event.image ?? '',
                          // 'https://images.unsplash.com/photo-1556911220-b0b895fafb40?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(
                            Icons.image,
                            size: 50,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),

                    // Title & location
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Text(
                            event.title ?? '',
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              height: 1.3,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Icon(Icons.location_on,
                                  size: 16, color: Colors.red),
                              const SizedBox(width: 4),
                              Text(
                                event.briefAddress ?? '',
                                style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 12),
                           Row(
                            children: [
                              const Icon(
                                Icons.circle,
                                color: AppColors.kGreenButton,
                                size: 16,
                              ),
                              SizedBox(width: 4),
                              Text(
                               event.locationType ?? '',
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  // fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                           Text(
                            event.description ?? '',
                            style: const TextStyle(
                                // fontSize: 17,
                                // fontWeight: FontWeight.bold,
                                // height: 1.3,
                                ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          // Container(
                          //   padding: const EdgeInsets.symmetric(
                          //       horizontal: 8, vertical: 4),
                          //   decoration: BoxDecoration(
                          //     color: Colors.green.shade100,
                          //     borderRadius: BorderRadius.circular(12),
                          //   ),
                          //   child: const Text(
                          //     'Online',
                          //     style: TextStyle(
                          //       color: Colors.green,
                          //       fontSize: 12,
                          //       fontWeight: FontWeight.w600,
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Details
                _buildDetailRow(
                  icon: Icons.person,
                  text: 'Type: ${event.eventType}',
                  color: Colors.green,
                ),
                const SizedBox(height: 12),
                _buildDetailRow(
                  icon: Icons.attach_money,
                  text: 'Price: ${event.price} EGP',
                  color: Colors.green,
                ),

                const SizedBox(height: 20),

                // Book button
                AppButtonWidget(title: 'Book Event', onPressed: () {},
                backgroundColor: AppColors.kLightGreen,
                textColor: AppColors.kGreenButton,),
                // SizedBox(
                //   width: double.infinity,
                //   height: 52,
                //   child: ElevatedButton(
                //     onPressed: () {
                //       // Book event action
                //     },
                //     style: ElevatedButton.styleFrom(
                //       backgroundColor: Colors.green.shade700,
                //       foregroundColor: Colors.white,
                //       elevation: 0,
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(12),
                //       ),
                //     ),
                //     child: const Text(
                //       'Book Event',
                //       style: TextStyle(
                //         fontSize: 16,
                //         fontWeight: FontWeight.bold,
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow({
    required IconData icon,
    required String text,
    required Color color,
  }) {
    return Row(
      children: [
        Icon(
          icon,
          size: 18,
          color: color,
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
