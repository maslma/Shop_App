import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:shop_app/presentation/presentation_managers/color_manager.dart';
import 'package:shop_app/presentation/screens/bottom_navBar/view_model/bottom_nav_state.dart';
import 'package:shop_app/presentation/screens/home/views/home_view.dart';
import 'package:shop_app/presentation/screens/search/views/search_view.dart';

class BottomNavCubit extends Cubit<BottomNavState> {
  BottomNavCubit() : super(BottomNavInitial());

  static BottomNavCubit get(context) => BlocProvider.of(context);

  List<Widget> screens = [
    const HomeView(),
    const SearchView(),
    const HomeView(),
    const HomeView(),
  ];
  List<PersistentBottomNavBarItem> items = [
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.home),
      title: "Home",
      activeColorPrimary: ColorManager.black,
      inactiveColorPrimary: ColorManager.white,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.search),
      title: "Search",
      activeColorPrimary: ColorManager.black,
      inactiveColorPrimary: ColorManager.white,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.heart_fill),
      title: "Favorite",
      activeColorPrimary: ColorManager.black,
      inactiveColorPrimary: ColorManager.white,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.person_fill),
      title: "Profile",
      activeColorPrimary: ColorManager.black,
      inactiveColorPrimary: ColorManager.white,
    ),
  ];
}
