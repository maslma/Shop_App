import 'package:flutter/material.dart';
import 'package:shop_app/presentation/presentation_managers/exports.dart';

class CarosalItem extends StatelessWidget {
  final String image;
  const CarosalItem({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25.r),
        child: SizedBox(
          height: AppSize.s210.h,
          width: double.infinity.w,
          child: Image(
            fit: BoxFit.cover,
            image: NetworkImage(
                image),
          ),
        ),
      ),
    );
  }
}
