import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solonomore_flutter/bloc/user/user_cubit.dart';
import 'package:solonomore_flutter/components/components.dart';
import 'package:solonomore_flutter/gen/gen.dart';
import 'package:solonomore_flutter/pages/main/import/import_screen.dart';
import 'package:solonomore_flutter/pages/main/main.dart';
import 'package:solonomore_flutter/pages/main/preference/preference_screen.dart';
import 'package:solonomore_flutter/pages/main/profile/profile_screen.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key, required this.username});

  final String username;
  @override
  Widget build(BuildContext context) {

    context.read<UserCubit>().getDataUser(username);
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              ColorName.primary,
              ColorName.secondary
            ])
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 100.h,),
              Center(
                child: Container(
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: ColorName.white
                  ),
                  child: Assets.images.soloNoMore.image(height: 24.h),
                ),
              ),
              SizedBox(height: 40.h,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: ColorName.background,
                  borderRadius: BorderRadius.circular(12.r)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => TeamMakingScreen(username: username),));
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 22.w),
                        width: double.infinity,
                        height: 48.h,
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(colors: [
                              ColorName.primary,
                              ColorName.secondary
                            ]),
                            borderRadius: BorderRadius.circular(24.r)),
                        child: Center(
                          child: Text(
                            'Team Making',
                            style: StaticTextStyle.textStyleFs15Fw600(
                                color: ColorName.white),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.h),
                      child: const Divider(color: ColorName.colorTextSecondary,),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ImportScreen(),));
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 22.w),
                        width: double.infinity,
                        height: 48.h,
                        decoration: BoxDecoration(
                          color: ColorName.colorTextPrimary,
                          borderRadius: BorderRadius.circular(24.r)),
                        child: Center(
                          child: Text(
                            'Import File',
                            style: StaticTextStyle.textStyleFs15Fw600(
                                color: ColorName.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 33.h,),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => PreferenceScreen(username: username),));
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 22.w),
                        width: double.infinity,
                        height: 48.h,
                        decoration: BoxDecoration(
                          color: ColorName.colorTextPrimary,
                          borderRadius: BorderRadius.circular(24.r)),
                        child: Center(
                          child: Text(
                            'Preferensi',
                            style: StaticTextStyle.textStyleFs15Fw600(
                                color: ColorName.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 33.h,),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfileScreen(username: username),));
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 22.w),
                        width: double.infinity,
                        height: 48.h,
                        decoration: BoxDecoration(
                          color: ColorName.colorTextPrimary, 
                          borderRadius: BorderRadius.circular(24.r)),
                        child: Center(
                          child: Text(
                            'Profile',
                            style: StaticTextStyle.textStyleFs15Fw600(
                                color: ColorName.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 33.h,),
                    GestureDetector(
                      onTap: () {
                        SystemNavigator.pop();
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 22.w),
                        width: double.infinity,
                        height: 48.h,
                        decoration: BoxDecoration(
                          color: ColorName.colorTextPrimary,
                          borderRadius: BorderRadius.circular(24.r)),
                        child: Center(
                          child: Text(
                            'Exit',
                            style: StaticTextStyle.textStyleFs15Fw600(
                                color: ColorName.white),
                          ),
                        ),
                      ),
                    ), 
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

