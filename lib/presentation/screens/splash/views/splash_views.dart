import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shop_app/presentation/presentation_managers/color_manager.dart';
import 'package:shop_app/presentation/presentation_managers/string_manager.dart';
import 'package:shop_app/presentation/presentation_managers/values_managers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../presentation_managers/assets_managers.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;

  // _statrtDelay() {
  //   _timer = Timer(const Duration(seconds: AppConst.splashDelay), _goNext);
  // }

  // _goNext() {
  //   Navigator.pushReplacementNamed(context, Routes.loginRoute);

  //   // CachHelper.getData(key: 'onboarding') == true
  //   //     ? Navigator.pushReplacementNamed(context, Routes.loginRoute)
  //   //     : Navigator.pushReplacementNamed(context, Routes.onboardingRoute);
  // }

  @override
  void initState() {
    super.initState();
   // _statrtDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            height: AppSize.s200.h,
            width: AppSize.s200.w,
            image: const AssetImage(
              ImageAssets.splash,
            ),
          ),
          SizedBox(
            height: AppSize.s40.h,
          ),
          Text(
            AppStrings.splash,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: ColorManager.black,
                ),
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
