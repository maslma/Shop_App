import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../presentation_managers/color_manager.dart';
import '../../../../presentation_managers/constancts_manager.dart';
import '../../../../presentation_managers/string_manager.dart';
import '../../../../presentation_managers/values_managers.dart';
import '../../view_model/cubit.dart';
import '../../view_model/states.dart';

class OnBoardingBottom extends StatelessWidget {
  const OnBoardingBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnBoardingCubit, OnBoardingStates>(
      listener: (context, state) {},
      builder: (context, state) {
        OnBoardingCubit cubit = OnBoardingCubit.get(context);
        return Container(
          color: ColorManager.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () {
                    //cubit.onBoardingCach(context);
                  },
                  child: Text(
                    AppStrings.skip,
                    textAlign: TextAlign.end,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),
              Container(
                color: ColorManager.primary,
                child: Padding(
                  padding: const EdgeInsets.all(AppPadding.p2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          cubit.pageController.previousPage(
                            duration: const Duration(milliseconds: AppConst.onboardingDuration),
                            curve: Curves.linear,
                          );
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_rounded,
                          color: cubit.currentPage == 0 ? ColorManager.grey : ColorManager.white,
                        ),
                      ),
                      SmoothPageIndicator(
                        controller: cubit.pageController,
                        count: 4,
                        effect: WormEffect(
                          activeDotColor: ColorManager.white,
                          dotColor: ColorManager.white,
                          paintStyle: PaintingStyle.stroke,
                          dotHeight: AppSize.s12,
                          dotWidth: AppSize.s12,
                        ),
                      ),
                    0 == 0 // cubit.currentPage == cubit.onboardingPages.length - 1
                          ? TextButton(
                              onPressed: () {
                                //cubit.onBoardingCach(context);
                              },
                              child: Text(
                                AppStrings.login,
                                textAlign: TextAlign.end,
                                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                      color: ColorManager.white,
                                    ),
                              ),
                            )
                          : IconButton(
                              onPressed: () {
                                cubit.pageController.nextPage(
                                  duration:
                                      const Duration(milliseconds: AppConst.onboardingDuration),
                                  curve: Curves.linear,
                                );
                              },
                              icon: Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: ColorManager.white,
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
