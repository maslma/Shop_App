import 'package:flutter/material.dart';
import 'package:shop_app/presentation/presentation_managers/exports.dart';

class CategoryItem extends StatelessWidget {
  final String text;
  final Function()? onTap;
  const CategoryItem({
    super.key,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: AppSize.s40.h,
        width: AppSize.s100.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.r),
          border: Border.all(
            color: ColorManager.black,
            width: AppSize.s2.w,
          ),
        ),
        child: Center(
          child: Text(
            text,
            maxLines: 1,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: AppSize.s18.sp,
              color: ColorManager.black,
            ),
          ),
        ),
      ),
    );
  }
}
