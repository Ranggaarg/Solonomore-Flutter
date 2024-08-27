import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solonomore_flutter/bloc/user/user_cubit.dart';
import 'package:solonomore_flutter/components/components.dart';
import 'package:solonomore_flutter/gen/gen.dart';
import 'package:solonomore_flutter/pages/main/profile/profile_screen.dart';

class GenderScreen extends StatelessWidget {
  GenderScreen({super.key, required this.username});

  final String username;

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserCubit, UserState>(
      listener: (context, state) {
       if(state is UserSuccess) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ProfileScreen(username: username),));
       }
      },
      child: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if (state is UserLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is UserGetSuccess) {
            final user = state.userModel;
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  'Jenis Kelamin',
                  style: StaticTextStyle.textStyleFs16Fw600(
                      color: ColorName.colorTextPrimary),
                ),
                actions: [
                  Padding(
                      padding: EdgeInsets.only(right: 20.w),
                      child: GestureDetector(
                        onTap: () {
                          print(selectedValue);
                          context
                              .read<UserCubit>()
                              .updateGenderData(username, selectedValue!.toLowerCase());
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
                child: Column(
                  children: [
                    DropdownButtonFormField2<String>(
                      isExpanded: true,
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      hint: Text(
                        user.gender,
                        style: TextStyle(fontSize: 14),
                      ),
                      items: genderItems
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ))
                          .toList(),
                      validator: (value) {
                        if (value == null) {
                          return 'Please select gender.';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        selectedValue = value;
                      },
                      onSaved: (value) {
                        selectedValue = value.toString();
                      },
                      buttonStyleData: const ButtonStyleData(
                        padding: EdgeInsets.only(right: 8),
                      ),
                      iconStyleData: const IconStyleData(
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black45,
                        ),
                        iconSize: 24,
                      ),
                      dropdownStyleData: DropdownStyleData(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (state is UserFailure) {
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  'Jenis Kelamin',
                  style: StaticTextStyle.textStyleFs16Fw600(
                      color: ColorName.colorTextPrimary),
                ),
                actions: [
                  Padding(
                      padding: EdgeInsets.only(right: 20.w),
                      child: GestureDetector(
                        onTap: () {
                          print(selectedValue);
                          context
                              .read<UserCubit>()
                              .updateGenderData(username, selectedValue!.toLowerCase());
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
                child: Column(
                  children: [
                    DropdownButtonFormField2<String>(
                      isExpanded: true,
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      hint: const Text(
                        'Silahkan pilih gender',
                        style: TextStyle(fontSize: 14),
                      ),
                      items: genderItems
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ))
                          .toList(),
                      validator: (value) {
                        if (value == null) {
                          return 'Please select gender.';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        selectedValue = value;
                      },
                      onSaved: (value) {
                        selectedValue = value.toString();
                      },
                      buttonStyleData: const ButtonStyleData(
                        padding: EdgeInsets.only(right: 8),
                      ),
                      iconStyleData: const IconStyleData(
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black45,
                        ),
                        iconSize: 24,
                      ),
                      dropdownStyleData: DropdownStyleData(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                      ),
                    ),
                  ],
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
