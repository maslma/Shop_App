import 'package:flutter/material.dart';

import '../../../../presentation_managers/values_managers.dart';
import 'onboarding_pages.dart';

class OnBoardingItem extends StatelessWidget {
  final OnboardingPages? page;
  const OnBoardingItem({super.key, this.page});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: AppSize.s40,
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            page!.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            page!.subTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        const SizedBox(height: AppSize.s60),
        // SvgPicture.asset(
        //   page!.image,
        // ),
      ],
    );
  }
}
