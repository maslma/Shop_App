import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:shop_app/presentation/presentation_managers/exports.dart';
import 'package:shop_app/presentation/screens/bottom_navBar/view_model/bottom_nav_cubit.dart';
import 'package:shop_app/presentation/screens/bottom_navBar/view_model/bottom_nav_state.dart';

class BottomNavView extends StatelessWidget {
  const BottomNavView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BottomNavCubit, BottomNavState>(
      listener: (context, state) {},
      builder: (context, state) {
        BottomNavCubit cubit = BottomNavCubit.get(context);
        return Scaffold(
          body: PersistentTabView(
            context,
            //controller: _controller,
            screens: cubit.screens,
            items: cubit.items,
            confineInSafeArea: true,

            backgroundColor: ColorManager.primary.withOpacity(0.5), // Default is Colors.white.
            decoration: NavBarDecoration(
              borderRadius: BorderRadius.circular(AppSize.s20.r),
              colorBehindNavBar: Colors.transparent,
            ),
            margin: EdgeInsets.symmetric(horizontal: AppSize.s20.w, vertical: 20),
            resizeToAvoidBottomInset:
                true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
            stateManagement: true, // Default is true.
            hideNavigationBarWhenKeyboardShows:
                true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
            popAllScreensOnTapOfSelectedTab: true,
            popActionScreens: PopActionScreensType.all,
            itemAnimationProperties: const ItemAnimationProperties(
              duration: Duration(milliseconds: 150),
              curve: Curves.ease,
            ),
            screenTransitionAnimation: const ScreenTransitionAnimation(
              animateTabTransition: true,
              curve: Curves.ease,
              duration: Duration(milliseconds: 150),
            ),
            navBarStyle: NavBarStyle.style8, // Choose the nav bar style with this property.
          ),
        );
      },
    );
  }
}
