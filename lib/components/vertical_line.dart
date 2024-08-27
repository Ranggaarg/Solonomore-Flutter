import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solonomore_flutter/gen/gen.dart';

class VerticalLine extends StatelessWidget {
  const VerticalLine({
    this.height = 35,
    this.width = 1,
    super.key});

  final int height;
  final int width;

  @override
  Widget build(BuildContext context){
    return Container(
      height: height.h,
      width: width.w,
      color: ColorName.stroke,
    );
  }
}

