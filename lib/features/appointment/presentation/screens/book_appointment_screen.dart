import 'package:flutter/material.dart';

import '../../../home/data/models/sub_service_model.dart';

class CartScreen extends StatelessWidget {
  final SubServiceModel subServiceModel;
  CartScreen({super.key, required this.subServiceModel});

  final List<CartItem> cartItems = [
    CartItem(
      title: 'Achieve Your Goals',
      subtitle: 'Practical guidance from the Core curriculum to grow...',
      services: [
        'Individual Therapy',
        'Child & Adolescent Therapy',
      ],
      price: '\$200',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back),
        //   onPressed: () {},
        // ),
        title: const Text('Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                return CartItemWidget(item: cartItems[index]);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[700],
                    minimumSize: Size(double.infinity, 50),
                  ),
                  onPressed: () {},
                  child: Text('Book Appointment'),
                ),
                SizedBox(height: 10),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    side: BorderSide(color: Colors.green[700]!),
                  ),
                  onPressed: () {},
                  child: Text('Select Another Service',
                      style: TextStyle(color: Colors.green[700])),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CartItem {
  final String title;
  final String subtitle;
  final List<String> services;
  final String price;

  CartItem({
    required this.title,
    required this.subtitle,
    required this.services,
    required this.price,
  });
}

class CartItemWidget extends StatelessWidget {
  final CartItem item;

  CartItemWidget({required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 80,
              height: 80,
              color: Colors.grey[300],
              child: Center(child: Text('Image')),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    item.subtitle,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  SizedBox(height: 8),
                  ...item.services.map((service) => Row(
                        children: [
                          Icon(Icons.check, color: Colors.green, size: 16),
                          SizedBox(width: 4),
                          Text(service),
                        ],
                      )),
                  SizedBox(height: 8),
                  Text(
                    'Price: ${item.price}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
