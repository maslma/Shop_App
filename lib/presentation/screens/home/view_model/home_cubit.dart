import 'package:bloc/bloc.dart';
import 'package:shop_app/presentation/screens/home/view_model/home_state.dart';


class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
}
