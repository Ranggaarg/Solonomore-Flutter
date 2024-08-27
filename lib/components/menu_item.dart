import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solonomore_flutter/components/static_text_style.dart';
import 'package:solonomore_flutter/gen/gen.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({
    super.key,
    required this.onTap,
    required this.label,
    required this.icon,
    this.subLabel = '',
    this.dividerPaddingBottom = 16,
    this.dividerPaddingLeft = 0,
    this.dividerPaddingRight = 0,
    this.arrowColor
  });

  final VoidCallback onTap;
  final String label;
  final SvgGenImage icon;
  final String subLabel;
  final double dividerPaddingBottom;
  final double dividerPaddingLeft;
  final double dividerPaddingRight;
  final Color? arrowColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              icon.svg(
                  height: 24.w, width: 24.w, color: ColorName.colorTextPrimary),
              SizedBox(
                width: 10.w,
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            label,
                            style: StaticTextStyle.textStyleFs14Fw400(
                                color: ColorName.colorTextPrimary),
                          ),
                        ),
                        Text(subLabel, style: StaticTextStyle.textStyleFs12Fw400(color: ColorName.colorTextSecondary),),
                        SizedBox(width: 8.w,),
                        Assets.images.icArrowRight.svg(
                          height: 14.w,
                          width: 14.w,
                          color: arrowColor ??ColorName.colorTextPrimary,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                  ],
                ),
              ) 
            ],
          ),
          Padding(
            padding: EdgeInsets.only(bottom: dividerPaddingBottom.h, left: dividerPaddingLeft.w, right: dividerPaddingRight.w),
            child: const Divider(
              color: ColorName.stroke,
            ),
          ),
        ],
      ),
    );
  }
}