import 'package:flutter/material.dart';
import 'package:shop_app/presentation/presentation_managers/exports.dart';

class CategoryDetails extends StatelessWidget {
  final String image;
  final String text;
  const CategoryDetails({
    super.key,
    required this.text,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        elevation: AppSize.s0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: ColorManager.black,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: AppSize.s210.w,
              height: AppSize.s210.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.s18.r),
                border: Border.all(
                  color: ColorManager.black,
                  width: 3.w,
                ),
                image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height: AppSize.s30.h),
          Text(
            text,
            style: TextStyle(
              fontSize: AppSize.s28.sp,
              color: ColorManager.black,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
