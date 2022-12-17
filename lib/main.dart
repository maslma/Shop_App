import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/data/local/chach_helper.dart';
import 'package:shop_app/data/remote/dio_helper.dart';
import 'package:shop_app/utities/bloc_observer.dart';

import 'presentation/presentation_managers/routes_manager.dart';
import 'presentation/presentation_managers/theme_manager.dart';

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
    return MultiBlocProvider(
      providers: [  ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: getApplicationTheme(),
        onGenerateRoute: RoutesGenerator.getRoutes,
        initialRoute: Routes.splashRoute,
      ),
    );
  }
}
