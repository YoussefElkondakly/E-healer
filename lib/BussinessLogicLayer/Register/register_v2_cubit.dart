import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../DataLayer/Models/Register/RegisterV2.dart';
import '../../DataLayer/Repository/registerV2_repo.dart';
import '../../DataLayer/WebServer/registerV2_API.dart';
part 'register_v2_state.dart';

class RegisterV2Cubit extends Cubit<RegisterV2State> {
  RegisterV2Cubit() : super(RegisterV2Initial());
  static RegisterV2Cubit get(context)=>BlocProvider.of(context);
  final RegisterV2Repo registerV2Repo=RegisterV2Repo(RegisterV2Api());
  User? user;

  Future<void> registerV2({
    required String emergency_mobile,
    required String birthdate,
    required String gender,
    })async{
    emit(RegisterV2Loading());
    registerV2Repo.registerV2(emergency_mobile: emergency_mobile, birthdate: birthdate, gender: gender,).then((value) {
      user=value!.user;
      emit(RegisterV2Success(user: value.user!));
    }).catchError((e){
      emit(RegisterV2Failed(error: e.toString()));
    });
  }



}
