import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solonomore_flutter/bloc/user/user_cubit.dart';
import 'package:solonomore_flutter/components/components.dart';
import 'package:solonomore_flutter/gen/gen.dart';
import 'package:solonomore_flutter/pages/main/profile/profile_screen.dart';

class AgeScreen extends StatelessWidget {
  AgeScreen({super.key, required this.username});

  final String username;
  final TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserCubit, UserState>(
      listener: (context, state) {
        if (state is UserSuccess) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => ProfileScreen(username: username),
          ));
        }
      },
      child: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if(state is UserLoading) {
            return const Center(child: CircularProgressIndicator(),);
          } else if(state is UserGetSuccess) {
            final user = state.userModel;
            return Scaffold(
            appBar: AppBar(
              title: Text(
                'Age',
                style: StaticTextStyle.textStyleFs16Fw600(
                    color: ColorName.colorTextPrimary),
              ),
              actions: [
                Padding(
                    padding: EdgeInsets.only(right: 20.w),
                    child: GestureDetector(
                      onTap: () {
                        context.read<UserCubit>().updateAgeData(username, int.parse(ageController.text));
                      },
                      child: Text(
                        'Simpan',
                        style: StaticTextStyle.textStyleFs14Fw500(
                            color: ColorName.primary),
                      ),
                    ))
              ],
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
              child: Container(
                padding: EdgeInsets.only(
                  right: 14.w,
                  left: 16.w,
                ),
                height: 44.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22.r),
                  color: ColorName.colorF3F4F9,
                ),
                child: TextField(
                  controller: ageController,
                  textAlignVertical: TextAlignVertical.center,
                  cursorColor: ColorName.secondary,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 17.h),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      labelText: 'Your Age : ${user.age}',
                      labelStyle: StaticTextStyle.textStyleFs12Fw400(
                          color: ColorName.gray400),
                      border: InputBorder.none),
                ),
              ),
            ),
          );
          } else if(state is UserFailure) {
            return Scaffold(
            appBar: AppBar(
              title: Text(
                'Age',
                style: StaticTextStyle.textStyleFs16Fw600(
                    color: ColorName.colorTextPrimary),
              ),
              actions: [
                Padding(
                    padding: EdgeInsets.only(right: 20.w),
                    child: GestureDetector(
                      onTap: () {
                        context.read<UserCubit>().updateAgeData(username, int.parse(ageController.text));
                      },
                      child: Text(
                        'Simpan',
                        style: StaticTextStyle.textStyleFs14Fw500(
                            color: ColorName.primary),
                      ),
                    ))
              ],
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
              child: Container(
                padding: EdgeInsets.only(
                  right: 14.w,
                  left: 16.w,
                ),
                height: 44.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22.r),
                  color: ColorName.colorF3F4F9,
                ),
                child: TextField(
                  controller: ageController,
                  textAlignVertical: TextAlignVertical.center,
                  cursorColor: ColorName.secondary,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 17.h),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      labelText: 'Silahkan masukkan umurmu',
                      labelStyle: StaticTextStyle.textStyleFs12Fw400(
                          color: ColorName.gray400),
                      border: InputBorder.none),
                ),
              ),
            ),
          );
          }
        return const SizedBox();
        },
      ),
    );
  }
}
