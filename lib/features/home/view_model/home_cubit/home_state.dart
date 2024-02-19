part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class GetPopularSuccessState extends HomeState {}
class GetPopularErrorState extends HomeState {}
class GetPopularLoadingState extends HomeState {}
