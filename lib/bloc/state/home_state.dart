import '../../model/card_model.dart';
import '../../model/details_model.dart';

class HomeState {}

class LoadingHome extends HomeState {}

class InitHomeState extends HomeState {}

class HomeDataLoaded extends HomeState {
  List<CardData> model;
  HomeDataLoaded(
    this.model,
  );
}

class DetailLoaded extends HomeState {
  DetailModel model;
  DetailLoaded(
    this.model,
  );
}

class HomeError extends HomeState {
  String? msg;
  HomeError(
    this.msg,
  );
}
