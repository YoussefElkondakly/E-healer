import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../DataLayer/Models/home_model.dart';
import '../../DataLayer/Repository/home_repo.dart';
import '../../DataLayer/WebServer/Home_API.dart';
part 'home_state.dart';
class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);

  final HomeRepo homeRepo = HomeRepo(HomeApi());
  HomeData? homeData;
  Future<void> getHome() async {
    emit(HomeLoading());
    homeRepo.getHome().then((value) {
      homeData = value!.data;
      emit(HomeSuccess());
    }).catchError((e) {
      emit(HomeFailed(err: e.toString()));
    });
  }
}
