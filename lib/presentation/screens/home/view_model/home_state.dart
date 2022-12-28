abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeGetBannerLoadingState extends HomeState {}

class HomeGetBannerSuccessState extends HomeState {}

class HomeGetBannerErrorState extends HomeState {
  String error;
  HomeGetBannerErrorState(this.error);
}

class HomeGetCategoryLoadingState extends HomeState {}

class HomeGetCategorySuccessState extends HomeState {}

class HomeGetCategoryErrorState extends HomeState {
  String error;
  HomeGetCategoryErrorState(this.error);
}
