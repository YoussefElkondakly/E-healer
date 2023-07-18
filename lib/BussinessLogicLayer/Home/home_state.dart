part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}
class HomeLoading extends HomeState{}
class HomeSuccess extends HomeState{}
class HomeFailed extends HomeState{
  final String err;
  HomeFailed({required this.err});

}