import 'package:flutter/material.dart';
import 'package:shop_app/presentation/presentation_managers/exports.dart';
import 'package:shop_app/presentation/screens/bottom_navBar/view_model/bottom_nav_cubit.dart';
import 'package:shop_app/presentation/screens/home/view_model/home_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CachHelper.init();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(377, 813),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      builder: (BuildContext context, Widget? child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => LoginCubit()),
            BlocProvider(create: (context) => RegisterCubit()),
            BlocProvider(create: (context) => BottomNavCubit()),
            BlocProvider(create: (context) => HomeCubit()..getBanners()..getCategories()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Shop App',
            theme: getApplicationTheme(),
            onGenerateRoute: RoutesGenerator.getRoutes,
            initialRoute: Routes.navBarRoute,
          ),
        );
      },
    );
  }
}
