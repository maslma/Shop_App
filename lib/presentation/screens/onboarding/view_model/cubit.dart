import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/presentation/screens/onboarding/view_model/states.dart';

class OnBoardingCubit extends Cubit<OnBoardingStates> {
  OnBoardingCubit() : super(OnBoardingInitialState());

  static OnBoardingCubit get(context) => BlocProvider.of(context);

  final PageController pageController = PageController();

  int currentPage = 0;

  // List<OnboardingPages> onboardingPages = [
  //   OnboardingPages(
  //     AppStrings.onBoardingTitle1,
  //     AppStrings.onBoardingSubTitle1,
  //     ImageAssets.onBoarding1,
  //   ),
  //   OnboardingPages(
  //     AppStrings.onBoardingTitle2,
  //     AppStrings.onBoardingSubTitle2,
  //     ImageAssets.onBoarding2,
  //   ),
  //   OnboardingPages(
  //     AppStrings.onBoardingTitle3,
  //     AppStrings.onBoardingSubTitle3,
  //     ImageAssets.onBoarding3,
  //   ),
  //   OnboardingPages(
  //     AppStrings.onBoardingTitle4,
  //     AppStrings.onBoardingSubTitle4,
  //     ImageAssets.onBoarding4,
  //   ),
  // ];

  // void changeCurrentPge(int index) {
  //   currentPage = index;
  //   emit(OnBoardingChangePagesState());
  // }

  // onBoardingCach(context) {
  //   CachHelper.saveData(key: 'onboarding', value: true).then(
  //     (value) {
  //       if (value) {
  //         Navigator.pushReplacementNamed(context, Routes.loginRoute);
  //       }
  //     },
  //   );
  // }
}
