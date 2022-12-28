import 'package:flutter/material.dart';
import 'package:shop_app/presentation/presentation_managers/color_manager.dart';
import 'package:shop_app/presentation/presentation_managers/exports.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary.withOpacity(0.4),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                height: AppSize.s120.h,
                width: double.infinity.w,
                color: Colors.red,
                child: Row(
                  children: [
                    Text(
                      '',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
