import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solonomore_flutter/bloc/user/user_cubit.dart';
import 'package:solonomore_flutter/components/components.dart';
import 'package:solonomore_flutter/gen/gen.dart';
import 'package:solonomore_flutter/pages/profile/profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key, required this.username});

  final String username;

  @override
  Widget build(BuildContext context) {
    context.read<UserCubit>().getDataUser(username);

    return Scaffold(
      backgroundColor: ColorName.colorF3F4F9,
      appBar: AppBar(
        title: Text(
          'Edit Profile',
          style: StaticTextStyle.textStyleFs16Fw600(
              color: ColorName.colorTextPrimary),
        ),
      ),
      body: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if(state is UserLoading) {
            const Center(child: CircularProgressIndicator(),);
          } else if(state is UserGetSuccess)  {
            final user = state.userModel;
            return Stack(
            children: [
              SizedBox(
                height: 360.h,
                width: double.infinity,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: Assets.images.userMale.image().image,
                        fit: BoxFit.cover),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 268.h,
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          bottom: 18.h, left: 306.w, right: 22.w),
                      padding: EdgeInsets.all(4.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: Colors.transparent,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(
                          top: 24.h, right: 16.w, left: 16.w, bottom: 8.h),
                      margin: EdgeInsets.symmetric(horizontal: 16.w),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          color: ColorName.white),
                      child: Column(
                        children: [
                          MenuItem(
                            onTap: () {},
                            icon: Assets.images.icProfileCircle,
                            label: 'Username',
                            subLabel: user.username,
                            arrowColor: ColorName.white,
                          ),
                          MenuItem(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => GenderScreen(username: username),
                                ),
                              );
                            },
                            icon: Assets.images.icMan,
                            label: 'Jenis Kelamin',
                            subLabel: user.gender,
                          ),
                          MenuItem(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => AgeScreen(username: username),
                                ),
                              );
                            },
                            icon: Assets.images.icCalendar,
                            label: 'Usia',
                            subLabel: user.age.toString(),
                            dividerPaddingBottom: 0,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30.h,),
                    Text('* Silahkan restart aplikasi setelah melakukan perubahan', style: StaticTextStyle.textStyleFs12Fw500(color: ColorName.colorTextPrimary),)
                  ],
                ),
              ),
            ],
          );
          } else if(state is UserFailure) {
            return Stack(
            children: [
              SizedBox(
                height: 360.h,
                width: double.infinity,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: Assets.images.userMale.image().image,
                        fit: BoxFit.cover),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 268.h,
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          bottom: 18.h, left: 306.w, right: 22.w),
                      padding: EdgeInsets.all(4.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: Colors.transparent,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(
                          top: 24.h, right: 16.w, left: 16.w, bottom: 8.h),
                      margin: EdgeInsets.symmetric(horizontal: 16.w),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          color: ColorName.white),
                      child: Column(
                        children: [
                          MenuItem(
                            onTap: () {},
                            icon: Assets.images.icProfileCircle,
                            label: 'Username',
                            subLabel: username,
                            arrowColor: ColorName.white,
                          ),
                          MenuItem(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => GenderScreen(username: username,),
                                ),
                              );
                            },
                            icon: Assets.images.icMan,
                            label: 'Jenis Kelamin',
                            subLabel: '-',
                          ),
                          MenuItem(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => AgeScreen(username: username),
                                ),
                              );
                            },
                            icon: Assets.images.icCalendar,
                            label: 'Usia',
                            subLabel: '-'.toString(),
                            dividerPaddingBottom: 0,
                          ),
                        ],
                      ),
                    ),
                     SizedBox(height: 30.h,),
                    Text('* Silahkan restart aplikasi setelah melakukan perubahan', style: StaticTextStyle.textStyleFs12Fw500(color: ColorName.colorTextPrimary),)
                  ],
                ),
              ),
            ],
          );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
