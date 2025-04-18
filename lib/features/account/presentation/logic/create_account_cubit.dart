import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_time_app/features/account/data/models/arguments/login_params.dart';
import 'package:in_time_app/features/account/domain/use_cases/login_use_case.dart';
import 'package:in_time_app/features/account/domain/use_cases/register_use_case.dart';

import '../../data/models/arguments/register_params.dart';
part 'create_account_state.dart';

class CreateAccountCubit extends Cubit<CreateAccountState> {
  final RegisterUseCase _registerUseCase;
  final LoginUseCase _loginUseCase;
  CreateAccountCubit(this._registerUseCase, this._loginUseCase)
      : super(CreateAccountInitial());
  final phoneNumberFormKey = GlobalKey<FormState>();
  void register() async {
    if(phoneNumberFormKey.currentState!.validate()){
      emit(RegisterAccountLoadingState());
      final result = await _registerUseCase.call(
        const RegisterParams(
            firstName: 'asmaa',
            lastName: 'elbanna',
            mobile: '+201122833771',
            password: 'Rtr@12345678',
            passwordConfirmation: 'Rtr@12345678',
            dateBirth: '1993-07-25',
            gender: 'female'),
      );
      result.fold(
            (failure) {
          emit(RegisterAccountFailureState(errorMessage: failure.message));
        },
            (user) {
          emit(RegisterAccountSuccessState());
        },
      );
    }

  }

  void signIn() async {
    emit(SignInLoadingState());
    final result = await _loginUseCase.call(const LoginParams(phone: ''));
    result.fold(
      (failure) {
        emit(SignInFailureState(errorMessage: failure.message));
      },
      (success) {
        emit(SignInSuccessState());
      },
    );
  }
}
