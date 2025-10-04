import 'package:flutter/material.dart';
import 'package:in_time_app/core/helpers/extension.dart';
import 'package:in_time_app/core/shared_widgets/app_button_widget.dart';

import '../widgets/receipt_item.dart';

class PaymentDetailsScreen extends StatelessWidget {
  const PaymentDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Receipt'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.print),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Center(
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Color(0xFFE6F3E6),
                child: Icon(Icons.check_circle, color: Colors.green, size: 40),
              ),
            ),
            10.heightSpace,
            const Center(
              child: Text(
                'Booking Success!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            10.heightSpace,
            // const Divider(),[
            DashedLine(),
            10.heightSpace,

            ReceiptItem(label: 'Provider', value: 'Euphoria & Spa Beauty'),
            ReceiptItem(
                label: 'Address', value: '123 Main Street, Anytown, USA'),
            ReceiptItem(label: 'Name', value: 'Test Test'),
            ReceiptItem(label: 'Phone', value: '+20 (409) 587-1901'),
            ReceiptItem(label: 'Booking Date', value: 'December 15, 204'),
            ReceiptItem(label: 'Booking Hours', value: '10.30 AM'),
            ReceiptItem(label: 'Specialist', value: 'Ali Ahmed'),
            ReceiptItem(label: 'Service', value: 'Achieve Your Goals'),
            const Divider(),
            ReceiptItem(
              label: 'Total',
              value: '\$152.70',
              isTotal: true,
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: AppButtonWidget(title: 'Download PDF', onPressed: () {}),
      )),
    );
  }
}

class DashedLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DashedLinePainter(),
      child: Container(height: 1), // Adjust height as needed
    );
  }
}

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey[300]!
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    const dashWidth = 5;
    const dashSpace = 5;
    double startX = 0;
    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, 0),
        Offset(startX + dashWidth, 0),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}