import 'package:shop_app/domain/models/banner_model.dart';
import 'package:shop_app/domain/models/category_model.dart';
import 'package:shop_app/presentation/presentation_managers/constancts_manager.dart';
import 'package:shop_app/presentation/presentation_managers/exports.dart';
import 'package:shop_app/presentation/screens/home/view_model/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  BannerModel? bannerModel;
  void getBanners() {
    emit(HomeGetBannerLoadingState());
    DioHelper.getData(
      url: AppConst.banner,
    ).then((value) {
      bannerModel = BannerModel.fromJson(value!.data);

      emit(HomeGetBannerSuccessState());
    }).catchError((error) {
      emit(HomeGetBannerErrorState(error));
    });
  }

  CategoryModel? categoryModel;
  void getCategories() {
    emit(HomeGetCategoryLoadingState());
    DioHelper.getData(
      url: AppConst.category,
    ).then((value) {
      categoryModel = CategoryModel.fromJson(value!.data);

      emit(HomeGetCategorySuccessState());
    }).catchError((error) {
      emit(HomeGetCategoryErrorState(error));
    });
  }
  
}
