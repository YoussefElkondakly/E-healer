import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:new_windows/DataLayer/Models/Register/UpdateProfile.dart';

import '../../DataLayer/Repository/updateProfile_repo.dart';
import '../../DataLayer/WebServer/UpdateProfile_API.dart';

part 'updateprofile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit() : super(UpdateProfileInitial());

  static UpdateProfileCubit get(context)=>BlocProvider.of(context);
  final UpdateProfileRepo updateProfileRepo=UpdateProfileRepo(UpdateProfileApi());
  User? user;

  Future<void> update({
    required String name,
    required String email,
    required String mobile,
    required String password,
    required String address,
    required File image,
    required String emergency_mobile,
    required String birthdate,
    required String gender,
  })async{
    emit(UpdateProfileLoading());
    updateProfileRepo.update(
      name: name,
      email: email,
      mobile: mobile,
      password: password,
      address: address,
      image: image,
      emergency_mobile: emergency_mobile,
      birthdate: birthdate,
      gender: gender,).then((value) {
      user=value!.user;
      emit(UpdateProfileSuccess(user: value.user!));
    }).catchError((e){
      emit(UpdateProfileFailed(error: e.toString()));
    });
  }


}
