import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solonomore_flutter/bloc/user/user_cubit.dart';
import 'package:solonomore_flutter/components/components.dart';
import 'package:solonomore_flutter/gen/gen.dart';

class PreferenceScreen extends StatefulWidget {
  const PreferenceScreen({super.key, required, required this.username});

  final String username;

  @override
  State<PreferenceScreen> createState() => _PreferenceScreen();
}

class _PreferenceScreen extends State<PreferenceScreen> {
  String? selectedValueRank;
  String? selectedValueRole;
  String? selectedValuePlayStyle;
  String? selectedValueCommunicationStyle;
  String? selectedValueGameMode;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    context.read<UserCubit>().getDataUser(widget.username);
    return BlocListener<UserCubit, UserState>(
      listener: (context, state) {
        if(state is UserSuccess) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => PreferenceScreen(username: widget.username),));
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Your Preference',
            style: StaticTextStyle.textStyleFs16Fw600(
                color: ColorName.colorTextPrimary,
                fontFamily: FontFamily.poppins),
          ),
        ),
        body: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            if (state is UserLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is UserGetSuccess) {
              final user = state.userModel;
              return Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 80),
                  child: ListView(
                    children: [
                      Text(
                        'Rank',
                        style: StaticTextStyle.textStyleFs14Fw400(
                          color: ColorName.colorTextPrimary,
                        ),
                      ),
                      const SizedBox(height: 10),
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
                          user.rank.toUpperCase(),
                          style: const TextStyle(fontSize: 14),
                        ),
                        items: rankItems
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
                            return 'Please select rank.';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          if(value == null) {
                            selectedValueRank = user.rank;
                          }
                          selectedValueRank = value;
                        },
                        onSaved: (value) {
                          selectedValueRank = value.toString();
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
                      const SizedBox(height: 20),
                      Text(
                        'Role',
                        style: StaticTextStyle.textStyleFs14Fw400(
                          color: ColorName.colorTextPrimary,
                        ),
                      ),
                      const SizedBox(height: 10),
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
                          user.role.toUpperCase(),
                          style: const TextStyle(fontSize: 14),
                        ),
                        items: roleItems
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
                            return 'Please select Role...';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          if(value == null) {
                            selectedValueRole = user.role;
                          }
                          selectedValueRole = value;
                        },
                        onSaved: (value) {
                          selectedValueRole = value.toString();
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
                      const SizedBox(height: 20),
                      Text(
                        'Play Style',
                        style: StaticTextStyle.textStyleFs14Fw400(
                          color: ColorName.colorTextPrimary,
                        ),
                      ),
                      const SizedBox(height: 10),
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
                          user.play_style.toUpperCase(),
                          style: const TextStyle(fontSize: 14),
                        ),
                        items: playStyleItems
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
                            return 'Please Play Style.';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          if(value == null) {
                            selectedValuePlayStyle = user.play_style;
                          }
                          selectedValuePlayStyle = value;
                        },
                        onSaved: (value) {
                          selectedValuePlayStyle = value.toString();
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
                      const SizedBox(height: 20),
                      Text(
                        'Communication Style',
                        style: StaticTextStyle.textStyleFs14Fw400(
                          color: ColorName.colorTextPrimary,
                        ),
                      ),
                      const SizedBox(height: 10),
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
                          user.communication_style.toUpperCase(),
                          style: const TextStyle(fontSize: 14),
                        ),
                        items: communicationStyleItems
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
                            return 'Please select communication style.';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          if(value == null) {
                            selectedValueCommunicationStyle = user.communication_style;
                          }
                          selectedValueCommunicationStyle = value;
                        },
                        onSaved: (value) {
                          selectedValueCommunicationStyle = value.toString();
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
                      const SizedBox(height: 20),
                      Text(
                        'Game Mode Preference',
                        style: StaticTextStyle.textStyleFs14Fw400(
                          color: ColorName.colorTextPrimary,
                        ),
                      ),
                      const SizedBox(height: 10),
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
                          user.game_mode.toUpperCase(),
                          style: const TextStyle(fontSize: 14),
                        ),
                        items: gameModeItems
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
                            value = user.game_mode;
                          }
                        },
                        onChanged: (value) {
                          print(value);
                          if(value == null) {
                            selectedValueGameMode = user.game_mode;
                          }
                          selectedValueGameMode = value;
                        },
                        onSaved: (value) {
                          selectedValueGameMode = value.toString();
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
                        SizedBox(height: 30.h,),
                    Text('* Silahkan restart aplikasi setelah melakukan perubahan', style: StaticTextStyle.textStyleFs12Fw500(color: ColorName.colorTextPrimary),),
                      const SizedBox(height: 10),
                      const SizedBox(height: 30),
                      GestureDetector(
                        onTap: () {
                          context.read<UserCubit>().updatePreferenceData(
                              widget.username,
                              selectedValueRank.toString().toLowerCase(),
                              selectedValueRole.toString().toLowerCase(),
                              selectedValuePlayStyle.toString().toLowerCase(),
                              selectedValueCommunicationStyle
                                  .toString()
                                  .toLowerCase(),
                              selectedValueGameMode.toString().toLowerCase());
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
                              'Submit',
                              style: StaticTextStyle.textStyleFs15Fw600(
                                  color: ColorName.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else if (state is UserFailure) {
              return Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 80),
                  child: ListView(
                    children: [
                      Text(
                        'Rank',
                        style: StaticTextStyle.textStyleFs14Fw400(
                          color: ColorName.colorTextPrimary,
                        ),
                      ),
                      const SizedBox(height: 10),
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
                          "Pilih Rank",
                          style: TextStyle(fontSize: 14),
                        ),
                        items: rankItems
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
                            return 'Please select rank.';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          if(value == null) {
                            selectedValueRank = value;
                          }
                          selectedValueRank = value;
                        },
                        onSaved: (value) {
                          selectedValueRank = value.toString();
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
                      const SizedBox(height: 20),
                      Text(
                        'Role',
                        style: StaticTextStyle.textStyleFs14Fw400(
                          color: ColorName.colorTextPrimary,
                        ),
                      ),
                      const SizedBox(height: 10),
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
                          "Pilih Role",
                          style: TextStyle(fontSize: 14),
                        ),
                        items: roleItems
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
                            return 'Please select Role...';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          if(value == null) {
                            selectedValueRole = value;
                          }
                          selectedValueRole = value;
                        },
                        onSaved: (value) {
                          selectedValueRole = value.toString();
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
                      const SizedBox(height: 20),
                      Text(
                        'Play Style',
                        style: StaticTextStyle.textStyleFs14Fw400(
                          color: ColorName.colorTextPrimary,
                        ),
                      ),
                      const SizedBox(height: 10),
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
                          "Pilih Play Style",
                          style: TextStyle(fontSize: 14),
                        ),
                        items: playStyleItems
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
                            return 'Please Play Style.';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          if(value == null) {
                            selectedValuePlayStyle = value;
                          }
                          selectedValuePlayStyle = value;
                        },
                        onSaved: (value) {
                          selectedValuePlayStyle = value.toString();
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
                      const SizedBox(height: 20),
                      Text(
                        'Communication Style',
                        style: StaticTextStyle.textStyleFs14Fw400(
                          color: ColorName.colorTextPrimary,
                        ),
                      ),
                      const SizedBox(height: 10),
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
                          "Pilih Communication Style",
                          style: TextStyle(fontSize: 14),
                        ),
                        items: communicationStyleItems
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
                            return 'Please select communication style.';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          if(value == null) {
                            selectedValueCommunicationStyle = value;
                          }
                          selectedValueCommunicationStyle = value;
                        },
                        onSaved: (value) {
                          selectedValueCommunicationStyle = value.toString();
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
                      const SizedBox(height: 20),
                      Text(
                        'Game Mode Preference',
                        style: StaticTextStyle.textStyleFs14Fw400(
                          color: ColorName.colorTextPrimary,
                        ),
                      ),
                      const SizedBox(height: 10),
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
                          "Pilih Game Mode",
                          style: TextStyle(fontSize: 14),
                        ),
                        items: gameModeItems
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
                        onChanged: (value) {
                          print(value);
                          if(value == null) {
                            selectedValueGameMode = value;
                          }
                          selectedValueGameMode = value;
                        },
                        onSaved: (value) {
                          selectedValueGameMode = value.toString();
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
                        SizedBox(height: 30.h,),
                    Text('* Silahkan restart aplikasi setelah melakukan perubahan', style: StaticTextStyle.textStyleFs12Fw500(color: ColorName.colorTextPrimary),),
                      const SizedBox(height: 10),
                      const SizedBox(height: 30),
                      GestureDetector(
                        onTap: () {
                          context.read<UserCubit>().updatePreferenceData(
                              widget.username,
                              selectedValueRank.toString().toLowerCase(),
                              selectedValueRole.toString().toLowerCase(),
                              selectedValuePlayStyle.toString().toLowerCase(),
                              selectedValueCommunicationStyle
                                  .toString()
                                  .toLowerCase(),
                              selectedValueGameMode.toString().toLowerCase());
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
                              'Submit',
                              style: StaticTextStyle.textStyleFs15Fw600(
                                  color: ColorName.white),
                            ),
                          ),
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
      ),
    );
  }
}
