import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'profile_states.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(InitialProfileState());



bool rememberPass = false;
bool faceId = false;
bool biometric = false;


  void toggleSwitch(String key, bool value) {
    // final updatedState = Map<String, bool>.from(state);
    // updatedState[key] = value;
    if(key == 'rememberPassword'){
      rememberPass = value;
      // return;
    }else if(key == 'faceId'){
      faceId = value;
      // return;
    }else if(key == 'biometricId'){
      biometric = value;
      // return;
    }
    emit(InitialProfileState());
    emit(UpdateSecurityKey());
  }
}