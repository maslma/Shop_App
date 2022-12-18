import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shop_app/presentation/presentation_managers/string_manager.dart';
import 'package:shop_app/presentation/presentation_managers/values_managers.dart';

import '../../../../data/local/chach_helper.dart';
import '../../../presentation_managers/assets_managers.dart';
import '../../../presentation_managers/color_manager.dart';
import '../../../presentation_managers/constancts_manager.dart';
import '../../../presentation_managers/routes_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;

  _statrtDelay() {
    _timer = Timer(const Duration(seconds: AppConst.splashDelay), _goNext);
  }

  _goNext() {
    CachHelper.getData(key: 'onboarding') == true
        ? Navigator.pushReplacementNamed(context, Routes.loginRoute)
        : Navigator.pushReplacementNamed(context, Routes.onboardingRoute);
  }

  @override
  void initState() {
    super.initState();
    _statrtDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: ColorManager.primary,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppSize.s28),
            child: const Image(
              width: AppSize.s200,
              height: AppSize.s200,
              image: AssetImage(ImageAssets.splashlogo),
            ),
          ),
          SizedBox(
            height: AppSize.s40,
          ),
          Text(
            AppStrings.splash,
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ],
      )),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
