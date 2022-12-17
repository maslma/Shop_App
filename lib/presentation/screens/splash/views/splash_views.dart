import 'dart:async';

import 'package:flutter/material.dart';

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
      backgroundColor: ColorManager.primary,
      body: const Center(child: Image(image: AssetImage(ImageAssets.splashlogo))),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
