import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:in_time_app/core/helpers/extension.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../../core/shared_widgets/app_button_widget.dart';
import '../../../../core/shared_widgets/app_text_field.dart';
import '../../../../core/utils/app_colors.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Data'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: AppTextField(
                      obscureText: false,
                      labelText: 'First name',
                      hintText: 'Test',
                      controller: TextEditingController()),
                ),
                10.widthSpace,
                Expanded(
                  child: AppTextField(
                      obscureText: false,
                      labelText: 'Last name',
                      hintText: '',
                      controller: TextEditingController()),
                )
              ],
            ),
            20.heightSpace,
            Directionality(
              textDirection: TextDirection.ltr,
              child: IntlPhoneField(
                invalidNumberMessage: 'Invalid phone Number',
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
                initialCountryCode: 'EG',
                validator: (value) {
                  debugPrint('Val:: ${value?.completeNumber}');
                  return null;
                  // return createAccountCubit.validatePhoneNumber(value!);
                },
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                keyboardType: TextInputType.phone,
                // countries: ["SA"],
                onChanged: (phone) {
                  // cubit.loginPhone = phone;
                },
              ),
            ),
            AppTextField(
                hintText: 'Enter Your Title',
                controller: TextEditingController(),
                labelText: 'Title',
                obscureText: false),
            20.heightSpace,
            AppTextField(
                hintText: 'We are pleased to contact you...',
                controller: TextEditingController(),
                labelText: 'Description',

                minLines: 6,
                maxLines: 9,
                obscureText: false),

            20.heightSpace,
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: AppButtonWidget(
              title: 'Contact Us',
              backgroundColor: AppColors.green,
              onPressed: () {}),
        ),
      ),
    );
  }
}
