import 'package:flutter/material.dart';
import 'package:in_time_app/core/helpers/extension.dart';
import 'package:in_time_app/core/shared_widgets/app_button_widget.dart';

import '../../../../core/shared_widgets/app_text_field.dart';
import '../../../../core/shared_widgets/password_text_field_widget.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Password'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            10.heightSpace,
            AppPasswordTextFieldWidget(
              controller: TextEditingController(),
              obscureText: true,
              suffixIcon: IconButton(onPressed: (){}, icon: const Icon(Icons.visibility_off)),
              title: 'Password',
            ),
            10.heightSpace,
            AppPasswordTextFieldWidget(
              controller: TextEditingController(),
              obscureText: true,
              suffixIcon: IconButton(onPressed: (){}, icon: const Icon(Icons.visibility_off)),
              title: 'New Password',
            ),
            10.heightSpace,
            AppPasswordTextFieldWidget(
              controller: TextEditingController(),
              obscureText: true,
              suffixIcon: IconButton(onPressed: (){}, icon: const Icon(Icons.visibility_off)),
              title: 'Confirm Password',
            )
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: AppButtonWidget(
            title: 'Update',
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
