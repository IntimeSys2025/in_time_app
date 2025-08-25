import 'package:flutter/material.dart';
import 'package:in_time_app/core/utils/app_colors.dart';

class PaymentSummaryWidget extends StatelessWidget {
  final double itemTotal;
  final double couponDiscount;
  final double amountPayable;

  const PaymentSummaryWidget({
    super.key,
    this.itemTotal = 160.00,
    this.couponDiscount = 0.00,
    this.amountPayable = 160.00,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Column(
        children: [
          _buildSummaryRow('Item Total', '\$${itemTotal.toStringAsFixed(2)}'),
          Divider(height: 1, color: Colors.grey[300]),
          _buildSummaryRow('Coupon Discount', '\$${couponDiscount.toStringAsFixed(2)}'),
          Divider(height: 1, color: Colors.grey[300]),
          _buildSummaryRow(
            'Amount Payable',
            '\$${itemTotal.toStringAsFixed(2)}',
            isBold: true,
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              color: isBold ? Colors.black87 : Colors.grey[700],
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              color: isBold ? Colors.black87 : Colors.grey[700],
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
