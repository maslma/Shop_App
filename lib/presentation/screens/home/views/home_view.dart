import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/presentation/presentation_managers/exports.dart';
import 'package:shop_app/presentation/screens/home/view_model/home_cubit.dart';
import 'package:shop_app/presentation/screens/home/view_model/home_state.dart';
import 'package:shop_app/presentation/screens/home/views/widgets/carosal_item.dart';
import 'package:shop_app/presentation/screens/home/views/widgets/category_details.dart';
import 'package:shop_app/presentation/screens/home/views/widgets/category_item.dart';
import 'package:shop_app/presentation/screens/home/views/widgets/product_item.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        HomeCubit cubit = HomeCubit.get(context);
        return Scaffold(
          backgroundColor: ColorManager.white,
          body: SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: AppSize.s120.h,
                    width: double.infinity.w,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: AppPadding.p28.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Find your\nfavorite products',
                            style: TextStyle(
                              fontSize: AppSize.s28.sp,
                              color: ColorManager.black,
                            ),
                          ),
                          CircleAvatar(
                            radius: AppSize.s28.r,
                            backgroundImage: const NetworkImage(
                                'https://img.freepik.com/premium-photo/young-arab-man-isolated-blue-background-pointing-side-present-product_1368-247832.jpg'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  CarouselSlider(
                    items: cubit.bannerModel == null
                        ? [const SizedBox()]
                        : cubit.bannerModel!.data!
                            .map((e) => CarosalItem(
                                  image: e.image!,
                                ))
                            .toList(),
                    options: CarouselOptions(
                      height: AppSize.s210.h,
                      viewportFraction: 1.0,
                      autoPlay: true,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration: const Duration(milliseconds: 3000),
                      scrollDirection: Axis.horizontal,
                      reverse: false,
                      enableInfiniteScroll: true,
                      initialPage: 0,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: AppPadding.p28.h),
                    child: SizedBox(
                      height: AppSize.s40.h,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        padding: EdgeInsets.only(left: AppSize.s28.w),
                        itemBuilder: (context, index) => CategoryItem(
                          onTap: () => Navigator.of(context, rootNavigator: true).push(
                            MaterialPageRoute(
                              builder: (context) => CategoryDetails(
                                  text: cubit.categoryModel!.data!.data![index].name!,
                                  image: cubit.categoryModel!.data!.data![index].image!),
                            ),
                          ),
                          text: cubit.categoryModel == null
                              ? '...'
                              : cubit.categoryModel!.data!.data![index].name!,
                        ),
                        separatorBuilder: (context, index) => SizedBox(width: AppSize.s18.w),
                        itemCount: cubit.categoryModel == null
                            ? 5
                            : cubit.categoryModel!.data!.data!.length,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: AppSize.s28.h),
                    child: Text(
                      'Popular product',
                      style: TextStyle(
                        fontSize: AppSize.s28.sp,
                        color: ColorManager.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: AppSize.s20.h,
                  ),
                  SizedBox(
                    height: AppSize.s250.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.only(left: AppSize.s28.w),
                      itemBuilder: (context, index) => const ProductItem(),
                      separatorBuilder: (context, index) => SizedBox(width: AppSize.s18.w),
                      itemCount:
                          cubit.categoryModel == null ? 7 : cubit.categoryModel!.data!.data!.length,
                    ),
                  ),
                  SizedBox(
                    height: AppSize.s20.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: AppSize.s28.h),
                    child: Text(
                      'New product',
                      style: TextStyle(
                        fontSize: AppSize.s28.sp,
                        color: ColorManager.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: AppSize.s20.h,
                  ),
                  SizedBox(
                    height: AppSize.s250.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.only(left: AppSize.s28.w),
                      itemBuilder: (context, index) => const ProductItem(),
                      separatorBuilder: (context, index) => SizedBox(width: AppSize.s18.w),
                      itemCount:
                          cubit.categoryModel == null ? 7 : cubit.categoryModel!.data!.data!.length,
                    ),
                  ),
                  SizedBox(
                    height: AppSize.s70.h,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
