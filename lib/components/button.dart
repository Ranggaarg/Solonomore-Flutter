import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solonomore_flutter/components/static_text_style.dart';
import 'package:solonomore_flutter/gen/colors.gen.dart';

class Button extends StatelessWidget {
  const Button({
    this.onTapButton,
    required this.text,
    required this.textColor,
    this.buttonColor,
    super.key,
  });

  final VoidCallback? onTapButton;
  final String text;
  final Color textColor;
  final Color? buttonColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        buttonColor;
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 22.w),
        width: double.infinity,
        height: 48.h,
        decoration: BoxDecoration(
            color: buttonColor ?? ColorName.colorTextPrimary,
            borderRadius: BorderRadius.circular(24.r)),
        child: Center(
          child: Text(
            text,
            style: StaticTextStyle.textStyleFs15Fw600(
                color: textColor),
          ),
        ),
      ),
    );
  }
}