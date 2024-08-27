import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solonomore_flutter/bloc/user/user_cubit.dart';
import 'package:solonomore_flutter/components/components.dart';
import 'package:solonomore_flutter/gen/gen.dart';
import 'package:solonomore_flutter/pages/main/team_making/widgets/user.dart';

class TeamMakingScreen extends StatelessWidget {
  const TeamMakingScreen({super.key, required this.username});

  final String username;

  @override
  Widget build(BuildContext context) {
    context.read<UserCubit>().getDataUser(username);
    return Scaffold(
      body: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if(state is UserLoading) {
            return const Center(child: CircularProgressIndicator(),);
          } else if(state is UserGetSuccess) {
            final user = state.userModel;
            return Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image:
                            Assets.images.icPartyRoomBackground.image().image,
                        fit: BoxFit.cover)),
              ),
              Container(
                height: double.infinity,
                width: double.infinity,
                color: ColorName.colorTextPrimary.withOpacity(0.5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        User(
                          username: user.username,
                          age: user.age.toString(),
                          gender: user.gender,
                          rank: user.rank,
                          role: user.role,
                          playStyle: user.play_style,
                          communicationStyle: user.communication_style,
                          gameMode: user.game_mode,
                        ),
                        User(
                          username: '-',
                          age: 0.toString(),
                          gender: '-',
                          rank: '-',
                          role: '-',
                          playStyle: '-',
                          communicationStyle: '-',
                          gameMode: '-',
                        )
                      ],
                    ),
                    SizedBox(
                      height: 21.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        User(
                          username: '-',
                          age: 0.toString(),
                          gender: '-',
                          rank: '-',
                          role: '-',
                          playStyle: '-',
                          communicationStyle: '-',
                          gameMode: '-',
                        ),
                        User(
                          username: '-',
                          age: 0.toString(),
                          gender: '-',
                          rank: '-',
                          role: '-',
                          playStyle: '-',
                          communicationStyle: '-',
                          gameMode: '-',
                        ),
                        User(
                          username: '-',
                          age: 0.toString(),
                          gender: '-',
                          rank: '-',
                          role: '-',
                          playStyle: '-',
                          communicationStyle: '-',
                          gameMode: '-',
                        )
                      ],
                    ),
                    SizedBox(
                      height: 60.h,
                    ),
                    const Divider(
                      color: ColorName.white,
                    ),
                    SizedBox(
                      height: 60.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        context.read<UserCubit>().findParty();
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 60.w),
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
                            'Mulai Pencarian',
                            style: StaticTextStyle.textStyleFs15Fw600(
                                color: ColorName.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
          } else if(state is UserFailure) {
            return const Center(child: Text('Silahkan isi data profile dan preference terlebih dahulu'),);
          }
           else if(state is FindPartyLoading) {
            return const Center(child: CircularProgressIndicator(),);
          } else if(state is FindPartySuccess) {
            final user = state.partyUsers;
            final userApi = state.userApi;
            return Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image:
                            Assets.images.icPartyRoomBackground.image().image,
                        fit: BoxFit.cover)),
              ),
              Container(
                height: double.infinity,
                width: double.infinity,
                color: ColorName.colorTextPrimary.withOpacity(0.5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        User(
                          username: userApi!.username,
                          age: userApi.age.toString(),
                          gender: userApi.gender,
                          rank: userApi.rank,
                          role: userApi.role,
                          playStyle: userApi.play_style,
                          communicationStyle: userApi.communication_style,
                          gameMode: userApi.game_mode,
                        ),
                         User(
                          username: user[0].username,
                          age: user[0].age.toString(),
                          gender: user[0].gender,
                          rank: user[0].rank,
                          role: user[0].role,
                          playStyle: user[0].play_style,
                          communicationStyle: user[0].communication_style,
                          gameMode: user[0].game_mode,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 21.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                       User(
                          username: user[1].username,
                          age: user[1].age.toString(),
                          gender: user[1].gender,
                          rank: user[1].rank,
                          role: user[1].role,
                          playStyle: user[1].play_style,
                          communicationStyle: user[1].communication_style,
                          gameMode: user[1].game_mode,
                        ),
                         User(
                          username: user[2].username,
                          age: user[2].age.toString(),
                          gender: user[2].gender,
                          rank: user[2].rank,
                          role: user[2].role,
                          playStyle: user[2].play_style,
                          communicationStyle: user[2].communication_style,
                          gameMode: user[2].game_mode,
                        ),
                       User(
                          username: user[3].username,
                          age: user[3].age.toString(),
                          gender: user[3].gender,
                          rank: user[3].rank,
                          role: user[3].role,
                          playStyle: user[3].play_style,
                          communicationStyle: user[3].communication_style,
                          gameMode: user[3].game_mode,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 60.h,
                    ),
                    const Divider(
                      color: ColorName.white,
                    ),
                    SizedBox(
                      height: 60.h,
                    ),
                    // GestureDetector(
                    //   onTap: () {
                    //     context.read<UserCubit>().findParty();
                    //   },
                    //   child: Container(
                    //     margin: EdgeInsets.symmetric(horizontal: 60.w),
                    //     width: double.infinity,
                    //     height: 48.h,
                    //     decoration: BoxDecoration(
                    //         gradient: const LinearGradient(colors: [
                    //           ColorName.primary,
                    //           ColorName.secondary
                    //         ]),
                    //         borderRadius: BorderRadius.circular(24.r)),
                    //     child: Center(
                    //       child: Text(
                    //         'Mulai Pencarian',
                    //         style: StaticTextStyle.textStyleFs15Fw600(
                    //             color: ColorName.white),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          );
          } 
          return Center(child: Text('Silahkan restart aplikasi setelah melakukan perubahan data', style: StaticTextStyle.textStyleFs14Fw400(color: ColorName.colorTextPrimary),textAlign: TextAlign.center),);
        },
      ),
    );
  }
}
