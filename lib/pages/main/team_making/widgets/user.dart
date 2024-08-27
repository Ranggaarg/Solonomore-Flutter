import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solonomore_flutter/components/components.dart';
import 'package:solonomore_flutter/gen/gen.dart';

class User extends StatelessWidget {
  const User({
    required this.username,
    required this.age,
    required this.gender,
    required this.rank, 
    required this.role,
    required this.playStyle,
    required this.communicationStyle,
    required this.gameMode,
    super.key,
  });
  final String username;
  final String age;
  final String gender;
  final String rank;
  final String role;
  final String playStyle;
  final String communicationStyle;
  final String gameMode;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            showDialog(context: context, builder: (context) => AlertDialog(
              title: Text('Informasi User', style: StaticTextStyle.textStyleFs16Fw600(color: ColorName.colorTextPrimary),),
              content: Card(
                child: Padding(
                  padding: EdgeInsets.only(top: 12.h, left: 10.w, bottom: 12.h),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Text('Username  : ', style: StaticTextStyle.textStyleFs14Fw400(color: ColorName.colorTextPrimary),),
                          Text(username, style: StaticTextStyle.textStyleFs14Fw400(color: ColorName.colorTextPrimary),),
                        ],
                      ),
                      const Divider(color: ColorName.divider,),
                      Row(
                        children: [
                          Text('Usia             : ', style: StaticTextStyle.textStyleFs14Fw400(color: ColorName.colorTextPrimary),),
                          Text(age, style: StaticTextStyle.textStyleFs14Fw400(color: ColorName.colorTextPrimary),),
                        ],
                      ),
                      const Divider(color: ColorName.divider,),
                      Row(
                        children: [
                          Text('Gender       : ', style: StaticTextStyle.textStyleFs14Fw400(color: ColorName.colorTextPrimary),),
                          Text(gender, style: StaticTextStyle.textStyleFs14Fw400(color: ColorName.colorTextPrimary),),
                        ],
                      ),
                      const Divider(color: ColorName.divider,),
                      Row(
                        children: [
                          Text('Rank            : ', style: StaticTextStyle.textStyleFs14Fw400(color: ColorName.colorTextPrimary),),
                          Text(rank, style: StaticTextStyle.textStyleFs14Fw400(color: ColorName.colorTextPrimary),),
                        ],
                      ),
                      const Divider(color: ColorName.divider,),
                      Row(
                        children: [
                          Text('Role             : ', style: StaticTextStyle.textStyleFs14Fw400(color: ColorName.colorTextPrimary),),
                          Text(role, style: StaticTextStyle.textStyleFs14Fw400(color: ColorName.colorTextPrimary),),
                        ],
                      ),
                      const Divider(color: ColorName.divider,),
                      Row(
                        children: [
                          Text('Play Style    : ', style: StaticTextStyle.textStyleFs14Fw400(color: ColorName.colorTextPrimary),),
                          Text(playStyle, style: StaticTextStyle.textStyleFs14Fw400(color: ColorName.colorTextPrimary),),
                        ],
                      ),
                      const Divider(color: ColorName.divider,),
                      Row(
                        children: [
                          Text('Communication  : ', style: StaticTextStyle.textStyleFs14Fw400(color: ColorName.colorTextPrimary),),
                          Text(communicationStyle, style: StaticTextStyle.textStyleFs14Fw400(color: ColorName.colorTextPrimary),),
                        ],
                      ),
                      const Divider(color: ColorName.divider,),
                      Row(
                        children: [
                          Text('Game Mode   : ', style: StaticTextStyle.textStyleFs14Fw400(color: ColorName.colorTextPrimary),),
                          Text(gameMode, style: StaticTextStyle.textStyleFs14Fw400(color: ColorName.colorTextPrimary),),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              
            ),);
          },
          child: Container(
            height: 90.h,
            width: 90.w,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: Assets.images.userMale.image().image,
                fit: BoxFit.cover),
              color: ColorName.white.withOpacity(0.3),
              shape: BoxShape.circle
            ),
          ),
        ),
        SizedBox(height: 12.h,),
        Text(username, style: StaticTextStyle.textStyleFs16Fw600(color: ColorName.white),),
        Text(rank, style: StaticTextStyle.textStyleFs14Fw400(color: ColorName.white),)
      ],
    );
  }
}