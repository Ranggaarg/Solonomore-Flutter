import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solonomore_flutter/bloc/auth/auth_cubit.dart';
import 'package:solonomore_flutter/bloc/user/user_cubit.dart';
import 'package:solonomore_flutter/components/components.dart';
import 'package:solonomore_flutter/gen/gen.dart';
import 'package:solonomore_flutter/pages/auth/register/register_screen.dart';
import 'package:solonomore_flutter/pages/main/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthFailure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Center(child: Text(state.message))));
                print(state.message);
          } else if (state is AuthSuccess) {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => MenuScreen(username: usernameController.text),
            ));
          }
        },
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            if(state is AuthLoading) {
              return const Center(child:CircularProgressIndicator());
            }
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Assets.images.soloNoMore.image(height: 24.h),
                  SizedBox(
                    height: 50.h,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.symmetric(horizontal: 22.w),
                    padding: EdgeInsets.only(
                      right: 20.w,
                      left: 20.w,
                    ),
                    width: double.infinity,
                    height: 48.h,
                    decoration: BoxDecoration(
                        color: ColorName.colorF3F4F9,
                        borderRadius: BorderRadius.circular(12.r)),
                    child: TextField(
                      controller: usernameController,
                      textAlignVertical: TextAlignVertical.center,
                      cursorColor: ColorName.secondary,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: 12.h),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          labelText: 'Username',
                          labelStyle: StaticTextStyle.textStyleFs12Fw400(
                              color: ColorName.gray400),
                          border: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.symmetric(horizontal: 22.w),
                    padding: EdgeInsets.only(
                      right: 20.w,
                      left: 20.w,
                    ),
                    width: double.infinity,
                    height: 48.h,
                    decoration: BoxDecoration(
                        color: ColorName.colorF3F4F9,
                        borderRadius: BorderRadius.circular(12.r)),
                    child: TextField(
                      controller: passwordController,
                      textAlignVertical: TextAlignVertical.center,
                      cursorColor: ColorName.secondary,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: 12.h),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          labelText: 'Password',
                          labelStyle: StaticTextStyle.textStyleFs12Fw400(
                              color: ColorName.gray400),
                          border: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                    height: 34.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      final username = usernameController.text;
                      final password = passwordController.text;
                      context.read<AuthCubit>().login(username, password);
                      context.read<UserCubit>().getDataUser(username);
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 22.w),
                      width: double.infinity,
                      height: 48.h,
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              colors: [ColorName.primary, ColorName.secondary]),
                          borderRadius: BorderRadius.circular(24.r)),
                      child: Center(
                        child: Text(
                          'Masuk',
                          style: StaticTextStyle.textStyleFs15Fw600(
                              color: ColorName.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Belum punya akun? ',
                        style: StaticTextStyle.textStyleFs12Fw400(
                            color: ColorName.gray400),
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                              builder: (context) => RegisterScreen(),
                            ));
                          },
                          child: Text(
                            'daftar disini',
                            style: StaticTextStyle.textStyleFs12Fw400(
                                color: ColorName.secondary),
                          ),
                        ),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    ));
  }
}
