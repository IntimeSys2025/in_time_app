import 'package:flutter/material.dart';
import 'package:in_time_app/core/helpers/extension.dart';
import 'package:in_time_app/core/utils/app_asset_path.dart';
import 'package:in_time_app/core/utils/app_colors.dart';

class WalletScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wallet'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          // Padding(
          //   padding: const EdgeInsets.all(16.0),
          //   child: Text(
          //     '9:41',
          //     style: TextStyle(fontSize: 16, color: Colors.grey),
          //   ),
          // ),
          Card(
            color: AppColors.kGreenBackground,
            child: ListTile(
              title: const Text(
                'Total Amount',
                style: TextStyle(fontWeight: FontWeight.bold,color: AppColors.white),
              ),
              isThreeLine: true,

              subtitle: const Text(
                '2500.00 EGP',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: AppColors.white),
              ),
              trailing: Image.asset(AppAsset.wallet,height: 100,fit: BoxFit.fitHeight,),
            ),
          ),
          10.heightSpace,
          Container(
            padding: const EdgeInsets.all(6.0),
            margin: const EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              color: AppColors.kLightGreen,
              borderRadius: BorderRadius.circular(10)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.green,
                    // primary: Color(0xFF4CAF50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text('Reserved',style: TextStyle(color: AppColors.white),),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    // primary: Colors.grey[300],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text('Refund'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    // primary: Colors.grey[300],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text('Penalties'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              children: const [
                ListTile(
                  title: Text('200.000 EGP'),
                  subtitle: Text('Reserved "Service 1" from...'),
                  trailing: Text('TUE 22 Jun 2025'),
                ),
                Divider(),
                ListTile(
                  title: Text('200.000 EGP'),
                  subtitle: Text('Reserved "Service 1" from...'),
                  trailing: Text('TUE 22 Jun 2025'),
                ),
                Divider(),
                ListTile(
                  title: Text('200.000 EGP'),
                  subtitle: Text('Reserved "Service 1" from...'),
                  trailing: Text('TUE 22 Jun 2025'),
                ),
                Divider(),
                ListTile(
                  title: Text('200.000 EGP'),
                  subtitle: Text('Reserved "Service 1" from...'),
                  trailing: Text('TUE 22 Jun 2025'),
                ),
                Divider(),
                ListTile(
                  title: Text('200.000 EGP'),
                  subtitle: Text('Reserved "Service 1" from...'),
                  trailing: Text('TUE 22 Jun 2025'),
                ),
                Divider(),
                ListTile(
                  title: Text('200.000 EGP'),
                  subtitle: Text('Reserved "Service 1" from...'),
                  trailing: Text('TUE 22 Jun 2025'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}