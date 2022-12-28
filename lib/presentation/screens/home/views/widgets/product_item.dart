import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/presentation/presentation_managers/exports.dart';

import '../../../../presentation_managers/values_managers.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25.r),
      child: SizedBox(
        height: AppSize.s250.h,
        width: AppSize.s170.w,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25.r),
              child: Image.asset(
                'assets/images/product.jpg',
                height: AppSize.s210.h,
                width: double.infinity.w,
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
                child: Container(
                  height: AppSize.s28,
                  width: AppSize.s50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    color: Colors.red,
                  ),
                  child: Center(
                    child: Text(AppStrings.discount,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: AppSize.s14.sp,
                          fontWeight: FontWeight.bold
                      ),),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 20.r,
                  child: Center(
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite_border_outlined,
                        size: 25.r,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 6.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(AppStrings.home,
                      style: TextStyle(
                      color: Colors.black,
                        fontSize: AppSize.s18.sp,
                        fontWeight: FontWeight.bold
                    ),),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(AppStrings.namePrice,
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: AppSize.s12.sp,
                              fontWeight: FontWeight.bold
                          ),),
                        Text(AppStrings.price,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: AppSize.s14.sp,
                              fontWeight: FontWeight.bold
                          ),),

                      ],
                    ),

                  ],
                ),
              ),
            )

          ],
        ),
      ),
    );

  }
}
