import 'dart:developer';
import 'package:dio/dio.dart';
import '../Models/home_model.dart';
import '../WebServer/Home_API.dart';
class HomeRepo {
  final HomeApi homeApi;
  HomeRepo(this.homeApi);
  Future<HomeModel?> getHome() async {
    try {
      final Response response = await homeApi.getHome();
      log('statusCode: ' + response.statusCode.toString());
      log('response: ' + response.data.toString());
      if (response.statusCode == 200) {
        final homeModel = HomeModel.fromJson(response.data);
        return homeModel;
      } else {
        throw (response.data["message"]);
      }
    } catch (e) {
      throw (e);
    }
  }
}
