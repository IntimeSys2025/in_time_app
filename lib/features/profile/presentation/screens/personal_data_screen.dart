import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:in_time_app/core/helpers/extension.dart';
import 'package:in_time_app/core/shared_widgets/app_button_widget.dart';
import 'package:in_time_app/core/shared_widgets/app_text_button.dart';
import 'package:in_time_app/core/shared_widgets/app_text_field.dart';
import 'package:in_time_app/core/utils/app_colors.dart';
import 'package:in_time_app/core/utils/app_font_size.dart';
import 'package:in_time_app/features/profile/presentation/screens/change_password_screen.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../account/presentation/screens/reset_password_screen.dart';

class PersonalDataScreen extends StatelessWidget {
  const PersonalDataScreen({super.key});

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
            Center(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        'https://c8.alamy.com/comp/TC2FPE/young-man-avatar-cartoon-character-profile-picture-TC2FPE.jpg'), // Replace with your image asset
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    // margin: EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      color: AppColors.green,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.edit,
                      color: AppColors.white,
                      size: 16,
                    ),
                  ),
                ],
              ),
            ),
            20.heightSpace,
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
                )),
            Row(
              children: [
                Expanded(
                  child: AppTextField(
                      obscureText: true,
                      labelText: 'Password',
                      hintText: '',
                      controller: TextEditingController()),
                ),
                5.widthSpace,
                GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => ChangePasswordScreen(),
                    //     ));
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ResetPasswordScreen(),
                        ));
                  },
                  child: const Text(
                    'Change',
                    style: TextStyle(
                        color: AppColors.green,
                        fontSize: AppFontSize.fontSize16,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.green),
                  ),
                )
              ],
            ),
            20.heightSpace,

            /// Date of birth
            TextFormField(
              // controller: controller,
              // inputFormatters: ,
              onTap: () async {
                // if (isDatePicker) {
                final DateTime? date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1950),
                  lastDate: DateTime.now(),
                );
                // cubit.setDateOfBirth(date ?? DateTime.now());

                // }
              },
              // validator: isPassword ? validatePassword :(value) {
              //   if (isPassword) {
              //     debugPrint('ValPass:: ${validatePassword(value)}');
              //     return validatePassword(value);
              //   }else{
              //     if (value == null || value.isEmpty) {
              //       return hintText;
              //     }
              //     return null;
              //   }
              //
              // },
              obscureText: false,
              decoration: InputDecoration(
                labelText: 'Date of birth',
                hintText: 'Enter your Date Of Birth',
                suffixIcon: const Icon(Icons.calendar_today),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: AppButtonWidget(
              title: 'Save Changes',
              backgroundColor: AppColors.green,
              onPressed: () {}),
        ),
      ),
    );
  }
}
