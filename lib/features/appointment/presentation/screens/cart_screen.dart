import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_time_app/core/shared_widgets/app_button_widget.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/product_type.dart';
import '../../../home/presentation/screens/home_screen_one_doctor.dart';
import '../../../home/presentation/screens/navigation_screen.dart';
import '../logic/appointment_cubit.dart';
import '../widgets/cart_item_widget.dart';

class CartScreen extends StatelessWidget {
  final bool isCheckout;
  const CartScreen({super.key, this.isCheckout = false});

  @override
  Widget build(BuildContext context) {
    final appointmentCubit = BlocProvider.of<AppointmentCubit>(context);

    return BlocBuilder<AppointmentCubit, AppointmentState>(
      buildWhen: (previous, current) => current is RefreshCartScreenState,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Cart'),
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          (AppConstants.productType == ProductType.oneDoctor)
                              ? const NavigationBarScreen()
                              : const HomeScreenOneDoctor(),
                    ));
              },
            ),
          ),
          body: SafeArea(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: appointmentCubit.subServicesBooked.length ?? 0,
              itemBuilder: (context, index) {
                final subServiceModel =
                    appointmentCubit.subServicesBooked[index];
                return CartItemWidget(
                  item: subServiceModel,
                  showBookButton: true,
                  isCheckout: isCheckout,
                );
              },
            ),
          ),
          bottomNavigationBar: SafeArea(
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child:
                      // AppButtonWidget(title: 'Checkout', onPressed: () {}),
                      isCheckout
                          ? AppButtonWidget(
                              height: 60, title: 'Checkout', onPressed: () {})
                          : AppButtonWidget(
                              height: 60,
                              title: 'Select Another Service',
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          (AppConstants.productType ==
                                                  ProductType.oneDoctor)
                                              ? const NavigationBarScreen()
                                              : const HomeScreenOneDoctor(),
                                    ));
                              }))),
        );
      },
    );
  }
}
