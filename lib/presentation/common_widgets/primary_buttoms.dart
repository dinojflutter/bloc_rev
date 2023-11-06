import 'package:bloc_revisions/core/constants/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

class Primarybottom extends StatelessWidget {
  final String text;
  final VoidCallback onpressed;

  const Primarybottom({
    super.key,
    required this.text,
    required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.white,
      onTap: onpressed,
      child: Container(
          decoration: BoxDecoration(
            color: MyColors.appcolor,
            borderRadius: BorderRadius.circular(18.r),
          ),
          height: 50.h,
          width: MediaQuery.sizeOf(context).width,
          child:
              text.text.size(20.sp).bold.color(Colors.white).make().centered()),
    );
  }
}
