import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:new_windows/DataLayer/Models/User/GetUserModel.dart';
import '../../DataLayer/Repository/user/GetUserRepo.dart';
import '../../DataLayer/WebServer/user/GetUserAPI.dart';

part 'get_user_state.dart';

class GetUserCubit extends Cubit<GetUserState> {
  GetUserCubit() : super(GetUserInitial());
  static GetUserCubit get(context) => BlocProvider.of(context);

  final GetUserRepo getUserRepo = GetUserRepo(GetUserApi());
  Userg? user;
  Future<void> getGetUser() async {
    emit(GetUserLoading());
    getUserRepo.getGetUser().then((value) {
      user = value!.user;
      emit(GetUserSuccess());
    }).catchError((e) {
      emit(GetUserFailed(error: e.toString()));
    });
  }

}

