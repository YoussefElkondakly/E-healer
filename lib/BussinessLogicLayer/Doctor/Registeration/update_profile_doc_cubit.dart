import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../DataLayer/Models/Doctor/Registeration/UpdateProfile.dart';
import '../../../DataLayer/Repository/Doctor/Registeration/updateProfile_repo.dart';
import '../../../DataLayer/WebServer/Doctor/Registeration/UpdateProfile_API.dart';

part 'update_profile_doc_state.dart';

class UpdateProfileDocCubit extends Cubit<UpdateProfileDocState> {
  UpdateProfileDocCubit() : super(UpdateProfileDocInitial());
  static UpdateProfileDocCubit get(context)=>BlocProvider.of(context);
  final UpdateProfileDocRepo updateProfileDocRepo=UpdateProfileDocRepo(UpdateProfileDocApi());
  User? user;

  Future<void> update({
    required String name,
    required String email,
    required String address,
    required String mobile,
    required File image,
    required File certificate,
    required String specialization_id,
    required String gender,
  })async{
    emit(UpdateProfileDocLoading());
    updateProfileDocRepo.update(
      name: name,
      email: email,
      address: address,
      mobile: mobile,
      image: image,
      certificate: certificate,
      specialization_id:specialization_id,
        gender:gender,
      ).then((value) {
      user=value!.user;
      emit(UpdateProfileDocSuccess(user: value.user!));
    }).catchError((e){
      emit(UpdateProfileDocFailed(error: e.toString()));
    });
  }


}
