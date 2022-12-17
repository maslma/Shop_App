
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../presentation_managers/color_manager.dart';
import '../../../presentation_managers/values_managers.dart';
import '../view_model/cubit.dart';
import '../view_model/states.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnBoardingCubit, OnBoardingStates>(
      listener: (context, state) {},
      builder: (context, state) {
        OnBoardingCubit cubit = OnBoardingCubit.get(context);
        return Scaffold(   
  
          backgroundColor: ColorManager.white,
          appBar: AppBar(
            backgroundColor: ColorManager.white,
            elevation: AppSize.s0,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: ColorManager.white,
              statusBarIconBrightness: Brightness.dark,
              statusBarBrightness: Brightness.dark,
            ),
          ),
          // body: PageView.builder(
          //   controller: cubit.pageController,
          //   itemCount: cubit.onboardingPages.length,
          //   onPageChanged: (value) => cubit.changeCurrentPge(value),
          //   itemBuilder: (context, index) => OnBoardingItem(
          //     page: cubit.onboardingPages[index],
          //     key: super.key,
          //   ),
          // ),
          // bottomSheet: const OnBoardingBottom(),
        );
      },
    );
  }
}
